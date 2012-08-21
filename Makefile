HC = ghc
HCFLAGS = -O3 -threaded

BINARIES = $(patsubst %.hs, %, $(wildcard *.hs))

all: $(BINARIES)

%: %.hs
	$(HC) $(HCFLAGS) $^
	grep -xq "$@" .gitignore || echo $@ >> .gitignore

clean:
	rm -f $(BINARIES) $(wildcard *.hi) $(wildcard *.o)
