require_relative '00_tree_node.rb'

class KnightPathFinder
    KNIGHT_MOVES = 
    [[-2, -1],
    [-2, 1],
    [-1,-2],
    [-1, 2],
    [1, -2],
    [1, 2],
    [2, 1],
    [2, -1]]

    def self.valid_moves(pos)
        x,y = pos
        valid_moves = []
        KNIGHT_MOVES.each do |(i, j)|
            new_pos = [x + i, y + j]
            a = new_pos.all?{|coord| coord.between?(0, 7)}
            if a
                valid_moves << new_pos
            end
        end
        return valid_moves
    end

    def initialize(starting_pos)
        @start_pos = starting_pos 
        @considered_pos = [starting_pos]
        @root_node = nil
        build_move_tree
    end

    def build_move_tree
        @root_node = PolyTreeNode.new(@start_pos)
        nodes = [@root_node]
        until nodes.empty?
            cur_node = nodes.shift
            cur_pos = cur_node.value
            new_move_positions(cur_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                cur_node.add_child(next_node)
                nodes << next_node
            end
        end
    end

    def new_move_positions(pos)
        valid = KnightPathFinder.valid_moves(pos)
        valid = valid.reject {|new_pos| @considered_pos.include?(new_pos)}
        valid.each {|new_pos| @considered_pos << new_pos}
        return valid
    end

end