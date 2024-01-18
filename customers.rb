require 'http'
require 'json'


api_key = '094883e2b122699efb70eed61bcca6cc94dd527b'
password = 'f2f8e949486e50a035cc63bbbf69c3e0'


response = HTTP.basic_auth(:user => api_key, :pass => password)
                  .headers(:accept => "application/json")
                  .get("https://damp-waterfall-6.versacommerce.de/api/customers.json")


puts(response.code)
count = 0 

customers = JSON.parse(response)

customers.each do |customer|
  if not customer['customer']['active'] and customer['customer']['accepts_newsletter']  then
    puts("customer: #{customer['customer']['firstname']}")
  end
end