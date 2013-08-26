# Douban OAuth认证包括以下四步内容
# 1. 获取Request Token
# 2. 用户确认授权
# 3. 换取Access Token
# 4. 访问受限资源
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

puts "1. 获取Request Token"
@request_token=@consumer.get_request_token

puts "2. 用户确认授权"
puts "请将下面url粘贴到浏览器中，并同意授权，同意后按任意键继续:"
puts @request_token.authorize_url
gets

puts "3. 换取Access Token"
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

puts "4. 访问受限资源"
@response = @access_token.get "http://api.douban.com/people/lyuehh/miniblog/contacts?start-index=1&max-results=10"
puts @response
#@response=@access_token.post "/miniblog/saying", %q{<?xml version='1.0' encoding='UTF-8'?>
#  <entry xmlns:ns0="http://www.w3.org/2005/Atom" xmlns:db="http://www.douban.com/xmlns/">
#    <content>Ruby OAuth Authorized</content>
#  </entry>
#},  {"Content-Type" =>  "application/atom+xml"}
