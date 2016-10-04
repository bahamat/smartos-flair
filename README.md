# smartos-flair

Some piecies of flair for your (my) SmartOS.

This repo has a few nice-to-haves for SmartOS. It includes some scripts and
instance templates. It's mostly stuff created at some point when I wanted to
test something, and didn't want to recreate it later. It provides the
`/opt/custom` directory that I start with on standalone SmartOS compute nodes.

## How to use

1. Install the pkgsrc "tools" set in the gz <https://pkgsrc.joyent.com/install-on-illumos/>
2. `pkgin install git mozilla-rootcerts`
3. `cd /opt; git clone https://github.com/bahamat/smartos-flair custom`
