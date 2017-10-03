SITE ?= ffhh

all: clean site.mk site.conf modules

.PHONY: clean
clean:
	rm -f site.mk site.conf modules

modules:
	erb -T- sites/defaults.erb sites/${SITE}.erb template/$@.erb >$@

site.conf:
	erb -T- sites/defaults.erb sites/${SITE}.erb template/$@.erb >$@

site.mk:
	erb -T- sites/defaults.erb sites/${SITE}.erb template/$@.erb >$@
