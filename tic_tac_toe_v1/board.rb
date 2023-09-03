class Board
    def initialize
        @grid = Array.new(3) {Array.new(3, '_') }
    end 

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def valid?(position)
        position.all? { |i| i >= 0 && i < @grid.length }
    end

    def empty?(position)
        self[position] == '_'
    end

    def place_mark(position, mark)
        raise 'invalid mark' if !valid?(position) || !empty?(position) 
        self[position] = mark
    end

    def print
        @grid.each { |row| puts row.join(" ") }
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? { |ele| ele == mark }
        end
        false
    end

    def my_transpose
        transposed = []

        (0...@grid.length).each do |row|
            new_row = []
            (0...@grid.length).each do |col|
                new_row << @grid[col][row]
            end
            transposed << new_row
        end

        transposed
    end

    def win_col?(mark)
        transposed = my_transpose
        transposed.each do |row|
            return true if row.all? { |ele| ele == mark }
        end
        false
    end

    def win_diagonal?(mark)
        main_diagonal = []
        other_diagonal = []

        length = @grid.length

        (0...length).each do |idx|
            main_diagonal << @grid[idx][idx]
            other_diagonal << @grid[idx][length - 1 - idx]
        end

        other_diagonal.uniq == [mark] || main_diagonal.uniq == [mark]
    end

    def win?(mark)
        win_diagonal?(mark) || win_col?(mark) || win_row?(mark)
    end
    
    def empty_positions?
        @grid.flatten.any? { |pos| pos == '_' }
    end
    
end


# c = Board.new
# # p c
# # p c.valid?([2,2])
# # c.empty?([2,2])
# c.place_mark([0,0], :C)
# c.place_mark([0,1], :C)
# c.place_mark([0,2], :C)
# c.place_mark([1,0], :C)
# c.place_mark([1,1], :C)
# c.place_mark([1,2], :C)
# c.place_mark([2,0], :C)
# # c.place_mark([2,1], :C)
# c.place_mark([2,2], :C)
# # p c.win_row?(:C)
# # p c.win_col?(:C)
# p c.print
# # 00 02
# # 11 11
# # 22 20
# # p c.win_diagonal?(:C)
# # p c.win?(:C)

# p c.empty_positions?

