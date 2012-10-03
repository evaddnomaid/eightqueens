#!/usr/bin/ruby

class Eightqueens
	@@solutions = 0

	def good_addition(board, pos)
		col = 0
		for row in board do
			return false if row == pos
			return false if row + (board.size - col) == pos
			return false if row - (board.size - col) == pos
			col += 1
		end
		return true
	end

	def pg(good_sofar)
		if good_sofar.count == 8
			@@solutions = @@solutions + 1
			printf("\n");
			print_board(good_sofar)
		else
			i = 0
			while i < 8
				if good_addition(good_sofar, i)
					a = Array.new
					for x in good_sofar do
						a << x
					end
					a << i
					pg(a);
				end
				i += 1
			end
		end
		return @@solutions
	end

	def print_board(ba)
		for row in [0,1,2,3,4,5,6,7] do
			for col in 0..7 do
				if (ba[col] == row)
					printf("[Q]")
				else
					printf("[ ]")
				end
			end
			printf("\n");
		end
	end
end

eightqueens = Eightqueens.new
printf("\nSolutions: %s\n", eightqueens.pg(Array.new))

