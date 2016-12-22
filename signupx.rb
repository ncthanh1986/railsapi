require 'uri'
require 'net/http'
require 'openssl'
require 'base64'
require 'AESCrypt'

full_name = "Thanh Nguyen"
email = "ncthanh1980@gmail.com"
rawpass = "thanhvtd86"

API_AUTH_PASSWORD = "MX3PASSWORD"
API_AUTH_NAME = "MX3ADMIN"
basicauthstring = API_AUTH_NAME+":"+API_AUTH_PASSWORD
enc = Base64.encode64(basicauthstring).strip

encrypted_pass = AESCrypt.encrypt(rawpass,API_AUTH_PASSWORD).strip

url = URI("https://railsapimx3.herokuapp.com/api/signup")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json'
request["authorization"] = "Basic #{enc}"
request["cache-control"] = 'no-cache'
request["postman-token"] = '7a8b0019-555c-ea97-fde0-84d525e30d08'
request.body = "{\n\t\"full_name\":\"#{full_name}\",\n\t\"email\":\"#{email}\",\n\t\"password\":\"#{encrypted_pass}\"\n}\n"

response = http.request(request)
puts response.read_body