a = [1,2,3,4,5]

p a.reject {|i| i % 2 == 0}

def a.reject1
    b = []
    i = 0
    while i < self.size
        if yield self[i]
            b.push(self[i])
        end
    end
    b
end
p a.reject1 {|i| i % 2 == 0}
