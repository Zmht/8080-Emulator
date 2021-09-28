CC=clang
CFLAGS=-Wall -Werror -g
SRC=src/emulator
OBJ=obj
SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))

PROJ_NAME=zemulator
BIN=bin/$(PROJ_NAME)


all: $(BIN) bin_maker

bin_maker: src/binary_maker/binary_maker.c
	$(CC) $(CFLAGS) $< -o bin/$@


$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f bin/* obj/*