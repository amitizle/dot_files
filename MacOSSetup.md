
# Guide for setting up a general Development environment on MacOS

## Basic CLI tools / package management

### XCode

XCode inclues basic development packages such as `git`, `svn`, `make` etc.

```bash
$ xcode-select --install
```

Most of the packages can (and IMO should) be replaced with a newer version that can
be installed mostly through _Homebrew_.

### Homebrew

First install [_Homebrew_](https://brew.sh/) ([Docs](http://docs.brew.sh/)):

```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then:

```bash
$ brew doctor
$ brew update
```

### RVM

For [RVM](https://rvm.io/) to work we'll need first to install `gpg`:

```bash
$ brew install gnupg2
```

And then:

```bash
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable
```

> NOTE: it's recommended to check the official [installation guide](https://rvm.io/rvm/install) before installing _RVM_.

Finally we'll install a default _Ruby_:

```bash
$ rvm install 2.3.3
$ rvm use 2.3.3 --default
```

Also, one might add `gem: --no-rdoc --no-ri` to the `~/.gemrc` file:

```bash
$ echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
```

### Newer versions of CLI tools

#### cURL
```bash
$ brew install curl --with-libssh2 --with-nghttp2 --with-openssl
```

> See `brew info curl` for more installation options and explanation on the ones above.

#### Git

```bash
$ brew install git
```

Additionally we'll install `tig`:

```bash
$ brew install tig
```

#### Make / cmake

```bash
$ brew install autoconf make cmake automake
```

#### Gnu core utils

Provide with [gnu core utils](https://www.gnu.org/software/coreutils/coreutils.html) like `greadlink` etc.

```bash
$ brew install coreutils
```

#### All other brew apps

```bash
$ brew install aalib
$ brew install adns
$ brew install aften
$ brew install android-platform-tools
$ brew install aspcud
$ brew install aspell
$ brew install atk
$ brew install aview
$ brew install boost
$ brew install c-ares
$ brew install cairo
$ brew install camlp4
$ brew install clasp
$ brew install cloog
$ brew install cloog018
$ brew install colordiff
$ brew install cowsay
$ brew install cscope
$ brew install dirmngr
$ brew install docker-completion
$ brew install dos2unix
$ brew install enchant
$ brew install exercism
$ brew install faac
$ brew install faad2
$ brew install ffmpeg
$ brew install findutils
$ brew install fontconfig
$ brew install fortune
$ brew install freetype
$ brew install gawk
$ brew install gcc49
$ brew install gcc@4.9
$ brew install gd
$ brew install gdbm
$ brew install gdk-pixbuf
$ brew install geoip
$ brew install gettext
$ brew install glib
$ brew install gmp
$ brew install gmp4
$ brew install gmp@4
$ brew install gnu-getopt
$ brew install gnu-indent
$ brew install gnu-sed
$ brew install gnu-tar
$ brew install gnupg
$ brew install gnupg2
$ brew install gnutls
$ brew install go
$ brew install gobject-introspection
$ brew install gperftools
$ brew install gpg-agent
$ brew install gpgme
$ brew install graphviz
$ brew install gringo
$ brew install gsettings-desktop-schemas
$ brew install harfbuzz
$ brew install hicolor-icon-theme
$ brew install htop
$ brew install icu4c
$ brew install imagemagick
$ brew install isl011
$ brew install isl@0.11
$ brew install isl@0.12
$ brew install iso-codes
$ brew install jansson
$ brew install jemalloc
$ brew install jpeg
$ brew install lame
$ brew install libassuan
$ brew install libcaca
$ brew install libdca
$ brew install libepoxy
$ brew install libev
$ brew install libevent
$ brew install libffi
$ brew install libgcrypt
$ brew install libgit2
$ brew install libgpg-error
$ brew install libksba
$ brew install libmpc08
$ brew install libmpc@0.8
$ brew install libogg
$ brew install libpng
$ brew install libssh2
$ brew install libtasn1
$ brew install libtermkey
$ brew install libtiff
$ brew install libtool
$ brew install libunistring
$ brew install libusb
$ brew install libusb-compat
$ brew install libuv
$ brew install libvorbis
$ brew install libvterm
$ brew install libxml2
$ brew install libyaml
$ brew install lua
$ brew install lynx
$ brew install macvim
$ brew install mercurial
$ brew install moreutils
$ brew install mpfr
$ brew install mpfr2
$ brew install mpfr@2
$ brew install msgpack
$ brew install mutt
$ brew install nettle
$ brew install nghttp2
$ brew install nmap
$ brew install npth
$ brew install opencore-amr
$ brew install openssl
$ brew install p11-kit
$ brew install pandoc
$ brew install pango
$ brew install pcre
$ brew install perl
$ brew install perl-build
$ brew install pinentry
$ brew install pixman
$ brew install pkg-config
$ brew install pth
$ brew install py2cairo
$ brew install pygobject
$ brew install python
$ brew install python3
$ brew install qt
$ brew install readline
$ brew install rename
$ brew install ruby
$ brew install ruby-build
$ brew install ruby-install
$ brew install rust
$ brew install sbcl
$ brew install screenfetch
$ brew install screenresolution
$ brew install shared-mime-info
$ brew install socat
$ brew install spdylay
$ brew install sqlite
$ brew install terminal-notifier
$ brew install the_silver_searcher
$ brew install toilet
$ brew install tokyo-cabinet
$ brew install tree
$ brew install unibilium
$ brew install unixodbc
$ brew install utf8proc
$ brew install v8
$ brew install vagrant-completion
$ brew install vim
$ brew install webp
$ brew install weechat
$ brew install wget
$ brew install wxmac
$ brew install x264
$ brew install xvid
$ brew install xz
$ brew install youtube-dl
```

#### Bash / ZSH

The version of _Bash_ that is being shipped with MacOS is an old one.
We'll use `dscl` and not manually alter `/ets/shells` && `chsh` (mentioned in [this post](https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/)).

**Bash**:

```bash
$ brew install bash
```

**ZSH**:

```bash
$ brew install bash
```

Then, assuming `$USER` is the user and `$NEW_SHELL` is the newly installed shell:

```bash
$ sudo dscl . -create /Users/$USER UserShell /usr/local/bin/$NEW_SHELL
```

Then, if you're using _iTerm2_ (or probably any other advanced terminal emulator) you can also add
the newly installed `/usr/loca/bin/$NEW_SHELL` as the command to run upon startup. For example:

```
/usr/loca/bin/zsh --login
```

### Tmux setup

First, install tmux:

```bash
$ brew install tmux
```

And `reattach-to-user-namespace`, for being able to use [tmux-yank](https://github.com/tmux-plugins/tmux-yank)

```bash
$ brew install reattach-to-user-namespace
```

Then, we'll add some of [tpm](https://github.com/tmux-plugins/tpm) (tmux plugin manager);

```bash
$ mkdir -p ~/.tmux/plugins
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

And then add to your tmux config file (`~/.tmux.conf`):

```
set-option -g default-command 'reattach-to-user-namespace -l zsh'

# List of plugins
set -g @plugin 'tmux-plugins/tpm' # https://github.com/tmux-plugins/tpm */
set -g @plugin 'tmux-plugins/tmux-yank' # https://github.com/tmux-plugins/tmux-yank

# Plugins config
set -g @yank_selection 'primary' # tmux-yank clipboard

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

Finally run

```bash
$ tmux source ~/.tmux.conf
```

And (assuming the preferred prefix is _Ctrl + b_), press _Ctrl + b + I_ (capital I).
This will install the plugins (i.e. `tmux-yank`).

### Some apps

  * [iTerm2](https://www.iterm2.com/downloads.html)
  * [Docker](https://store.docker.com/editions/community/docker-ce-desktop-mac?tab=description) ([direct link](https://download.docker.com/mac/stable/Docker.dmg))
  * [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  * [Firefox](https://www.mozilla.org/en-US/firefox/new/)
  * [Google Chrome](https://www.google.com/chrome/)
  * [Spectacle](https://www.spectacleapp.com/)
  * IM
    * [Slack](https://slack.com/downloads/osx)
    * [Telegram](https://desktop.telegram.org/)
    * [Whatsapp](https://www.whatsapp.com/download/)
  * [Gimp](https://www.gimp.org/downloads/)
  * [VLC](http://www.videolan.org/vlc/download-macosx.html)

> NOTE: it's possible to install all/some of the above by using [_Homebrew Cask_](https://caskroom.github.io/)
> Search those with `brew cask search <appname>`

### Vagrant

After installing _VirtualBox_, get [Vagrant](https://www.vagrantup.com/downloads.html) and install it.
Another option is to use _Homebrew Cask_:

```bash
$ brew cask install vagrant
```

Then, we'll install some nice plugins:

```bash
$ vagrant plugin install vagrant-vbguest
$ vagrant plugin install facter
```

Some more plugins are listed [in here](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins)

### MacOS settings

  * [Disable Siri](http://osxdaily.com/2016/11/28/disable-siri-on-mac/)
  * Disable notifications on lock screen: System Preferences -> Notifications, and then on each application's notification settings.
  * Spotlight: disable indexing of unnecessary things; System Preferences -> Spotlight -> General.
