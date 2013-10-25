/*
** 功能：<%= description %>  <%= name %>
** 创建：wangweiwei
** 时间：<%= Time.new %>
*/
#include "allof.h"
#include "general.flds.h"
#include "general32.flds.h"
#include "tuxedo.h"
#include "pubfunc.h"
#include "shm_msg.h"
#include "route_msg.h"
#include "func_msg.h"
#include "com_cust.h"
#include "com_pub.h"


#define		TEST

#define		LOAD_HEAD len=CUST_HEAD_LEN+2;\
	send_tmp=(char *)malloc(len*sizeof(char));\
	memset(send_tmp, 0, len*sizeof(char));\
	memset(buf, 0, sizeof(buf));\
	sprintf(buf, "%d", --len);\
	write_field(cust_head_rsp.pkg_length, 5, buf);\
	write_field(cust_head_rsp.cmd_flag, 1, "0");\
	write_field(cust_head_rsp.pkg_code, 5, "1");\
	write_field(cust_head_rsp.pkg_flag, 1, "1");\
	write_field(cust_head_rsp.error_code, 5, error_code);\
	memcpy(send_tmp, &cust_head_rsp, CUST_HEAD_LEN);\
	*(send_tmp + CUST_HEAD_LEN) = SUB;\
	*send_pkg = send_tmp;\
	*send_len = len;\
	alarm(0);\
	app_debug("%08d|%.12s default pkg sent pkg [%d][%s]\n", pid, cust_head_rsp.srv_type, *send_len, *send_pkg);\
	time(&finish);\
	elapsed_time = difftime(finish, start);\
	app_debug("%08d|%.12s Program takes %6.2f seconds.\n", pid, cust_head_rsp.srv_type, elapsed_time);\
	app_debug("%08d|========cust_%.12s end========\n", pid, cust_head_rsp.srv_type);


extern "C" {
	int cust_<%= name %>(char *recv_pkg, int recv_len, char **send_pkg, int *send_len);
	
}

int cust_<%= name %>(char *recv_pkg, int recv_len, char **send_pkg, int *send_len)
{
	
	int  ret_code = 0;   
	char error_code[8];
	char	srv_name[64];
	int		ret, i, j;
	int len;
	
	<% if multi == "True" %>
	int pkg_length,pkg_count,pkg_len,rec_len;
	<% end %>

	/* 服务请求参数 */
	char phone_no[20+1]; /*用户号码*/
	
	<% req_fields.each_with_index { |f,i| %>
	char <%= f.ename %>[<%= f.size %>+1]; /* <%= f.name %> */
	<% } %>
	
	int pid=getpid();
	char buf[256];
	
	time_t start, finish; 
	double elapsed_time;
	
	int		input_num, input_count[<%= input_count+1 %>], output_num, output_count[<%= output_count %>]; 
	char	*input_para[<%= input_count+1 %>][MAXLINE], *output_para[<%= output_count %>][MAXLINE], *output_msg[2];
	
	struct cust_head cust_head_req;
	struct cust_head cust_head_rsp;
	char *send_tmp, *pkg_body, *pkg_head;
	
	memset(buf, 0, sizeof(buf));
	app_debug("\n\n%08d|========cust_<%= name %> start  %.19s========\n", pid, getSysTime(buf, 114));
	
	time(&start);	
	signal(SIGALRM, cust_alarm);
	alarm(TIMEOUT);
	
	/***处理请求信息*****/	
	memset((char *)&cust_head_req,0,sizeof(cust_head_req));
	memset(phone_no,0,sizeof(phone_no));	
	memcpy((char *)&cust_head_req,recv_pkg,	CUST_HEAD_LEN);
	strncpy(phone_no,cust_head_req.srv_code,20);
	sscanf(phone_no,"%s",phone_no);
	
	memset(flag,0,sizeof(flag));
	strncpy(flag,recv_pkg+CUST_HEAD_LEN,5);
	sscanf(flag,"%s",flag);
	
	/* 这里需要修改 !!! */
	<% req_fields.each { |f| %>
	memset(<%= f.ename %>,0,sizeof(<%= f.ename %>));
	strncpy(<%= f.ename %>,recv_pkg+CUST_HEAD_LEN,<%= f.size %>);
	sscanf(<%= f.ename %>,"%s",<%= f.ename %>);
	
	<% } %>
	//app_debug("\n\n%08d|=======PhoneType=[%s],on_off_flag=[%s],op_time=[%s]=========\n",22,PhoneType,on_off_flag,op_time);
	
	memset((char *)&cust_head_rsp,0,sizeof(cust_head_rsp));     /*****拷贝包头信息，然后重置****/
	memcpy((char *)&cust_head_rsp,recv_pkg,CUST_HEAD_LEN);
	
	app_debug("%08d|%.12s received pkg [%d][%s] \n", pid, cust_head_req.srv_type, recv_len,recv_pkg);
	
	#ifdef TEST
	print_head(pid,&cust_head_req);
	#endif
	#ifdef TEST
	app_debug("%08d|%.12s phone_no [%s]\n", pid, cust_head_req.srv_type,phone_no);
	#endif
	
	memset(error_code, 0, sizeof(error_code));
	
	/**打开中间件连接***/
	/***tuxedo input_paras*************/
	memset(srv_name, 0, sizeof(srv_name));
	strcpy(srv_name,"sProdOfferQry");  
	memset((char *)input_para, 0, sizeof(input_para));
	memset(input_count, 0, sizeof(input_count));
	
	input_num = <%= input_count+1 %>;
	input_count[0]=1;
	input_para[0][0]=phone_no;
	
	<% req_fields.each_with_index { |f,i| %>
	input_count[<%= i+1 %>] = 1;	
	input_para[<%= i+1 %>][0] = <%= f.ename %>;
	<% } %>

	output_num = <%= output_count%>;
	
	memset(output_para, 0, sizeof(output_para));
	memset(output_count, 0, sizeof(output_count));
	app_debug("%08d|%.12s srv_name[%s] \n", pid, cust_head_req.srv_type,srv_name);
	
	
	/* 显示输入参数 */
	for (i=0; i<input_num; i++)
	{
		for (j=0; j<input_count[i]; j++)
		{
			#ifdef TEST
			printf("%08d|%.12s input_para[%d][%d] = [%s]\n", pid, cust_head_req.srv_type, i, j, input_para[i][j]);
			#endif
			app_debug("%08d|%.12s input_para[%d][%d] = [%s]\n", pid, cust_head_req.srv_type, i, j, input_para[i][j]);
		}
	}
	
	
	/*以FML32方式调用中间件服务，从中间件服务中接受返回值*****/
	
	
	ret=Tpcall32(srv_name, input_num, input_count, input_para, output_num, output_count, output_para, output_msg);

	if (ret<0)
	{
		app_debug("%08d|%.12s Tpcall32 failed [%d]\n",pid,cust_head_req.srv_type,ret);
		strcpy(error_code,SYSTEM_DEFAULT);
		LOAD_HEAD;
		return -8;
	}
	else
	{
		/*tuxedo 成功 */
		for (i=0; i<output_num; i++)
		{
			for (j=0; j<output_count[i]; j++)
			{
				#ifdef TEST
				printf("%08d|%.12s output_para[%d][%d] = [%s]\n", pid, cust_head_rsp.srv_type, i, j, output_para[i][j]);
				#endif
				app_debug("%08d|%.12s output_para[%d][%d] = [%s]\n", pid, cust_head_rsp.srv_type, i, j, output_para[i][j]);
			}
		}
		app_debug("%08d|%.12s Tpcall succ [%d]\n", pid, cust_head_rsp.srv_type, ret);
		
		if (!strcmp(output_msg[0],"000000"))
		{
			app_debug("%08d|%.12s <%= description %> succ [%s][%s]\n", pid, cust_head_rsp.srv_type, output_msg[0], output_msg[1]);
			
			/* multi = <%= multi %>*/
			
			<% if multi == "False" %>
			
			/***处理接收数据，打包发送*******/
			/***数据包体长度 =字段个数(字段之间+tab键)+每个参数长度*****/
			len = <%= rsp_fields.size %>+<% rsp_fields.each_with_index { |f,i| %><%= f.size %><% if i != rsp_fields.size-1 %>+<% end %><% } %>;
			
			len = len + CUST_HEAD_LEN;	
			if ((send_tmp = (char *)malloc((len+10)*sizeof(char))) == NULL)
			{
				printf("%08d|%.12s send_tmp malloc failed\n", pid, cust_head_rsp.srv_type);
				app_debug("%08d|%.12s send_tmp malloc failed\n", pid, cust_head_rsp.srv_type);
				exit (-9);
			}
			
			memset(send_tmp, 0, ((len+10)*sizeof(char)));
			pkg_head = send_tmp;
			pkg_body = send_tmp + CUST_HEAD_LEN;
			
			/***处理返回包体字段 应答无包体*****/	
			
			/* 这里需要修改!!! */
			<% rsp_fields.each_with_index { |f,i| %>
			write_fields(pkg_body, <%= f.size %>, output_para[<%= i %>][0]);   /* <%= f.name %> */
			pkg_body=pkg_body+<%= f.size %>+1;
			
			<% } %>
			
			*pkg_body = SUB;
			*(pkg_body+1) = 0;
			
			/**处理包头****/
			len = pkg_body - pkg_head +1;
			memset(buf, 0, sizeof(buf));
			sprintf(buf, "%d", len);
			write_field(cust_head_rsp.pkg_length, 5, buf);
			write_field(cust_head_rsp.cmd_flag,1,"1");
			write_field(cust_head_rsp.pkg_code, 5, "1");
			write_field(cust_head_rsp.pkg_flag, 1, "1");
			write_field(cust_head_rsp.error_code, 5, "00000");
			/****包***********/
			strncpy(send_tmp, (char *)&cust_head_rsp, CUST_HEAD_LEN);
			
			<% else %>
			
			rec_len = <%= rsp_fields.size %>+<% rsp_fields.each_with_index { |f,i| %><%= f.size %><% if i != rsp_fields.size-1 %>+<% end %><% } %>;
			len = output_count[0]*rec_len;                /***所有记录长度*****/			
			len = (len/CUST_BODY_LEN +1)*CUST_HEAD_LEN +len; /***加包头****/


			if ((send_tmp = (char *)malloc((len+10)*sizeof(char))) == NULL)
			{
				printf("%08d|%.12s send_tmp malloc failed\n", pid, cust_head_rsp.srv_type);
				app_debug("%08d|%.12s send_tmp malloc failed\n", pid, cust_head_rsp.srv_type);
				exit (-9);
			}
			
			
			
			memset(send_tmp, 0, len*sizeof(char));
			pkg_head = send_tmp;
			pkg_body = pkg_head + CUST_HEAD_LEN;
			pkg_count = 1;

			for (j=0; j<output_count[0]; j++)
			{
				/***处理一个记录*****/
				
				<% rsp_fields.each_with_index { |f,i| %>
				write_fields(pkg_body, <%= f.size %>, output_para[<%= i %>][0]);   /* <%= f.name %> */
				pkg_body=pkg_body+<%= f.size %>+1;

				<% } %>


				
				if (((pkg_body-pkg_head+rec_len+1) > CUST_PKG_LEN) && ( j<output_count[0]-1))
				{/*** 后面还有记录*****/
					#ifdef TEST
					app_debug("%08d|%.12s records continue. pkg_count[%d]\n", pid, cust_head_rsp.srv_type, pkg_count);
					#endif
					*pkg_body = SUB;
					/***包头****/
					pkg_len = pkg_body - pkg_head+1;
					memset(buf, 0, sizeof(buf));            /****包长****/
					sprintf(buf, "%d", pkg_len);
					write_field(cust_head_rsp.pkg_length, 5, buf);
					write_field(cust_head_rsp.cmd_flag,1,"1");
					memset(buf, 0, sizeof(buf));				/***第几包****/
					sprintf(buf, "%d", pkg_count);
					write_field(cust_head_rsp.pkg_code, 5, buf);
					write_field(cust_head_rsp.pkg_flag, 1, "0");
					/***** copy head*****/
					strncpy(pkg_head, (char *)&cust_head_rsp, CUST_HEAD_LEN);

					app_debug("%08d|%.12s pkg_count[%d] pkg [%s] len(pkg)[%d]\n", pid, cust_head_rsp.srv_type,
					pkg_count, pkg_head, pkg_body - pkg_head+1);

					pkg_head = pkg_body+1;
					pkg_body = pkg_head +	CUST_HEAD_LEN;
					pkg_count++;
				}
				else if (j==(output_count[0]-1))
				{/*********last pkg***************/
					#ifdef TEST
					app_debug("%08d|%.12s last records. pkg_count[%d]\n", pid, cust_head_rsp.srv_type, pkg_count);
					#endif
					*pkg_body = SUB;
					*(pkg_body + 1) = 0;
					/***包头****/
					pkg_len = pkg_body - pkg_head+1;
					memset(buf, 0, sizeof(buf));            /****包长****/
					sprintf(buf, "%d", pkg_len);
					write_field(cust_head_rsp.pkg_length, 5, buf);
					write_field(cust_head_rsp.cmd_flag,1,"1");
					memset(buf, 0, sizeof(buf));				/***第几包****/
					sprintf(buf, "%d", pkg_count);
					write_field(cust_head_rsp.pkg_code, 5, buf);
					write_field(cust_head_rsp.pkg_flag, 1, "1");
					/***** copy head*****/
					strncpy(pkg_head, (char *)&cust_head_rsp, CUST_HEAD_LEN);
					len = pkg_body - send_tmp+1;
					#ifdef TEST
					print_head(pid, &cust_head_rsp);
					printf("%08d|%.12s pkg_count[%d] pkg [%s] len(pkg)[%d]\n", pid, cust_head_rsp.srv_type,
					pkg_count, pkg_head, pkg_body - pkg_head+1);
					app_debug("%08d|%.12s pkg_count[%d] pkg [%s] len(pkg)[%d]\n", pid, cust_head_rsp.srv_type,
					pkg_count, pkg_head, pkg_body - pkg_head+1);
					#endif
				}
				else
				{/*** 0x0d,0x0a between records**************/
					*pkg_body = CR;
					pkg_body ++;
					*pkg_body = LF;
					pkg_body ++;
				}
			}
			
			<% end %>
		}
		else
		{
			app_debug("%08d|%.12s <%= description %> failed [%s][%s]\n", pid, cust_head_rsp.srv_type, output_msg[0], output_msg[1]);
			len = CUST_HEAD_LEN+2;
			if ((send_tmp = (char *)malloc(len*sizeof(char))) == NULL)
			{
				printf("%08d|%.12s send_tmp malloc failed\n", pid, cust_head_rsp.srv_type);
				app_debug("%08d|%.12s send_tmp malloc failed\n", pid, cust_head_rsp.srv_type);
				exit (-9);
			}
			memset(send_tmp,0,len*sizeof(char));
			*(send_tmp + CUST_HEAD_LEN) =SUB;
			memset(buf, 0, sizeof(buf));
			sprintf(buf, "%d", --len);
			write_field(cust_head_rsp.pkg_length, 5, buf);
			write_field(cust_head_rsp.cmd_flag,1,"0");
			write_field(cust_head_rsp.pkg_code, 5, "1");
			write_field(cust_head_rsp.pkg_flag, 1, "1");
			
			/* 根据返回类型来确认返回的不同错误代码 */
			/* 这里需要修改!!! */
			if (!strcmp(output_msg[0], "108000"))
			{
				sprintf(error_code, "%s", "00215");
			}
			else if (!strcmp(output_msg[0], "000001"))/*用户档案不存在*/
			{
				sprintf(error_code, "%s", "00101");
			}
			else if (!strcmp(output_msg[0], "108021"))
			{
				sprintf(error_code, "%s", "00210");
			}
			else if (!strcmp(output_msg[0], "108005"))
			{
				sprintf(error_code, "%s", "00209");
			}
			else
			{
				sprintf(error_code, "%s", "00215");
			}
			write_field(cust_head_rsp.error_code, 5, error_code);
			strncpy(send_tmp, (char *)&cust_head_rsp, CUST_HEAD_LEN);
		}
		*send_pkg=send_tmp;
		*send_len = len;
	}
	
	free(output_msg[0]);
	free(output_msg[1]);
	for (i=0; i<output_num; i++)
	{
		for (j=0; j<output_count[i]; j++)
		{
			free(output_para[i][j]);
		}
	}
	/* 关闭中间件连接 */
	Tpterm();
	alarm(0);
	app_debug("%08d|%.12s pkg_len[%d] sent pkg [%d][%s]\n", pid, cust_head_rsp.srv_type, *send_len, strlen(*send_pkg), *send_pkg);
	#ifdef TEST
	print_head(pid, &cust_head_rsp);
	printf("%08d|%.12s pkg body [%s]\n", pid, cust_head_rsp.srv_type, *send_pkg+CUST_HEAD_LEN);
	#endif
	
	#ifdef TEST
	time(&finish);
	elapsed_time = difftime(finish, start);
	app_debug("%08d|%.12s Program takes %6.2f seconds.\n", pid, cust_head_rsp.srv_type, elapsed_time);
	#endif
	
	app_debug("%08d|========cust_<%= name %> end========\n", pid);   
	return ret_code;
}



