HC = ghc
HCFLAGS = -O3 -threaded -rtsopts

HS_BINARIES = $(patsubst %.hs, %, $(wildcard p*.hs))

%: %.hs
	$(HC) $(HCFLAGS) $^
	grep -xq "$@" .gitignore || echo $@ >> .gitignore

CC = clang
CFLAGS = -g -Wall -Wextra -std=gnu99

%: %.c
	$(CC) $(CFLAGS) $^ -o $@
	grep -xq "$@" .gitignore || echo $@ >> .gitignore

C_BINARIES = $(patsubst %.c, %, $(wildcard p*.c))

all: $(HS_BINARIES) $(C_BINARIES)

clean:
	rm -f $(C_BINARIES) $(HS_BINARIES) $(wildcard *.hi) $(wildcard *.o)
