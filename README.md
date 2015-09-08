Instructions
============

1. clone the repo:

`git clone git@github.com:kaymmm/bootstrap_hackintosh_ssdts.git`

2. initialize/update:
`git submodule init; git submodule update`

3. mount EFI partition

4. run setup.sh and follow the directions (not everything's automated right now. sorry):

`./setup.sh`

Notes:
* You will need to add the correct dict entries to the kextstopatch section of your config.plist
* Make sure the config.plist has drop oem enabled