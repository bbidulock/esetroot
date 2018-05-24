IMLIB_CFLAGS	= $(shell imlib2-config --cflags)
IMLIB_LIBS	= $(shell imlib2-config --libs)
DEFINES		= -DPIXMAP_SUPPORT -DHAVE_UNISTD_H

VERSION	= 20030422
INSTALL	= install
PREFIX	= /usr
BINDIR	= $(PREFIX)/bin

SOURCES = Esetroot.c Makefile

all: Esetroot

Esetroot: Esetroot.c
	$(CC) $(CFLAGS) $(IMLIB_CFLAGS) $(IMLIB_LIBS) $(DEFINES) -o $@ $<

install: Esetroot
	mkdir -m 755 -p $(INSTALLROOT)$(BINDIR)
	$(INSTALL) -m 755 Esetroot $(INSTALLROOT)$(BINDIR)

clean:
	rm -f Esetroot

distclean: clean
	rm -f *~ \#* Esetroot-*.tar.bz2

tar: distclean
	rm -rf Esetroot-$(VERSION) Esetroot-$(VERSION).tar.bz2
	mkdir Esetroot-$(VERSION)
	cp $(SOURCES) Esetroot-$(VERSION)
	tar cvvfj Esetroot-$(VERSION).tar.bz2 Esetroot-$(VERSION)
	tar cvvfz Esetroot-$(VERSION).tar.gz Esetroot-$(VERSION)
	rm -rf Esetroot-$(VERSION)
