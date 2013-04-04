$count = 0

def valid?(state, x, y)
  # check in col and row
  0.upto(8) do |i|
    return false if i != y and state[x][i] == state[x][y]
    return false if i != x and state[i][y] == state[x][y]
  end

  # check in box
  x_from = (x / 3) * 3
  y_from = (y / 3) * 3
  x_from.upto(x_from + 2) do |xx|
    y_from.upto(y_from + 2) do |yy|
      return false if (xx != x or yy != y) and state[xx][yy] == state[x][y]
    end
  end

  true
end



def next_state(state, x, y)
  $count = $count + 1
  y = 0 and x = x + 1 if y == 9
  return true if x == 9

  unless state[x][y].zero?
    return false unless valid?(state, x, y)
    return next_state(state, x, y + 1)
  else
    1.upto(9) do |i|
    state[x][y] = i
      return true if valid?(state, x, y) and next_state(state, x, y + 1)
    end
  end

  state[x][y] = 0
  false
end


start =
[
  [ 0, 0, 0, 4, 0, 5, 0, 0, 1 ],
  [ 0, 7, 0, 0, 0, 0, 0, 3, 0 ],
  [ 0, 0, 4, 0, 0, 0, 9, 0, 0 ],
  [ 0, 0, 3, 5, 0, 4, 1, 0, 0 ],
  [ 0, 0, 7, 0, 0, 0, 4, 0, 0 ],
  [ 0, 0, 8, 9, 0, 1, 0, 0, 0 ],
  [ 0, 0, 9, 0, 0, 0, 6, 0, 0 ],
  [ 0, 8, 0, 0, 0, 0, 0, 2, 0 ],
  [ 4, 0, 0, 2, 0, 0, 0, 0, 0 ]
]

start_time = Time.new

if next_state(start, 0, 0)
  puts "time elapsed: #{Time.new - start_time} sec."
  puts "count: #{$count}"
  start.each do |val|
    puts val.join(" ")
  end
else
  puts "Not solveable!"
end