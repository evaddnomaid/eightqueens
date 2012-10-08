/* Eight queens solution in C */
/* by Dave Burchell, burchell@acm.org */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printboard(int *board) {
	int i, x, y;

	for (y = 8; y > 0; y--) {
		for (x = 0; x < 8; x++) {
			if (board[x] == y) {
				printf("[Q]");
			} else {
				printf("[ ]");
			}
		}
		printf("\n");
	}
	printf("\n");
}

int addcol(int *board) {
	/* Boards passed to addcol are assumed good so far */
	int i, solutions, newcol;

	solutions = 0;
	if (board[7] > 0) {
		/* This board is full and must be a solution */
		printboard(board);
		solutions = 1;
	} else {
		for (i = 1; i < 9; i++) {
			if (newcol = checkleft(i, board)) {
				int *newboard = malloc(8 * sizeof(int));
				memcpy(newboard, board, 8 * sizeof(int));
				newboard[newcol - 1] = i;
				solutions += addcol(newboard);
				free(newboard);
			}
		}
	}
	return solutions;
}

int checkleft(int pos, int *board) {
	int j, nextcol;

	for (j = 8; j > 0 && board[j - 1] == 0; j--) {
		nextcol = j;
	}
	for (j = nextcol - 2; j >= 0; j--) {
		/* check here */
		if (board[j] == pos) { return 0; }
		if (board[j] == pos + (nextcol - 1 - j)) { return 0; }
		if (board[j] == pos - (nextcol - 1 - j)) { return 0; }
	}
	return nextcol;
}

main() {
	int i, solutions;
	int board[8];

	for (i = 0; i < 8; i++) {
		board[i] = 0;
	}
	solutions = addcol(board);
	printf("Solutions: %d\n", solutions);
}

