class Node
    attr_accessor :data, :next_node

    def initialize(data = nil,next_node = nil)
        @data = data
        @next_node = next_node
    end
end


class LinkedList
    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(data)
        node = Node.new(data)

        if head.nil?
            @head = node
            @tail = node
        else
            @tail.next_node = node
            @tail = node
        end

        puts "Added #{data} at the last"
    end

    def prepend(data)
        node = Node.new(data,@head)

        @head = node

        puts "Added #{data} at the first"

    end

    def size
        count = 0
        counter_node = @head

        until  counter_node.nil?
            count += 1
            counter_node = counter_node.next_node
        end

        count        
    end

    def at(index)
        count = 0
        counter_node = @head

        until count == index
            count += 1
            counter_node = counter_node.next_node            
        end

        counter_node.data
    end

    def pop
        node = @head

        until node.next_node == @tail
            node = node.next_node
        end

        puts "removed node #{node.next_node.data}"

        node.next_node = nil
        @tail = node 
    end

    def contains?(value)
        node = @head
        contain = false

        until node.nil?
            contain =  true if node.data == value
            node = node.next_node
        end

        contain
    end

    def find(value)
        node = @head
        ret = nil
        count = 0

        until node.nil?
            count += 1
            ret = count if node.data == value 
            node = node.next_node
        end

        ret
    end

    def to_s
        node = @head

        until node.nil?
            print "( #{node.data} ) -> "
            node = node.next_node
        end

        print(" nil")
        
    end

    def insert_at(value,index)
        node = @head
        count = 0

        
        if index.zero?
            prepend(value)
            return

        elsif index > size
            puts "you selected index greater than size"
            return
        end

        until count == index -1
            count += 1
            node = node.next_node
        end

        new_node = Node.new(value,node.next_node)
        node.next_node = new_node
        
    end

    def remove_at(index)

        if index > size
            puts "you selected index greater than size"
            return

        elsif index == size
            pop
            return            

        elsif index == 0
            @head = @head.next_node
            return
        end

        count = 0
        node1 = @head
        node2 = Node.new(9,node1)

        until count == index 
            count += 1
            puts count 
            node1 = node1.next_node
            node2 = node2.next_node
        end

        node2.next_node = node1.next_node
        
    end

end

one = LinkedList.new
one.append(101)
one.append(102)
one.append(103)
one.append(104)

# puts one.size

# puts one.head.data

# puts one.at(3)

# one.pop
# puts one.size

# puts one.contains?(105)

# puts one.find(103)

# one.insert_at(100,5)
# one.to_s

one.remove_at(0)
one.to_s
