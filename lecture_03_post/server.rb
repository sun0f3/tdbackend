
require 'sinatra'
require 'redis'

db = Redis.new

key_taxdome_id = 'taxdome_user_id'

get '/' do
  user_id = db.get(key_taxdome_id)

  %|
  <h1>
     hello my friend (user_id #{user_id})
  </h1>
<p>
<form action='/signin' method="post">
    <label for="username">nickname </label><br>
  <input type="text" name="username" value="admin"><br>
    <label for="password">password </label><br>
  <input type="text" name="password" value="Ab12345678"><br>
  <input type="submit">
</form>
</p>
|
end

get '/signin' do
%{
<form action='/signin' method="post">
    <label for="username">nickname </label><br>
  <input type="text" name="username" value="admin"><br>
    <label for="password">password </label><br>
  <input type="text" name="password" value="Ab12345678"><br>
  <input type="submit">
</form>
}
end

post '/signin' do
  if params['username'] == 'admin' && params[:password] == 'Ab12345678'
  db.set(key_taxdome_id, Random.rand(100))
  "Success"
  else
  "Error"
  end
end
