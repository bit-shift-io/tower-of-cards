Linux
=========
To check out on a machine, in the Projects directory run:
git clone git+ssh://s@192.168.1.2/~/GIT/TowerOfCards.git

Install required tools:

    ./Tools/install.sh

Note that this will set up docker to be able to do proper builds for you.

Basically everything to build/upload is done via:

    ./Tools/build.py

Windows
===========
Tools here are provided only for debugging, windows builds are generated on Linux

Install required tools:

    ./Tools/windows_install.bat

To do a windows specific build for debugging/testing:

    ./Tools/windows_build.bat

Release Procedure
===================
Using build.py in the git branch you want to make live, run the option "all the things" which will build, package data into Build/Demo, Full and Editor targets for Linux and Windows. It will then run unit tests and if all good, upload to steam and itch.
Once this has completed it will notify the #bitshift:matrig.org channel on failure or success (so I don't have to be baby the build).
Nothing it required for itch, the upload will be live straight away.

For Steam, login to https://partner.steamgames.com/ (I have to do this in my laptop to use my mobile hotspot to avoid the dodgey IP checking)

For the Full version, Editor and Demo, goto the App Admin page, click SteamPipe > Builds

https://partner.steamgames.com/apps/builds/878030
https://partner.steamgames.com/apps/builds/878040
https://partner.steamgames.com/apps/builds/1148800

For the top build, select "default" from the "Set build live on branch..." and press "Preview Change"


