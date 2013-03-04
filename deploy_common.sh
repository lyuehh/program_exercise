#!/bin/bash

#severial days later, i will refact the deploy shell! shit !
#check if someone is deploying....
cdate=`date +%Y%m%d`
deploy_lock_file="/opt/work/.deploylock"
#judge lock file is exist
if [ -e $deploy_lock_file ]
then
    echo 'Erroring: someone maybe deploy, please wait ...'
    exit
fi

#del biz file
#author:gavin date:2011-11-31
function del_biz_file4_free(){
    echo "del biz file.................."
    echo "/opt/work/webpy_sohu/ajax/basebranchs.py"
    rm -rf $local_webpy_sohu_path/ajax/basebranchs.py 

    for f in `ls $local_webpy_sohu_path/ajax/biz*`;
    do
        echo $f
        rm -rf $f
    done
}

#user choice deploy 
echo "Will deploy [ $module_name ] to [ $deploy_target ] servers [ $hosts ], Are you sure?"
read key
if [ "$key" != "Y" ] && [ "$key"  != "y" ]
then
    echo "Deploy has been aborted"
    exit
fi

#fetch project:webpy_sohu
echo "Begin git fetch [ webpy_sohu ] from remote repositories"
ori_commit_id=`cd $local_webpy_sohu_path;git log -1 --format="%h"`
cd $local_webpy_sohu_path;git reset --hard;git fetch origin
new_commit_id=`cd $local_webpy_sohu_path;git log -1 --format="%h" origin/master`
echo "From commitid $ori_commit_id to $new_commit_id have some changed files.........................................."
echo ""
cd $local_webpy_sohu_path;git log --name-status --pretty=format:"%ci %Cgreen%aN%Creset %s" $ori_commit_id..$new_commit_id
echo ""
echo "End  commitid $ori_commit_id to $new_commit_id have some changed files.........................................."
echo ""

#fetch project:webpy_maillib
echo "Begin git fetch [ webpy_maillib ] from remote repositories"
ori_commit_id=`cd $local_webpy_maillib_path;git log -1 --format="%h"`
cd $local_webpy_maillib_path;git reset --hard;git fetch origin
new_commit_id=`cd $local_webpy_maillib_path;git log -1 --format="%h" origin/master`
echo "From commitid $ori_commit_id to $new_commit_id have some changed files.........................................."
echo ""
cd $local_webpy_maillib_path;git log --name-status --pretty=format:"%ci %Cgreen%aN%Creset %s" $ori_commit_id..$new_commit_id
echo ""
echo "End  commitid $ori_commit_id to $new_commit_id have some changed files..........................................."


echo "Are you sure to deploy those files?"
read con_key
if [ "$con_key" != "Y" ] && [ "$con_key"  != "y" ]
then
    echo "Deploy has been aborted"
    exit
fi

touch $deploy_lock_file 

echo "Building start........................................................................"
cd $local_webpy_sohu_path;git reset --hard;git pull origin master;

if [ "$deploy_target" == "sogou" ] || [ "$deploy_target" == "chinaren" ] || [ "$deploy_target" == "vip" ] || [ "$deploy_target" == "biz" ] || [ "$deploy_target" == "17173" ]

then
    echo "Copying $deploy_target conf to webpy_sohu..............................................."
    cp -r -f conf/$deploy_target/* .
fi

#del biz file
if [ $deploy_target != "biz" ];
then
    del_biz_file4_free
fi

cd $local_webpy_maillib_path;git reset --hard;git pull origin master;
echo "Copying webpy_maillib to webpy_sohu/maillib..........................................."
cp -f  *.py *.sql $local_webpy_sohu_path/maillib

cd $local_module_path_prefix 
echo "Beginning build tar..................................................................."
rm -f $module_tgz_name
tar zcf $module_tgz_name $module_name/ --exclude $module_name/conf --exclude $module_name/.git --exclude $module_name/.gitignore
echo "Building success......................................................................"


for host in $hosts
do
    special=0
    sp_len=`echo $specail | grep $host|wc -l`
    if [ $sp_len == 1 ]
    then
    special=1
    fi

	host=mx$host.$mx_name
	echo $host

    if [ $special == 1 ]
    then
    # do sth specail here
    echo "-----------------------------*  this is a specail host  *-------------------------------"
    # ?0?2?0?7?0?5?„°§?0?5?0?8?0?3?0?8?0?7?0?9?0?5?0?8?0?341?0?7?0?3?0?5?0?9?0?8?0?8?0?4?0?0?0?4?Ë°§?0?0,?0?8?0?6?0?8?¿Å0?5?0?3?0?6?0?9?0?0?0?5?0?0?0?5?0?8?0?0?0?9??
    continue
    fi

    ssh root@$host /opt/work/webpy_sohu/runctl stop ajax 6501 6502 6503 6504
    ssh root@$host /opt/work/webpy_sohu/runctl stop wap 6601

    

    echo $local_module_path_prefix/$module_tgz_name
    echo $host
	ssh root@$host "rm -rf /opt/work/webpy_sohu.*"
    scp $local_module_path_prefix/$module_tgz_name root@$host:/opt/work/$module_tgz_name
	ssh root@$host "mv -f /opt/work/webpy_sohu /opt/work/webpy_sohu.$cdate"
	ssh root@$host "cd /opt/work;tar zxf $module_tgz_name"


	ssh root@$host "/opt/sohumc/bin/cheetah c /opt/work/webpy_sohu/ajax/*.tmpl"	
	ssh root@$host "/opt/sohumc/bin/cheetah c /opt/work/webpy_sohu/ajax/templates/*.tmpl"	
	ssh root@$host "/opt/sohumc/bin/cheetah c /opt/work/webpy_sohu/wap/*.tmpl"	

	ssh root@$host "chown -R postfix.postfix /opt/work/webpy_sohu"
	ssh root@$host "chmod a+x /opt/work/webpy_sohu/runctl"
	ssh root@$host "chmod a+x /opt/work/webpy_sohu/restart"

    #ssh root@$host "pgrep -f run.py | xargs kill -9"
    ssh root@$host /opt/work/webpy_sohu/runctl start ajax 6501 6502 6503 6504
    ssh root@$host /opt/work/webpy_sohu/runctl start wap 6601

	ssh root@$host "rm -f /opt/work/$module_tgz_name"

done

rm -f $deploy_lock_file
