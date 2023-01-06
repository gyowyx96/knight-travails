# frozen_string_literal: true

class Knight
  attr_accessor :position, :children, :parent

  MOVES = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]].freeze

  def initialize(position, parent = nil)
    @position = position
    @children = []
    @parent = parent
  end

  def make_moves
    make_moves = MOVES.map.each do |move|
      move.each_with_index.map { |m, i| m + @position[i] unless (m + @position[i]).negative? || (m + @position[i]) > 7 }
    end
    make_moves.delete_if { |m| m.include?(nil) }
  end
end
