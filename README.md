TechLit - Image Interview
===

Imagine that we have a busy library with a custom desktop.

Background
---
We have always had a catalog app that lists all the books on-site, but patrons still can't seem to find what they're looking for! So we just built a new search app, which we want to add to all our computers.

Getting Started
---
We are using Vagrant to build our desktop as VirtualBox images. Here's how you can get started:

  1) Have a comfy terminal.

     - If you're on MacOS, [iTerm2](https://iterm2.com/) is a good place to start
     - If you're on Windows, [Cmder](https://github.com/pmihalcin/cmder-git-bash-windows) is best ([video version](https://www.youtube.com/watch?v=ncBPkuhpszY))

  2) Install [Vagrant](https://www.vagrantup.com/downloads).
  3) Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
   
     - Download the installer or binary for whichever platform you're on *(under `VirtualBox 6.X.X platform Packages`)*.
     
     - If you're on MacOS and the installation fails, you may need to [temporarily disable SIP](https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection).

  4) Install the [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads).

     - Download the universal package *(use the `All supported platforms` link under `VirtualBox 6.X.X Oracle VM VirtualBox Extension Pack`)*.

     - If you're on MacOS and disabled SIP, you need to [enable it](https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection) before continuing.

  5) Use git to clone [this repo](./)

     - If you're on Windows, then [git may convert all LF characters into CRLF characters](https://stackoverflow.com/a/20653073), which breaks the ruby apps, so you probably want to set core.autocrlf to input when cloning: `git clone -c core.autocrlf=input https://github.com/TechLit/interview-kiosk` 

  5) From inside the repo, successfully run `vagrant up` to download our base image and provision the library's software *(this will take a while and cost at least 4 gigs)*.

     - If you're on MacOS and virtualbox fails to run, you might need to allow Oracle to run things. You'll see that something was blocked from the General tab of the Security Page in your System Preferences app.

  6) Read `Vagrantfile`, then `provision.bash`. These are the files you'll be contributing to.
  
     - Chances are, your OS won't open all of the relevant source files in the same editor or IDE, which could cause you to waste lots of memory. If you want a smoother experience, you should open the entire repo in your favorite editor or IDE.
  
  7) Get our search app ready for deployment (finish the TODOs).

TODO
---
To get the search app into the hands of our patrons, here are a few things we need help with:
  1) Install the search app (add a `configure_search` function to `provision.bash` that copies files onto the image)
  2) Run the search app when the machine boots (creating a `search.service` and installing it in `configure_search`)
  3) Add the search app to the homepage (adding a bootstrap card to `index.html`)
  4) Add a search app launcher to the desktop (creating and installing a `Search.desktop`)
  5) *_BONUS_*: All these apps could use a few extra features like links between apps or sorting. Add whatever features you're comfortable with!

Hints
---
- You can make changes directly to the image through VirtualBox, but we ultimately want to update `provision.bash`, so the changes can be reproduced.
- To test changes to the code, I used `vagrant destroy` followed by `vagrant up`, but you might find a better way.
- Sometimes, I like to use `vagrant ssh` to find and edit files, because my native environment is more comfortable than the VirtualBox environment.
- The catalog app has a `Catalog.desktop` file, `catalog.service` file and a `configure_catalog` function that you should reference.
- The `*.desktop` and `*.service` files are `systemd` files. Here's the Arch Wiki page for [`systemd`](https://wiki.archlinux.org/index.php/systemd).
- The webpages use [Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
- The apps use [Sinatra](http://sinatrarb.com/intro.html)
- The image is Linux Mint 19 with the Cinnamon desktop (Mint is a derivative of Ubuntu and Debian)
- You may find [Ruby Monk](https://rubymonk.com/) useful for `Vagrantfile` or `*.rb` fiddling
- You may find [The Bash Hacker's Wiki](https://wiki.bash-hackers.org/) useful for provisioning
