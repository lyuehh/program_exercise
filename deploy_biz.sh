#!/bin/bash
#hosts='7 20 21 22 23 24 25 26 27'
#hosts='99 20 21 22 25 26'
#hosts='25'
#hosts='20 21 22 24 25 26 27'
#hosts='20 27'
hosts='99 23 7'
#hosts='7'
deploy_target="biz"
mx_name="mail.sohu.net"
module_name="webpy_sohu"
module_tgz_name="webpy_sohu.biz.tgz"
local_module_path_prefix="/opt/work"
local_webpy_sohu_path="$local_module_path_prefix/webpy_sohu"
local_webpy_maillib_path="$local_module_path_prefix/webpy_maillib"

source ./deploy_common.sh
