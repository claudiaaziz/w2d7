class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "#{@mark} enter a position on the board in the format `1 2`"
        position = gets.chomp.split.map(&:to_i)
        raise 'invalid position' if position.length != 2
        position
    end
end

# i = HumanPlayer.new(:I)
# p i
# p i.mark
# i.get_position

