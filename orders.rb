require 'http'
require 'json'


api_key = '094883e2b122699efb70eed61bcca6cc94dd527b'
password = 'a578ef51edd938b44b0345e2059c9a1c'


response = HTTP.basic_auth(:user => api_key, :pass => password)
                  .headers(:accept => "application/json")
                  .get("https://restless-paper-17.versacommerce.de/api/orders/2677372.json")


puts(response.code) 
order = JSON.parse(response)
puts("order #{order['order']['id']}: code #{order['order']['code']} - total = #{order['order']['total']}")
puts("shipping_cost: #{order['order']['shipping_cost']}")
puts "\n"


response = HTTP.basic_auth(:user => api_key, :pass => password)
                  .headers(:accept => "application/json")
                  .get("https://restless-paper-17.versacommerce.de/api/orders/2677372/items.json")

order_items = JSON.parse(response)

order_items.each do |item|
  puts("editable_shipping_type: #{item['item']['editable_shipping_type']}")
  puts("extra_price: #{item['item']['extra_price']}")
  puts("shipping_type: #{item['item']['shipping_type']}")
  puts("quantity: #{item['item']['quantity']}")
  puts "--------------------------"
 end