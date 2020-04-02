class KnightPathFinder

    def initialize(position)
        @start = position
        @considered_moves = [position]
        self.build_move_tree
    end

    def find_path(position)
        @end = position
    end

    def build_move_tree

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
        self.valid_moves(position)
        # unless @considered_moves.include?()
    end

end

#code for testing

kpf = KnightPathFinder.new([0, 0])
# p kpf.find_path([2,1]
# p kpf.find_path([3,3]))