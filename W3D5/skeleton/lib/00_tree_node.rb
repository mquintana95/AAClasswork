class PolyTreeNode
    attr_reader :value,:parent,:children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        return nil if @parent == node
        if node == nil
            return nil if @parent == nil
            @parent.children.delete(self)
            @parent = nil 
            return nil
        elsif @parent != nil
            @parent.children.delete(self)
            @parent = node
            node.children = node.children + [self]
        else
            @parent = node
            node.children = node.children + [self]
        end
    end

    def children=(nodes)
        @children = nodes
    end
    
    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "NOT YOUR CHILD" if !@children.include?(child_node)
        child_node.parent = nil 
    end


    def dfs(target_val)
        return self if target_val == @value
        @children.each do |child|
            val = child.dfs(target_val)
            return val if val != nil
        end
        return nil
    end

    def bfs(target)
        queue = []
        queue << self
        while !queue.empty?
            node = queue.shift()
            return node if node.value == target
            queue.concat(node.children)
        end
        return nil
    end
end