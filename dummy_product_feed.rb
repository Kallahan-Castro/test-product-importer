require 'http'

# user: API Key (found in the settings at the partner panel)
# pass: API Password (can be found in the store seettings -> Apps -> Dummy product feed)
# Registering your app with VersaCommerce shop: enter in browser http://YOUR-VERSACOMMERCE-DOMAIN.versacommerce.de/api/auth?api_key=API_KEY
# Example: http://wokiee-demo.versacommerce.de/api/auth?api_key=d42bc929264d053ba14e43c4e064e9af6ba14143



$api_key = 'd42bc929264d053ba14e43c4e064e9af6ba14143'
$password = '67b47f9609aa6497f3b694d751410698'

# domain name without '.versacommerce.de'
$shop_domain = 'wokiee-demo'



def create_product(title, code, handle, type, vendor, price, compare_at_price, stock, tag_list, description_html)
  response = HTTP.basic_auth(:user => $api_key, :pass => $password)
                  .headers(:accept => "application/json")
                  .post("https://#{$shop_domain}.versacommerce.de/api/products.json",
                        :json => {  
                                    :code => code,
                                    :visible => true,
                                    :active => true,
                                    :base_quantity => 1,
                                    :base_quantity_package => 1,
                                    :title => title,
                                    :handle => handle,
                                    :type => type,
                                    :vendor => vendor,
                                    :price => price,
                                    :compare_at_price => compare_at_price,
                                    :considers_stock => true,
                                    :available => true,
                                    :shows_stock_amount => true,
                                    :stock => stock,
                                    :base_unit => "Stück",
                                    :calculates_shipping_cost => true,
                                    :tag_list => tag_list,
                                    :description_html => description_html,
                                    :description => description_html
                                }
                        )


end



def create_images (id, urls)
  url_hash = Hash.new
  urls.each_with_index { |url, i|
    key = "image_url_#{i + 1}"
    url_hash[key] = url
  }
  response = HTTP.basic_auth(:user => $api_key, :pass => $password)
                  .headers(:accept => "application/json")
                  .put("https://#{$shop_domain}.versacommerce.de/api/products/#{id}.json", :json => { :product => url_hash } )
end
