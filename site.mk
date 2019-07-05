GLUON_MULTIDOMAIN := 1
GLUON_DEPRECATED := upgrade

GLUON_SITE_PACKAGES := -gluon-config-mode-geo-location \
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
	ebtables-limit-arp \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	radvd \
	respondd \
	status-page \
	web-advanced \
	web-wizard

# EXTRA_SOFTWARE_TOOLS_01
EXTRA_SOFTWARE_TOOLS_01 := \
        nano \
        htop \
        ethtool

# x86
ifeq ($(GLUON_TARGET),x86-generic)
GLUON_SITE_PACKAGES += \
    $(EXTRA_SOFTWARE_TOOLS_01)
endif

# x86-64
ifeq ($(GLUON_TARGET),x86-64)
GLUON_SITE_PACKAGES += \
    $(EXTRA_SOFTWARE_TOOLS_01)
endif

GLUON_PRIORITY ?= 7

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

GLUON_LANGS ?= en de
