require 'psd'

PSD.debug = true
psd = PSD.new('./index.psd')
psd.parse!
