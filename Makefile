PROJECTNAME=proj
APPNAME=foo
TARGETDIR=out

.PHONY: help
help:
	# -----------------------------------------------------------------------------
	# Targets:
	#
	#	help 						: show this message
	#	gen PROJECTNAME=proj APPNAME=foo TARGETDIR=out	: generate project
	#
	# end.
	# -----------------------------------------------------------------------------

.PHONY: gen
gen:
	mkdir -p $(TARGETDIR)/temp
	mkdir -p $(TARGETDIR)/$(PROJECTNAME)
	APPNAME=$(APPNAME) ./tools/mo templates/RootMakefile > $(TARGETDIR)/$(PROJECTNAME)/Makefile
	APPNAME=$(APPNAME) ./tools/mo templates/Dockerfile > $(TARGETDIR)/$(PROJECTNAME)/Dockerfile
	cd  $(TARGETDIR)/$(PROJECTNAME) && rebar3 new release $(APPNAME)
	APPNAME=$(APPNAME) ./tools/mo templates/AppMakefile > $(TARGETDIR)/$(PROJECTNAME)/$(APPNAME)/Makefile
	cd  $(TARGETDIR)/temp && git clone http://github.com/toddg/monitor && cd monitor && git checkout tags/v0.1.0 && $(MAKE) package
	cd $(TARGETDIR)/$(PROJECTNAME) && tar -zxvf ../temp/monitor/monitor.tgz
	APPNAME=$(APPNAME) ./tools/mo templates/docker-compose.yml > $(TARGETDIR)/$(PROJECTNAME)/monitor/docker-compose.yml
	cd $(TARGETDIR)/$(PROJECTNAME) && $(MAKE) selftest


.PHONY: clean
clean:
	# hardcode to ./out to prevent mistakenly blasting another directory
	rm -rf ./out
