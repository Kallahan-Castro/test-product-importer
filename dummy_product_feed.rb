require 'http'

# user: API Key (found in the settings at the partner panel)
# pass: API Password (can be found in the store seettings -> Apps -> Dummy product feed)
=begin
product_creation_response = HTTP.basic_auth(:user => 'd42bc929264d053ba14e43c4e064e9af6ba14143', :pass => '22b588e8db008ab80716145a3ad2dc0c')
                .headers(:accept => "application/json")
                .post("https://shoe-shop.versacommerce.de/api/products.json",
                        :json => {  
                                    :code => "857310560308-ab3f8",
                                    :visible => true,
                                    :active => true,
                                    :base_quantity => 1,
                                    :base_quantity_package => 1,
                                    :title => "Faux shearling double-breasted coat [1]",
                                    :handle => "drawstring-sweater",
                                    :type => "T-Shirts",
                                    :vendor => "Versace",
                                    :price => 89.00,
                                    :compare_at_price => 109.99,
                                    :considers_stock => true,
                                    :available => true,
                                    :shows_stock_amount => true,
                                    :stock => 10,
                                    :base_unit => "Stück",
                                    :calculates_shipping_cost => true,
                                    :tag_list => "$100-$200, Awesome, Beachwear, Denim, Handbags, Hats, Heels, Hoodies & Sweatshirts, Jackets & Coats, Orange, Pink, S, Shirts, Slippers, Summer, Sunglasses, T-Shirts & Tanks, Trainers, Versace, Vintage, Violet, Women, XS, Yellow",
                                    :description_html => "<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</p>\n<p>Omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores.</p>\n<ul class=\"tt-tabs-product__list\">\n<li><span>Omnis iste natus error sit voluptatem</span></li>\n<li><span>Accusantium doloremque</span></li>\n<li><span>Laudantium, totam rem aperiam,</span></li>\n<li><span>Eaque ipsa quae ab illo inventore veritatis</span></li>\n</ul>"
                                }
                )

puts (product_creation_response.code)
puts (product_creation_response.to_s)
=end
image_creation_response = HTTP.basic_auth(:user => 'd42bc929264d053ba14e43c4e064e9af6ba14143', :pass => '22b588e8db008ab80716145a3ad2dc0c')
                                          .headers(:accept => "application/json")
                                          .put("https://shoe-shop.versacommerce.de/api/products/2543595.json",
                                            :json => {
                                              :product => {
                                                "image_url_3" => "https://cdn.shopify.com/s/files/1/0026/2910/7764/products/1431407625_2_2_1.jpg?v=1525099720",
                                                "image_url_4" => "https://cdn.shopify.com/s/files/1/0026/2910/7764/products/1431407625_2_3_1.jpg?v=1525099720",
                                                "image_url_5" => "https://cdn.shopify.com/s/files/1/0026/2910/7764/products/1431407625_2_4_1.jpg?v=1525099720",
                                                "image_url_6" => "https://cdn.shopify.com/s/files/1/0026/2910/7764/products/1431407625_1_1_1.jpg?v=1525099720"
                                              }
                                            }
                                          )


puts (image_creation_response.code)
puts (image_creation_response.to_s)