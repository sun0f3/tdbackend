require 'sinatra'
require 'json'
require_relative 'product.rb'

get '/' do
  "<body><a href='/app'>перейти в магазин</a></body>"
end

get '/app' do
  result = Product.all.map { |product|  "<li>#{product.name} #{product.price}</li>" }.join('')
  %|
<ul>#{result}</ul>
<form action="/products" method="post" style="border: 4px solid red;padding: 12px"><input name="name" placeholder="name"/><input name="price" type="number" placeholder="price" />
<input type="submit"/>
</form>
|

end

get '/about' do
end

get '/products/:id' do
  discount = params[:discount].to_i
  product = Product.get(params[:id])
  "<h1>#{product.name}</h1><p>price is : #{product.price * (100 - discount)/ 100.0 } </p>"
end

post '/products' do
  product =  Product.new
  product.name = params['name']
  product.price = params['price'].to_f
  product.save
  redirect '/app'
end
