require_relative "piece"
require_relative "stepable"

class Queen < Piece
    include Stepable

    def symbol
        '♛'.colorize(color)
    end

    protected

    def move_diffs
        horizontal_and_vertical_dirs + diagonal_dirs
    end
end