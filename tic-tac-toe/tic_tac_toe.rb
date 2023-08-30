require 'pry-byebug'

class TicTacToe
    attr_accessor :name, :sign
    @@count = 0

    def self.print_grid(arr)
        count = 0
        3.times do
            3.times do
                print " #{arr[count]}|"
                count +=1
            end
            puts "\n--+---+--\n"
        end
    end 

    def is_valid_move?( player, arr)
        loop do
            print "#{player.name}, where would you like to play?\n"
            move = gets.chomp.to_i

            if move >= 1 and move <= 9 and arr[move-1] != 'O' and arr[move-1] != 'X'
                arr[move-1] = player.sign
                @@count +=1
                break
            end

        end

        result = player.is_winner?(arr,player.sign)
        if result == true
            puts "#{player.name} is winner"
            return true
        end

        TicTacToe.print_grid(arr)
    end
    
    def is_winner?(arr,sign)
        if  ((arr[0] == sign and arr[1] == sign and arr[2] == sign) or
            (arr[3] == sign and arr[4] == sign and arr[5] == sign) or
            (arr[6] == sign and arr[7] == sign and arr[8] == sign) or
            (arr[0] == sign and arr[3] == sign and arr[6] == sign) or
            (arr[1] == sign and arr[4] == sign and arr[7] == sign) or
            (arr[2] == sign and arr[5] == sign and arr[8] == sign) or
            (arr[0] == sign and arr[4] == sign and arr[8] == sign) or
            (arr[2] == sign and arr[4] == sign and arr[6] == sign))
        #   puts "the array is #{arr}"
          return true
        else
            return false
        end
    end
end

puts "Welcome to Tic-Tac-Toe!\n"

player1 = TicTacToe.new
puts "Player one, enter your name: \n"
player1.name = gets.chomp
player1.sign = 'X'

player2 = TicTacToe.new
puts "Player two, enter your name: \n" 
player2.name = gets.chomp
player2.sign = 'O'

# count = 0
arr = [1,2,3,4,5,6,7,8,9]
TicTacToe.print_grid(arr)
9.times do
    # binding.pry
    if (TicTacToe.class_eval '@@count') < 9

        result = player1.is_valid_move?( player1, arr)
        if result == true
           break; 
        end

        result = player2.is_valid_move?( player2, arr)
        if result == true
            break; 
         end
    else
        puts "Match is tie :("
    end

end



