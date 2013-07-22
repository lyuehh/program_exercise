$(function() {

    // mini upload
    var miniupload = (function($, _) {
        var isPasteImgFile = function(oe) {
            var flag;
            if(oe && oe.clipboardData) {
                if(!_.include(oe.clipboardData.types, 'Files')) {
                    flag = false;
                    return flag;
                }
                if(oe.clipboardData.items) {
                    $.each(oe.clipboardData.items, function(i, f) {
                        if(f.type.indexOf('image') !== -1) {
                            flag = true;
                        }
                    });
                } else if(oe.clipboardData.files) {
                    $.each(oe.clipboardData.files, function(i, f) {
                        if(f.type.indexOf('image') !== -1) {
                            flag = true;
                        }
                    });
                }
                
            }
            return flag;
        };

        var isDragImgFile = function(e) {
            var dt = e.dataTransfer;
            var flag;
            if(dt && _.include(dt.types, 'Files')) {
                $.each(dt.files, function(i, f) {
                    if(f.type.indexOf('image') !== -1) {
                        flag = true;
                    }
                });
            }
            return flag;
        };

        // fobj 为e.originalEvent.clipboardData 或 e.dataTransfer
        var getFiles = function(fobj, cb) {
            if(fobj.items) {
                var files = _.filter(fobj.items, function(f) {
                    return f.type.indexOf('image') !== -1;
                });
                cb(files, 'item'); // f.getAsFile(); chrome
            } else {
                var files = _.filter(fobj.files, function(f) {
                    return f.type.indexOf('image') !== -1;
                });
                cb(files, 'file'); // FileReader; firefox, safari, ie等
            }
        };

        var getFileData = function(file, cb) {
            var reader = new FileReader();
            reader.onload = function(e) {
                cb(e.result);
            }
            reader.readAsBinaryString(file);
        }
        var sendXHR = function(url, method, d, cb) {
            var xhr = new XMLHttpRequest();
            var data = new FormData();
            data.append('file', d.file);
            data.append('text', d.txt);
            xhr.open(method, url);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    cb(xhr.responseText);
                }
            }
            xhr.send(data);

        }
        return {
            isPasteImgFile: isPasteImgFile,
            isDragImgFile: isDragImgFile,
            getFiles: getFiles,
            getFileData: getFileData,
            sendXHR: sendXHR
        }
    })(jQuery, _);

    var $c = $('.container');
    $c.on('paste', function(e) {
        debugger;
        if(miniupload.isPasteImgFile(e.originalEvent)) {
            console.log('paste img files...');
            miniupload.getFiles(e.originalEvent.clipboardData, function(files, type) {
                $.each(files, function(i, f) {
                    var filecontent;
                    if(type === 'item') {
                        filecontent = f.getAsFile();
                        debugger;
                        miniupload.sendXHR('/upload', "POST", {file: filecontent, txt: 'aaa'}, function(ret) {
                            console.log(ret);
                        })
                    } else {
                        miniupload.getFileData(f, function(ret) {
                            filecontent = ret;
                            miniupload.sendXHR('/upload', "POST", {file: filecontent, txt: 'aaa'}, function(ret) {
                                console.log(ret);
                            })
                        });
                    }
                });
            });
        }
    });
});
