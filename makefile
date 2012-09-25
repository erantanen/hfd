#

#
#MAKEFILE FOR hfd
#
#Date created 20 sep 2012


CC=gcc
CFLAGS=-Wall -O
SRC1=hfd.c
OBJ1=$(SRC1:.c=.o)

P1=hfd


all: $(OBJ1) $(P1) 
	@echo created programs $(P1)  ...

$(OBJ1): $(SRC1)
	$(CC) $(CFLAGS) -c $<


	
$(P1): $(OBJ1)
	$(CC) $(CFLAGS) -o $@ $<
	


