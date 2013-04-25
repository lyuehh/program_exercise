var Events = {
    bind: function() {
        if(!this.o) this.o = $({});
        this.o.bind.apply(this.o,artuments);
    },
    trigger: function() {
        if(!this.o) this.o = $({});
        this.o.trigger.apply(this.o,arguments);
    }
};
var StateMachine = function() {};
StateMachine.fn = StateMachine.prototype;

$.extend(StateMachine,Events);

StateMachine.fn.add = function(controller) {
    this.bind("change",function(e,current) {
        if (controller == current) {
            controller.activate();
        } else {
            controller.deactivate();
        }
    });
    controller.activate = $.proxy(function() {
        this.trigger("change",controller);
    },this);
};
var con1 = {
    activate: function() {
        console.log("controller 1 activated");
    },
    deactivate: function() {
        console.log("controller 1 deactivated");
    }
};
var con2 = {
    activate: function() {
        console.log("controller 2 activated");
    },
    deactivate: function() {
        console.log("controller 2 deactivated");
    }
};
var sm = new StateMachine;
sm.add(con1);
sm.add(con2);
con1.activate();
