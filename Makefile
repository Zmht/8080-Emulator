CC=clang
CFLAGS=-Wall -Werror -pedantic -g -std=c99
SRC=src/emulator
OBJ=obj
SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))

PROJ_NAME=zemulator
BIN=bin/$(PROJ_NAME)


all: dir $(BIN) bin_maker 

dir:
	@mkdir -p obj
	@mkdir -p bin

bin_maker: src/binary_maker/binary_maker.c
	$(CC) $(CFLAGS) $< -o bin/$@

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f bin/* obj/*
