CC = gcc
CFLAGS = -W -g3
LD = ld
LDFLAGS = -lbluetooth
SRC = src
INC = -Iinclude

all: bluesnarfer

bluesnarfer: src/bluesnarfer.c
	$(CC) $(INC) $(CFLAGS) $(SRC)/bluesnarfer.c $(LDFLAGS) -o bluesnarfer

clean:
	rm bluesnarfer
