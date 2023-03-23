require 'http'



response = HTTP.basic_auth(:user => 'api', :pass => '61924a4e1c5c72e037e13f6e2c37884770d8220b')
                .headers(:accept => "application/json")
                .post("https://synth-shop.versacommerce.de/api/customers.json", 
                        :json => { 
                                    :active => true,
                                    :email => "test-13@mail.com",
                                    :registered => true,
                                    :billing_address =>  { "firstname" => "Test", "lastname" => "13" },
                                    :firstname => "Test", 
                                    :lastname => "13"
                                }
                )

puts (response.code)
puts (response.to_s)