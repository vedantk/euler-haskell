HC = ghc
HCFLAGS = -O3 -threaded -rtsopts

BINARIES = $(patsubst %.hs, %, $(wildcard p*.hs))

all: $(BINARIES)

%: %.hs
	$(HC) $(HCFLAGS) $^
	grep -xq "$@" .gitignore || echo $@ >> .gitignore

clean:
	rm -f $(BINARIES) $(wildcard *.hi) $(wildcard *.o)
