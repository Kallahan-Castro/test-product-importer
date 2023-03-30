require 'http'
require 'json'

# some product id number
id = 2549043

response = HTTP.basic_auth(:user => 'd42bc929264d053ba14e43c4e064e9af6ba14143', :pass => '22b588e8db008ab80716145a3ad2dc0c')
                  .headers(:accept => "application/json")
                  .get("https://shoe-shop.versacommerce.de/api/products/#{id}.json")

IO.write("product_check.txt", "#{response.to_s}#{$/}", mode: 'a')                