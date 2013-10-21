import appscript
iTunes = appscript.app('iTunes')
iWindows = iTunes.browser_windows()
iWindow = iWindows[0]
playList = iWindow.view()
track = playList.tracks[1]
print "Now playing the firest track:"
print "-"*50  
print "Name:", track.name()
print "Artist:", track.artist()
print "Genre:", track.genre()
track.play()
