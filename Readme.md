# my development machine build guide

This is a semi-automated guide to configure my system.

This repo contains some scripts to configure different system settings, and also
all the relevant dotfiles for the software that I use more frequently.

## OSX configuration

To configure the basic OS stuff, just run the following command and restart
the computer afterwards:

    $ osx/configure.sh

The following steps will install and configure the needed tools and apps for
development. First install the XCode command line tools:

    $ xcode-select --install

Then install homebrew:

    $ osx/apps/homebrew.sh

The last step is to install and configure several apps/utilities:

    $ osx/apps/alfred.sh
    $ osx/apps/chrome.sh
    $ osx/apps/cyberduck.sh
    $ osx/apps/iterm2.sh
    $ osx/apps/limechat.sh
    $ osx/apps/quicklookplugins.sh
    $ osx/apps/slate.sh
    $ osx/apps/sublimetext3.sh
    $ osx/apps/transmission.sh
    $ osx/apps/vagrant.sh
    $ osx/apps/videolan.sh

## Manual OSX configuration

There is some stuff in OSX that has to be configured manually:

### Mission control

Create 2 spaces in Mission control

### iPhone

Connect the iPhone and Open `Image Capture`. Then select the iPhone and change
the select box to: "Connecting this device opens: No Application"

### Photoshop configuration

Once Adobe Photoshop has been manually installed, execute:

    $ photohop/configure.sh

Then, enable the custom profile. Go to `Window → Workspace` and select the `rafeca workspace`.

Reduce the Cache Levels. Go to `Photoshop → Preferences → Performance`. Enter a value of `1` in the Cache Levels text box.

Reduce Amount of History States. Go to `Photoshop → Preferences → Performance`. Enter `10` in the History States text box.

Disable Export Clipboard. Go to `Photoshop → Preferences → General`. Deselect Export Clipboard.

Configure color profiles. Go to `Edit -> Color profiles` and set RGB space to `sRGB IEC61966-2.1`. The color management policy for RGB should be "Convert to Working RGB".

## Debian configuration

This repo can also be used to configure debian systems. To do so, just run:

    $ debian/configure.sh

## Common configuration

This is the basic configuration, which is common for OSX/Linux.

This must be executed after configuring all the other stuff.

    $ zsh/configure.sh
    $ git/configure.sh
    $ vim/configure.sh
    $ nodejs/configure.sh
    $ ruby/configure.sh
    $ python/configure.sh
    $ tmux/configure.sh
