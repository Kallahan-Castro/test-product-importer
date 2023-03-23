require 'http'
require 'json'

collections = HTTP.get('https://shella-demo10.myshopify.com/collections.json')
puts(collections.code)
# puts(collections.to_s)



collections_hash = JSON.parse(collections)

collections_hash["collections"].each { |collection|

  puts("fetching collection: " + collection["handle"])
  collection_products = HTTP.get("https://shella-demo10.myshopify.com/collections/#{collection["handle"]}/products.json")
  collection_products_hash = JSON.parse(collection_products)
  collection_products_hash["products"].each { |product|
    #puts("    " + product['title'])
    title = product['title']
    code = 'shella-demo-product-' + product['id']
    handle = product['handle']
    type = product['product_type']
    vendor = product['vendor']
    price = product['variants'][0]['price']
    compare_at_price = product['variant'][0]['compare_at_price']
    stock = product['']
  }

}
