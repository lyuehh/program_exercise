fs = require 'fs'
_ = require 'underscore'

data = fs.readFileSync 'data.dat'
obj = JSON.parse data
fs.writeFileSync('data.json', obj)

o = require('./data.json')
console.log _.pluck o, 'Title'
