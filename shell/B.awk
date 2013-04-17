#!/usr/bin/awk -f

BEGIN {
    getline
    caseAmount = $0
    
    for (caseNum = 0; caseNum < caseAmount; caseNum++) {
        getline
        _n = $1; _m = $2
        
        for (i = 1; i <= _n; i++) {
            getline
            for (j = 1; j <= _m; j++)
                a[i,j] = $j
        }
        
        result = "YES"
        for (i = 1; i <= _n; i++) {
            for (j = 1; j <= _m; j++) {
                flag = 0
                
                for (t1 = 1; t1 <= _m; t1++) {
                    if (t1 != j && int(a[i,t1]) > int(a[i,j])) {
                        flag++
                        break
                    }
                }
                
                for (t2 = 1; t2 <= _n; t2++) {
                    if (t2 != i && int(a[t2,j]) > int(a[i,j])) {
                        flag++
                        break
                    }
                }
                
                if (flag > 1)
                    result = "NO"
            }
        }
        
        print "Case #"caseNum+1": "result
    }    
}
