# Makefile for yamdi

CC=gcc
CFLAGS=-O2 -Wall

yamdi: yamdi.c Makefile
	$(CC) $(CFLAGS) yamdi.c -o yamdi

clean: yamdi
	rm -f yamdi

install: yamdi
	install -m 0755 -o root yamdi /usr/local/bin
