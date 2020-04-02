require_relative 'positionnode'

class KnightPathFinder

    def initialize(position)
        @start = position
        @considered_moves = []
        @parent = PositionNode.new(@start)
        self.build_move_tree
    end

    def find_path(position)
        result = trace_back_path(@parent.bfs(position))
        result.reverse
    end

    def trace_back_path(target_node)
        result = []
        return [@start] if target_node.position == @start
        result << target_node.position
        result = result.concat(trace_back_path(target_node.parent))
        result
    end
    
    def build_move_tree
        queue = []
        queue << @parent
        until queue == []
            current_parent = queue.shift
            new_positions = self.new_move_positions(current_parent.position)
            unless new_positions == nil
                new_positions.each do |position|
                    unless @considered_moves.include?(position)
                        new_child = PositionNode.new(position)
                        new_child.parent=(current_parent)
                        queue << new_child
                    end
                end
            end
            @considered_moves << current_parent.position
        end
    end

    def self.valid_moves(position)
        moves = []
        changes = [-2, -1, 1, 2]
        changes.each do |change1|
            changes.each do |change2|
                if change1.abs == 2 && change2.abs == 1 || change2.abs == 2 && change1.abs == 1 
                    idx1 = position[0] + change1
                    idx2 = position[1] + change2
                    if idx1 >= 0 && idx1 <= 7 && idx2 >= 0 && idx2 <= 7
                        moves << [idx1, idx2]
                    end
                end
            end
        end
        moves
    end

    def new_move_positions(position)
        unless @considered_moves.include?(position)
            new_positions = KnightPathFinder.valid_moves(position)
            return new_positions
        end
        nil
    end

end

#code for testing

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([2, 1])
p kpf.find_path([3, 3])
p kpf.find_path([7, 6])
p kpf.find_path([6, 2])