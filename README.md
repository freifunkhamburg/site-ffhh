#### How to build the Freifunk Hamburg Firmware

    git clone https://github.com/freifunk-gluon/gluon.git            # Get the official Gluon repository
    cd gluon
    git clone https://github.com/freifunkhamburg/site-ffhh.git site  # Get the Freifunk Hamburg site repository
    make update                                                    # Get other repositories used by Gluon
    make                                                           # Build Gluon

Please see [the official Gluon repository](https://github.com/freifunk-gluon/gluon) for an in-depth explanation of the build process.


#### Gluon versions used for specific Hamburg Freifunk Firmware builds

- 0.8.2: v2016.2.5
- 0.8.1: v2016.2.4 (ffhh-sued only)
- 0.8: v2016.1.4
- 0.7.1: v2015.1.2
- 0.7: v2015.1
- 0.6: v2014.4
- 0.5.1: v2014.3.1
- 0.5: v2014.3
- 0.4.2: v2014.2
 - note: no gluon fork used anymore
- 0.4.1: v2014.2-hh
 - equal to official gluon v2014.2 + ffhh specific patches
- 0.4a: v2014.1a
 - equal to official gluon v2014.1 + ffhh specific patches
