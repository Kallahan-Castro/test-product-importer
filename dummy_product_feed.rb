require 'http'


# user: API Key (found in the settings at the partner panel)
# pass: API Password (can be found in the store seettings -> Apps -> Dummy product feed)

def create_product(title, code, handle, type, vendor, price, compare_at_price, stock, tag_list, description_html)
  response = HTTP.basic_auth(:user => 'd42bc929264d053ba14e43c4e064e9af6ba14143', :pass => '22b588e8db008ab80716145a3ad2dc0c')
                  .headers(:accept => "application/json")
                  .post("https://shoe-shop.versacommerce.de/api/products.json",
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
  response = HTTP.basic_auth(:user => 'd42bc929264d053ba14e43c4e064e9af6ba14143', :pass => '22b588e8db008ab80716145a3ad2dc0c')
                  .headers(:accept => "application/json")
                  .put("https://shoe-shop.versacommerce.de/api/products/#{id}.json", :json => { :product => url_hash } )
end
