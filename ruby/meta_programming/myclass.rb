class   MyClass
    def my_method
        @v = 1
    end
end

obj = MyClass.new
p obj.class

obj.my_method
p obj.instance_variables
p obj.methods.grep(/my/)

p String.instance_methods == 'abc'.methods
p String.methods == 'abc'.methods

p 'hello'.class
p String.class

p Class.instance_methods(false)

p String.superclass # => Object
p Object.superclass # => BasicObject
p BasicObject.superclass # => nil

p Class.superclass # => Module
p Module.superclass # => Object

module MyModule
    MyConst = 'outer constant'

    class MyClass
        MyConst = 'Inner'
        MyA = Module.nesting
    end
end

p MyModule::MyConst
p MyModule::MyClass::MyConst
p MyModule::MyClass::MyA

p MyModule.constants
p Module.constants
