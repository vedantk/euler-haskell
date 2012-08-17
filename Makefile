HC = ghc
HCFLAGS = -O3

BINARIES = $(patsubst %.hs, %, $(wildcard *.hs))

all: $(BINARIES)

%: %.hs
	$(HC) $(HCFLAGS) $^

clean:
	rm -f $(BINARIES) $(wildcard *.hi) $(wildcard *.o)
