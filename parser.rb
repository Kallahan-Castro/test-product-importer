require 'http'
require 'json'

collections = HTTP.get('https://shella-demo10.myshopify.com/collections.json')
puts(collections.code)
puts(collections.to_s)

