require 'uri'
require 'net/http'
require 'base64'
require 'AESCrypt'


API_AUTH_NAME = "MX3ADMIN"
API_AUTH_PASSWORD = "MX3PASSWORD"
basicauthstring = API_AUTH_NAME+":"+API_AUTH_PASSWORD
enc = Base64.encode64(basicauthstring)
full_name = "Thanh Nguyen"
email = "tnguyenuni@gmail.com"
rawpass = "thanhvtd86"
encrypted_pass = AESCrypt.encrypt(rawpass,API_AUTH_PASSWORD)

url = URI("http://localhost:3000/api/signup")
http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["content-type"] = "application/json"
request["authorization"] = "Basic #{enc}"
request["cache-control"] = "no-cache"

post_body = []
post_body << "{\n"
post_body << "\t\"full_name\":\"Thanh Nguyen\",\n"
post_body << "\t\"email\":\"#{email}\",\n"
post_body << "\t\"password\":\"#{encrypted_pass}\"\n"
post_body << "}"

request.body = post_body.join
response = http.request(request)
puts response.code
puts response.body