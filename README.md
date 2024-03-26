#### How to build the Freifunk Hamburg Firmware

	In the next two commands replace GLUON_VERSION and SITE_VERSION with the actual version numbers.
	$ git clone -b GLUON_VERSION https://github.com/freifunk-gluon/gluon.git
	$ git clone -b SITE_VERSION https://github.com/freifunkhamburg/site-ffhh.git
	$ cd site-ffhh

	To build the firmware into the subdirectory firmware:
	$ ./build.sh -g ../gluon -o firmware

	The build.sh supports the argument -b if you wish to also build firmware images marked as broken in gluon.

Please see [the official Gluon repository](https://github.com/freifunk-gluon/gluon) for an in-depth explanation of the build process.


#### Gluon versions used for specific Hamburg Freifunk Firmware builds

- v2023.2.2.0: site-ffhh: v2023.2.2.0, gluon: v2023.2.2
- v2023.1.2.0: site-ffhh: v2023.1.2.0, gluon: v2023.1.2
- v2022.1.4.0: site-ffhh: v2022.1.4.0, gluon: v2022.1.4
- v2022.1.3.0: site-ffhh: v2022.1.3.0, gluon: v2022.1.3 (nur experimental verteilt)
- v2021.1.2.0: site-ffhh: v2021.1.2.0, gluon: v2021.1.2
- v2021.1.1.0: site-ffhh: v2021.1.1.0, gluon: v2021.1.1
- v2020.2.3.0: site-ffhh: v2020.2.3.0, gluon: v2020.2.3
- v2020.2.2.0: site-ffhh: v2020.2.2.0, gluon: v2020.2.2
- v2020.1.4.0: site-ffhh: v2020.1.4.0, gluon: v2020.1.4
- v2020.1.3.0: site-ffhh: v2020.1.3.0, gluon: v2020.1.3
- v2019.1.2.0: site-ffhh: v2019.1.2.0, gluon: v2019.1.2
- v2018.2.3.0: site-ffhh: v2018.2.3.0, gluon: v2018.2.3
- v2018.2.1.0: site-ffhh: v2018.2.1.0, gluon: v2018.2.1
- v2018.1.4.2: site-ffhh: v2018.1.4.2, gluon: v2018.1.4
- v2018.1.4.1: site-ffhh: v2018.1.4.1, gluon: v2018.1.4
- v2018.1.4.0: site-ffhh: v2018.1.4.0, gluon: v2018.1.4
- v2018.1.3.0: site-ffhh: v2018.1.3.0, gluon: v2018.1.3
- v2018.1.1.0: site-ffhh: v2018.1.1.0, gluon: v2018.1.1
- v2018.1.0.0: site-ffhh: v2018.1.0.0, gluon: v2018.1 (never rolled out due to issues with the auto updater in gluon)
- 0.9.2: site-ffhh: v0.9.2, gluon: v2017.1.8
- 0.9.1: site-ffhh: v0.9.1, gluon: v2017.1.5
- 0.9.0: site-ffhh: 60f30382209ffc050baa82be9bad3622a1d88d5b, gluon: v2017.1.x (9295abcea7b016b0fe4b05c534ea0731b48ef593) (never rolled out due to 0.9.1)
- 0.8.6: v2016.2.7 Fix gw01-new key, add 3.ntp.services.ffhh to NTP servers, add Firmware signing keys for Alexander and Olli, remove old domain
- 0.8.5: v2016.2.7 Domain split, new package: ffho-ebtables-net-rules
- 0.8.4: v2016.2.7 (updated openwrt/package/network/services/dnsmasq/Makefile: PKG\_VERSION:=2.78 & PKG\_MD5SUM:=6d0241b72c79d2b510776ccc4ed69ca4)
- 0.8.3: v2016.2.6 (ffhh-sued only)
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
