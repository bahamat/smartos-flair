# smartos-flair

Some piecies of flair for your (my) SmartOS.

This repo has a few nice-to-haves for SmartOS. It includes some scripts and
instance templates. It's mostly stuff created at some point when I wanted to
test something, and didn't want to recreate it later. It provides the
`/opt/custom` directory that I start with on standalone SmartOS compute nodes.

## How to use

The preferred way is to install the pkgsrc "tools" set in the gz
<https://pkgsrc.joyent.com/install-on-illumos/> first.

    pkgin install git mozilla-rootcerts
    cd /opt; git clone https://github.com/bahamat/smartos-flair custom
    svccfg import /opt/custom/smf/*

If you're not using pkgsrc, you can still get some flair. This method doesn't
validate GitHub's SSL certificate, so use with care.

    curl -k -LOC - https://github.com/bahamat/smartos-flair/archive/master.tar.gz
    gtar zxf master.tar.gz
    mv smartos-flair-master custom
    svccfg import /opt/custom/smf/*
