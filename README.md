TechLit - Image Interview
===

Imagine that we have a busy library with a custom desktop.

Background
---
We have always had a catalog app that lists all the books on-site, but patrons still can't seem to find what they're looking for! So we just built a new search app, which we want to add to all our computers.

Getting Started
---
We are using Vagrant to build our desktop as VirtualBox images. Here's how you can get started:
  1) Install [Vagrant](https://www.vagrantup.com/downloads).
  2) Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
   
     - Download the installer or binary for whichever platform you're on *(under `VirtualBox 6.X.X platform Packages`)*.
     
     - If you're on MacOS and the installation fails, you may need to [temporarily disable SIP](https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection).

  3) Install the [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads).

     - Download the universal package *(use the `All supported platforms` link under `VirtualBox 6.X.X Oracle VM VirtualBox Extension Pack`)*.

     - If you're on MacOS and disabled SIP, you need to [enable it](https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection) before continuing.

  4) Use git to clone [this repo](./).
  5) From inside the repo, successfully run `vagrant up` to download our base image and provision the library's software *(this will take a while and cost at least 4 gigs)*.
  6) Use a combination of the VirtualBox GUI, `vagrant ssh`, and your favorite text editor to get our search app ready for deployment.

TODO
---
To get the search app into the hands of our patrons, here are a few things we need help with:
  1) Installing the search app (adding code to `provision.bash`)
  2) Runing the search app when the machine boots (creating and enabling a `search.service`)
  3) Adding the search app to the homepage (adding a bootstrap card to `index.html`)
  4) Adding a search app launcher to the desktop (creating and installing a `Search.desktop`)

Hints
---
- The catalog app is a full example you should reference
- The webpages use [Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
- The apps use [Sinatra](http://sinatrarb.com/intro.html)
- The image is Linux Mint 19 with the Cinnamon desktop (Mint is a derivative of Ubuntu and Debian)
- You may find [Ruby Monk](https://rubymonk.com/) useful for `Vagrantfile` or `*.rb` fiddling
- You may find [The Bash Hacker's Wiki](https://wiki.bash-hackers.org/) useful for provisioning
