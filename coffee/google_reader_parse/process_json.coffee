starred = require './starred.json'
fs = require 'fs'
_ = require 'underscore'
tpl = fs.readFileSync('./post.tpl','utf8')

paid2 = (s) ->
    return if (s + '').length < 2  then ('00' + s).slice(1) else s

formatTime = (t) ->
    year = t.getFullYear()
    month = t.getMonth() + 1
    date = t.getDate()

    hours = t.getHours()
    minutes = t.getMinutes()
    seconds = t.getSeconds()

    return year + '-' + paid2(month) + '-' + paid2(date) + ' ' + paid2(hours) + ':' + paid2(minutes) + ':' + paid2(seconds)

getContent = (o) ->
    if o.content
        return o.content.content
    else if o.summary
        return o.summary.content
    else
        return o.alternate[0].href

formatTitle = (s) ->
    return s.replace(/[\/\s\?'"”“]/g,'-')

for s in starred.items
    try
        obj =
            title: s.title,
            author: s.author,
            date: formatTime(new Date(s.updated * 1000))
            content: getContent(s)
            link: s.alternate[0].href
        filename = formatTime(new Date(s.updated * 1000)).split(' ')[0]
        filepath = './posts/' + filename + '-' + (s.title && formatTitle(s.title)) + '.markdown'
        content = _.template(tpl, obj)
        fs.writeFileSync(filepath, content)
    catch e
        console.log e
        console.log 2
        process.exit(0)

