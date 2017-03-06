
require 'trollop'
require 'open3'
require 'json'
require 'logger'
require 'fileutils'
require 'parallel'

$opts = Trollop::options do
  opt :parallel, "Number of repos to clone in parallel", required: false, type: :int, short: "-p", default: 8
  opt :target, "Target dir", required: false, type: :string, short: "-t", default: File.dirname(__FILE__)
  opt :repos, "JSON formatted repos file", required: true, type: :string, short: "-r"
  opt :log, "Log file location (defaults to STDOUT)", required: false, type: :string, short: "-l"
end

$logger = Logger.new($opts[:log] || $stdout)
$target_base = File.expand_path($opts[:target])

if !File.exist?($target_base) || !File.directory?($target_base)
  begin
    $logger.info("target dir #{$target_base} invalid, trying to create")
    FileUtils.mkdir_p($target_base)
  rescue Errno::EACCES => e
    $logger.error("insufficient permissions to create dir #{$target_base}")
  rescue Exception => e
    $logger.error("while creating dir #{$target_base}: #{e.class}, #{e.message}")
  end
end

if !File.exist?($opts[:repos])
  $logger.error("no such file #{$opts[:repos]}")
  exit 1
end

$repos = begin
           JSON.parse(File.read($opts[:repos]))
         rescue JSON::ParserError => e
           $logger.error("can't parse file (JSON error) #{$opts[:repos]}")
           exit 1
         rescue Exception => e
           $logger.error("can't parse file #{$opts[:repos]} (#{e.class}, #{e.message}")
           exit 1
         end

Parallel.each($repos, in_threads: $opts[:parallel]) do |repo_name, repo_address|
  Open3.popen2e("git clone #{repo_address} #{File.join($target_base, repo_name)}") do |stdin, stdout_err, wait_thr|
    while !stdout_err.eof? && (next_line = stdout_err.readline) do
      $logger.info "[Cloning #{repo_name}] #{next_line}"
    end
    if wait_thr.value.success?
      $logger.info "[Cloning #{repo_name}] SUCCESS: #{wait_thr.value}"
    else
      $logger.info "[Cloning #{repo_name}] FAILED: #{wait_thr.value}"
    end
  end
end
