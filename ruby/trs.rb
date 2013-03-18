#!/usr/bin/env ruby

require 'open-uri'
from = 'en'
to = 'zh'
sen = ARGV[1]
p sen
url = "http://translate.google.fr/translate_a/t?client=t&text=#{sen}&hl=en&sl=#{from}&tl=#{to}&ie=UTF-8&oe=UTF-8&multires=1&otf=2&rom=1&ssel=0&tsel=0&sc=1"
p url


