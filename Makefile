APPNAME=foo
TARGETDIR=out

.PHONY: gen
gen:
	mkdir -p $(TARGETDIR)/$(APPNAME)
	APPNAME=$(APPNAME) ./tools/mo templates/RootMakefile > $(TARGETDIR)/$(APPNAME)/Makefile
	APPNAME=$(APPNAME) ./tools/mo templates/Dockerfile > $(TARGETDIR)/$(APPNAME)/Dockerfile
		
