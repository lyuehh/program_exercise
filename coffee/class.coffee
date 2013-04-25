class CoffeeCup
  properties:
    strength: 'medium'
    cream: false
    sugar: false
  strength: (newS) ->
    @properties.strength = newS
    @
  cream: (newC) ->
    @properties.cream = newC
    @
  sugar: (newSu) ->
    @properties.sugar = newSu
    @
a = new CoffeeCup()
alert(a.properties)
c = new CoffeeCup().strength('a').cream('b').sugar('c')
alert(JSON.stringify(c.properties))

("foo bar baz".split(' ').map (word) -> word[0].toUpperCase() + word[1..-1].toLowerCase()).join ' '