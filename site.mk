GLUON_MULTIDOMAIN := 1
GLUON_DEPRECATED := upgrade

GLUON_SITE_PACKAGES := \
	-gluon-config-mode-geo-location \
	-gluon-config-mode-contact-info \
	gluon-ebtables-source-filter \
	gluon-web-mesh-vpn-fastd \
	haveged \
	iptables \
	iwinfo

GLUON_FEATURES := \
	autoupdater \
	config-mode-domain-select \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	web-private-wifi \
	radv-filterd \
	respondd \
	status-page \
	web-advanced \
	web-wizard

# x86 and x86-64 add extra software
ifeq ($(GLUON_TARGET),$(filter $(GLUON_TARGET),x86-generic x86-64))
	GLUON_SITE_PACKAGES += \
		nano \
		htop \
		ethtool
endif

GLUON_PRIORITY ?= 7

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

GLUON_LANGS ?= en de
