all: check_site site.mk site.conf modules

.PHONY: check_site
check_site:
	if test -z "${SITE}"; then echo Usage: make SITE=ffhh; exit 1; else true; fi

.PHONY: clean
clean:
	rm -f site.mk site.conf modules

modules:
	cp sites/${SITE}/$@ $@

site.conf:
	cp sites/${SITE}/$@ $@

site.mk:
	cp sites/${SITE}/$@ $@
