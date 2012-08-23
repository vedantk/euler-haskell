#include <stdio.h>
#include <stdint.h>

/* In the NxN grid, the value of each cell is the number of valid paths to
 * that cell through the graph. A valid transition is "down" or "right", so
 * the number of paths to a cell, P(x, y) = P(x-1, y) + P(x, y-1). */

#define N 20
uint64_t arr[N * N] = {0};
#define IDX(x, y) arr[x + N*y]

uint64_t paths(uint64_t x, uint64_t y) {
	if (x == 0 || y == 0) {
		return 1;
	}

	if (IDX(x, y) > 0) {
		return IDX(x, y);
	} else {
		return (IDX(x, y) = paths(x-1, y) + paths(x, y-1));
	}
}

int main(void) {
	for (uint64_t k=0; k <= N; ++k) {
		printf("paths(%lu, %lu) = %lu\n", k, k, paths(k, k));
	}
	return 0;
}

