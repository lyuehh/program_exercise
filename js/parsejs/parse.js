var fs = require('fs'),
    esprima = require('esprima'),
    offset = 0,
    content = fs.readFileSync('example.js', 'utf-8'),
    tokens = esprima.parse(content, {tokens: true, range: true, loc: true}).tokens,
    chars = content.split('');
    lines = content.split('\n');

//console.log(content.split(''))

// console.log(JSON.stringify(tokens));

tokens.forEach(function(i) {
    if (i.type === 'Identifier' && i.value === 'alert') {
        var the2 = content[i.range[0]-2] + content[i.range[0]-1]; // alert的前面2个字母
        if (the2 !== 'g.') {
            console.log('find alert at line: ' + i.loc.start.line + ', column: ' + 
                i.loc.start.column + ', Line: ' + lines[i.loc.start.line - 1]);
        }
    }
});

tokens.forEach(function(i) {
    if (i.type === 'Identifier' && i.value === 'console') {
        console.log('find console at line: ' + i.loc.start.line + ', column: ' + i.loc.start.column);
    }
    if (i.type === 'Keyword' && i.value === 'debugger') {
        console.log('find debugger at line: ' + i.loc.start.line + ', column: ' + i.loc.start.column);
    }
});
