sites: sites/ffhh sites/ffhh-sued

sites/%: config/%.erb
	mkdir -p $@
	cd $@ && $(MAKE) -f ../../Makefile site SITE=$(@F)

site: clean site.mk site.conf modules

.PHONY: clean
clean:
	rm -f site.mk site.conf modules

modules:
	erb -T- ../../config/defaults.erb ../../config/$(SITE).erb ../../template/$@.erb >$@

site.conf:
	erb -T- ../../config/defaults.erb ../../config/$(SITE).erb ../../template/$@.erb >$@

site.mk:
	erb -T- ../../config/defaults.erb ../../config/$(SITE).erb ../../template/$@.erb >$@
