package main

import fmt "fmt"

type Board struct {
	boardstate	[8]int	// State of the board
}

func (b *Board) addcol() int {
/* It is assumed that anytime we call addcol the board is known good */
	var nextcol int
	var solutions int = 0

	if (b.boardstate[7] > 0) { // All cols full, so this board is a solution
		b.printstate()
		return 1
	}
	for i := 1; i < 9 ; i++ {
		if (b.checkleft(i)) {
			// It passes the test, so it is a potential solution
			var newbd *Board = new(Board)
			newbd.init()
			for j := 7; j >= 0; j-- {
				newbd.boardstate[j] = b.boardstate[j]
				if b.boardstate[j] == 0 {
					nextcol = j
				}
			}
			newbd.boardstate[nextcol] = i
			solutions += newbd.addcol()
		}
	}
	return solutions
}

func (b *Board) checkleft(pos int) bool {
	var nextcol int

	// Find the first open column
	for nextcol = 0; nextcol < 8 && b.boardstate[nextcol] > 0 ; nextcol++ { }
	for i := nextcol - 1 ; i >= 0 ; i-- {
		if (
			(b.boardstate[i] == pos - (nextcol - i)) ||
			(b.boardstate[i] == pos + (nextcol - i)) ||
			(b.boardstate[i] == pos)) {
			return false
		}
	}
	return true
}

func (b *Board) printstate() int {
	// Start with the top row and work down
	for  i := 8; i > 0; i-- {
		for j := 0; j < 8; j++ {
			if (b.boardstate[j] == i) {
				fmt.Printf("[Q]")
			} else {
				fmt.Printf("[ ]")
			}
		}
		fmt.Printf("\n")
	}
	fmt.Printf("\n")
	return 0
}

func (b *Board) init() int {

	for i := 0; i < 8; i++ {
		b.boardstate[i] = 0
	}
	return 0;
}

func main() {
	var startboard *Board = new(Board)

	fmt.Printf("Solutions: %d\n", startboard.addcol())
}
