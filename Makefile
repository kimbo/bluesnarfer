CC = gcc
CFLAGS = -W -g3
LD = ld
LDFLAGS = -lbluetooth
SRC = src
INC = -Iinclude

all: bluesnarfer

bluesnarfer:
	$(CC) $(INC) $(CFLAGS) $(LDFLAGS) $(SRC)/bluesnarfer.c -o bluesnarfer

