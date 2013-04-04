a = 5
x = if a < 8 then 6 else 7 end

puts x

t = case a
  when 0..3
    "low"
  when 4..6
    "media"
else 
  "high"
end
puts t