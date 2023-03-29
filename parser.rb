require 'http'
require 'json'
require './dummy_product_feed'

collections = HTTP.get('https://shella-demo10.myshopify.com/collections.json')
puts(collections.code)


collections_hash = JSON.parse(collections)

collections_hash["collections"].each { |collection|

  puts("fetching collection: #{collection["handle"]}")

  collection_products = HTTP.get("https://shella-demo10.myshopify.com/collections/#{collection["handle"]}/products.json")
  collection_products_hash = JSON.parse(collection_products)

  collection_products_hash["products"].each { |product|
    prng = Random.new
    images = []
    puts("    #{product['title']}")
    title = product['title']
    code = "shella-#{product['id']}"
    handle = product['handle']
    type = product['product_type']
    vendor = product['vendor']
    price = product['variants'][0]['price']
    compare_at_price = product['variants'][0]['compare_at_price']
    stock = prng.rand(51)
    tag_list = product['tags']
    description_html = product['body_html']
    product['images'].each { |url| images.push(url['src']) }

    begin
      product_response = create_product(title, code, handle, type, vendor, price, compare_at_price, stock, tag_list, description_html)
      puts (product_response.code)
      if product_response.code == 422 then
        puts("Product '#{title}' already added. Skip!")
        IO.write("error-log.txt", "Error with #{title}: #{product_response.reason}#{$/}", mode: 'a')
        next
      end
    rescue StandardError => e
      puts ("error: #{e}")
      IO.write("error-log.txt", "Error with #{title}: #{e}#{$/}", mode: 'a')
      next
    end

    product_id = JSON.parse(product_response)['product']['id']

    begin
      images_response = create_images(product_id, images)
      puts (images_response.code)
      if not images_response.status.success? then
        puts(images_response.to_s)
      end
    rescue StandardError => e
      puts "Error on image creation"
      IO.write("error-log.txt", "Error with images for #{title}: #{e}#{$/}", mode: 'a')
      next
    end

  }

}
