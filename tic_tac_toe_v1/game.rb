require_relative 'board'
require_relative 'human_player'

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        @current_player = @current_player == @player_1 ? @player_2 : @player_1
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)

            if @board.win?(@current_player.mark)
                puts "victory player #{@current_player.mark} wins"
                return
            else
                switch_turn
            end
        end
        'draw'
    end
end

# c = Game.new(:N, :I)
# p c
# c.switch_turn
# p c

N = Game.new(:I, :N)
N.play
