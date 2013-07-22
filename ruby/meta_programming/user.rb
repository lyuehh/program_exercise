class User
    def name(n)
        p n
    end

    def password(p)
        p p
    end

    def privilege(p)
        p p
    end
end

def add_user(&block)
    u = User.new
    u.instance_eval(&block) if block
end

add_user {
    name "haha"
    password "1111aaaa"
    privilege "normal"
}
