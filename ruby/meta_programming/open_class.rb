class String
    def to_alpha
        gsub /[^\w\s]/, ''
    end
end

puts ")(*&^%$#@ asdf )".to_alpha

class Array
    def substitute(from, to)
        each_with_index do |e, i|
            self[i] = to if e == from
        end
    end
end

a = [1,2,3]
a.substitute(1,2)
p a

