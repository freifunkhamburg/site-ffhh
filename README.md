#### How to build the Freifunk Hamburg Firmware

	$ git clone -b v2017.1.x https://github.com/freifunk-gluon/gluon.git
	$ git clone -b v0.9.0 https://github.com/freifunkhamburg/site-ffhh.git
	$ cd site-ffhh

	To build all domains into the subdirectory firmware:
	$ ./build -g ../gluon -o firmware
	To build a specific domain (for example ffhh-nowe) into the subdirectory firmware:
	$ ./build -g ../gluon -l ffhh-nowe -o firmware
	To build two specific domains (for example ffhh-nowe and ffhh-sued) into the subdirectory firmware:
	$ ./build -g ../gluon -l ffhh-nowe,ffhh-sued -o firmware

	The build.sh supports the argument -b if you wish to also build firmware images marked as broken in gluon.

Please see [the official Gluon repository](https://github.com/freifunk-gluon/gluon) for an in-depth explanation of the build process.


#### Gluon versions used for specific Hamburg Freifunk Firmware builds

- 0.9.0: site-ffhh: xxx, gluon: v2017.1.x (9295abcea7b016b0fe4b05c534ea0731b48ef593)
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
