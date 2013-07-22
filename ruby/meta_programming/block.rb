a = [1,2,3]

def a.each1(&block)
    i = 0
    while i < self.size
        block.call(self[i])
        i += 1
    end
end

def a.each2
    i = 0
    while i < self.size
        yield self[i]
        i += 1
    end
end

a.each1 {|i| p i}
puts ''
a.each2 {|i| p i}
