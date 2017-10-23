sites: clean info sites/ffhh sites/ffhh-sued

info: config/defaults.erb template/info.erb
	erb -T- config/defaults.erb template/$@.erb >$@

.PHONY: clean
clean:
	rm -rf sites
	rm -f info

sites/%: config/%.erb
	mkdir -p $@
	cd $@ && $(MAKE) -f ../../Makefile site SITE=$(@F)

site: siteclean site.mk site.conf modules i18n

.PHONY: siteclean
siteclean:
	rm -f site.mk site.conf modules

modules:
	erb -T- ../../config/defaults.erb ../../config/$(SITE).erb ../../template/$@.erb >$@

site.conf:
	erb -T- ../../config/defaults.erb ../../config/$(SITE).erb ../../template/$@.erb >$@

site.mk:
	erb -T- ../../config/defaults.erb ../../config/$(SITE).erb ../../template/$@.erb >$@

i18n:
	ln -s ../../i18n
