#
#
# makefile for hfd
#
# updated 29nov12



CC=gcc
CFLAGS= -Wall -I.
DEPS = hfd_print.h
OBJ = hfd.o hfd_print.o 

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hfd: $(OBJ)
	gcc -o $@ $^ $(CFLAGS)
