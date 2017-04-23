
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
