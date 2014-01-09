# my development machine build guide

This is a semi-automated guide to configure my system.

This repo contains some scripts to configure different settings of OSX, and also
all the relevant dotfiles for the software that I use more frequently.

This README file aims to be a step by step guide to transform a fresh OSX install
into my regular development machine.

## Basic software to install

First thing to do is to install the most basic software that I use. All those apps
are free and can be downloaded and easily installed:

* Google Chrome Canary
* Firefox Aurora
* Sublime Text 3
* Alfred
* iTerm2
* Slate
* Transmission
* CyberDuck
* VirtualBox
* VideoLAN
* Textual

## OSX configuration

To configure OSX the way I love it, download this repo and run the following command:

    $ osx/configure.sh

Restart your computer after running this command to be sure that all the changes
take effect

## Development stuff

The following steps will install and configure the needed tools and apps for
development.

Install Command line tools for XCode:

    $ xcode-select --install

Install homebrew:

    $ utils/homebrew

Install and configure several apps/utilities:

    $ zsh/configure.sh
    $ git/configure.sh
    $ iterm2/configure.sh
    $ sublimetext3/configure.sh
    $ vim/configure.sh
    $ transmission/configure.sh
    $ slate/configure.sh
    $ nodejs/configure.sh
    $ ruby/configure.sh
    $ python/configure.sh

Install manually the following Sublime Packages:

* EditorConfig
* LESS
* sass
* SublimeLinter (TODO: Not yet available for ST3)

## Mission control

Create 2 spaces in Mission control

## Synchronization with cloud services.

* Go to `preferences -> iCloud` and sync Contacts, Calendars, Reminders, Notes,
  Safari and Documents & Data (do not syncronize mail).
* Go to `preferences -> Internet Accounts` and add Google (only Calendar syncronization).

## iPhone

Connect the iPhone and Open `Image Capture`. Then select the iPhone and change
the select box to: "Connecting this device opens: No Application"

## Additional software

Next, install the needed non-free apps (avoid Office as long as you can):

* iLife '11
* iWork '09
* Adobe Photoshop

### Photoshop configuration

When the Photoshop installer finishes execute:

    $ photohop/configure.sh

Enable the custom profile. Go to `Window → Workspace` and select the `rafeca workspace`.

Reduce the Cache Levels. Go to `Photoshop → Preferences → Performance`. Enter a value of `1` in the Cache Levels text box.

Reduce Amount of History States. Go to `Photoshop → Preferences → Performance`. Enter `10` in the History States text box.

Disable Export Clipboard. Go to `Photoshop → Preferences → General`. Deselect Export Clipboard.

Configure color profiles. Go to `Edit -> Color profiles` and set RGB space to `sRGB IEC61966-2.1`. The color management policy for RGB should be "Convert to Working RGB".

# Debian configuration

This repo can also be used to configure debian systems. To do so, just run:

    $ debian/configure.sh

This will install some basic utilities. From here you can install and configure
the other stuff:

    $ zsh/configure.sh
    $ git/configure.sh
    $ vim/configure.sh
    $ nodejs/configure.sh
    $ ruby/configure.sh
    $ python/configure.sh
