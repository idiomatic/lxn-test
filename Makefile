APP=winscream
OS=windows
ARCH=386
LIBWALK=pkg/$(OS)_$(ARCH)/github.com/lxn/walk.a
GOENV=GOOS=$(OS) GOARCH=$(ARCH) CGO_ENABLED=0 GOPATH="`pwd`"
# sudo port install i386-mingw32-binutils i386-mingw32-gcc
WINDRES=/opt/local/bin/i386-mingw32-windres

dist: $(APP).exe
	cp $(APP).exe ~/Downloads/
	cp $(APP).exe.manifest ~/Downloads/

$(APP).exe: $(APP).go #$(APP).syso
	env $(GOENV) go build -ldflags="-H windowsgui" -o $@ $(APP).go

$(APP).exe: $(LIBWALK)

$(LIBWALK):
	env $(GOENV) go get github.com/lxn/walk

#$(APP).syso: $(APP).rc $(APP).exe.manifest
#	$(WINDRES) --input $(APP).rc --output $@

.PHONY: clean

clean:
	-rm $(APP).exe #$(APP).syso
