# Douban OAuth��֤���������Ĳ�����
# 1. ��ȡRequest Token
# 2. �û�ȷ����Ȩ
# 3. ��ȡAccess Token
# 4. ����������Դ
require "rubygems"
require 'oauth'
require 'oauth/consumer'
api_key = ""
api_key_secret = ""
@consumer=OAuth::Consumer.new(
                                api_key, 
                                api_key_secret, 
                                { 
                                  :site=>"http://www.douban.com",
                                  :request_token_path=>"/service/auth/request_token",
                                  :access_token_path=>"/service/auth/access_token",
                                  :authorize_path=>"/service/auth/authorize",
                                  :signature_method=>"HMAC-SHA1",
                                  :scheme=>:header,
                                  :realm=>"http://yoursite.com"
                                }
                               )

puts "1. ��ȡRequest Token"
@request_token=@consumer.get_request_token

puts "2. �û�ȷ����Ȩ"
puts "�뽫����urlճ����������У���ͬ����Ȩ��ͬ������������:"
puts @request_token.authorize_url
gets

puts "3. ��ȡAccess Token"
@access_token=@request_token.get_access_token

# i should re-generate access_token proxy here, 
# since ruby oauth library assume the domain of the auth site should be same with the resource site
@access_token = OAuth::AccessToken.new(
                                        OAuth::Consumer.new(
                                                              api_key,  
                                                              api_key_secret, 
                                                              {
                                                                :site=>"http://api.douban.com",
                                                                :scheme=>:header,
                                                                :signature_method=>"HMAC-SHA1",
                                                                :realm=>"http://yoursite.com"
                                                              }
                                                             ),
                                          @access_token.token,
                                          @access_token.secret
                                         )

puts "4. ����������Դ"
@response = @access_token.get "http://api.douban.com/people/lyuehh/miniblog/contacts?start-index=1&max-results=10"
puts @response
#@response=@access_token.post "/miniblog/saying", %q{<?xml version='1.0' encoding='UTF-8'?>
#  <entry xmlns:ns0="http://www.w3.org/2005/Atom" xmlns:db="http://www.douban.com/xmlns/">
#    <content>Ruby OAuth Authorized</content>
#  </entry>
#},  {"Content-Type" =>  "application/atom+xml"}
