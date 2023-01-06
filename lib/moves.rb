# frozen_string_literal: true

require_relative '../lib/knights'

class Travail
  def knight_moves(start, destination)
    start.each { |n| return puts 'Enter a valid starting point!' if n.negative? || n > 7 }
    destination.each { |n| return puts 'Enter a valid destination' if n.negative? || n > 7 }
    print_moves(make_tree(start, destination), start)
  end

  def print_moves(root, start, history = [])
    until root.position == start
      history.push(root.position)
      root = root.parent
    end
    history.push(root.position)
    puts "Knight made #{history.size} moves to arrive!"
    history.reverse_each { |move| p move }
  end

  def make_tree(start, destination)
    queue = [Knight.new(start)]
    current = queue.shift
    until current.position == destination
      current.make_moves.each do |move|
        knight = Knight.new(move, current)
        current.children.push(knight)
        queue << knight
      end
      current = queue.shift
    end
    current
  end
end
asd = Travail.new
asd.knight_moves([5, 5], [7, 1])
