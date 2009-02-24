# Makefile for yamdi

CFLAGS=-O2 -Wall

yamdi: yamdi.c
	gcc $(CFLAGS) yamdi.c -o yamdi

clean: yamdi
	rm -f yamdi

install: yamdi
	install $(INSTALL_FLAGS) -m 4755 -o root yamdi $(DESTDIR)/usr/bin
