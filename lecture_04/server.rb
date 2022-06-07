require 'sinatra'
require "sinatra/cookies"
require 'json'

class User
  attr_reader :name, :login, :password

  def initialize(name, login, password)
    @name = name
    @login = login.strip
    @password = password.strip
  end

  def to_json2
    JSON.generate({name: name})
  end


  def as_json
    {name: self.name, login: self.login, password: self.password}
  end
end


def db_get_rows
  File.open('db_users.txt').readlines.reject { |str| str == '\n' }.map do |str|
    name, login, password = str.split(';')
    User.new(name, login, password)
  end
end


def db_get_user_by_login_password(login, password)
  users = db_get_rows

  user = users.select { |user| user.login == login and password == password }.first
  user
end





key_taxdome_id = 'taxdome_user_id'


get '/users' do
 username = cookies['username'] || 'Unauthorised'
 users = db_get_rows
 puts users.inspect
 user_list  = users.map { |user| "<li>#{user.name} #{user.login}</li>" }.join('<br/>')

  %|
  <h1>
     hello my friend (user_id #{username})
  </h1>
#{user_list}
|
end


get '/users.json' do
 users = db_get_rows
 result = users.map { |user| user.as_json }
 headers['X-APP-VERSION'] = 'v123'
 headers['Content-Type'] = 'application/json'
 JSON.generate(result)
end



post '/signin' do
  user = db_get_user_by_login_password(params[:username], params[:password])
  cookies['username'] = params[:username]
  "OK Im done"
end






get '/' do
  username = cookies['username'] || 'Unauthorised'
  %|
  <h1>
     hello my friend (user_id #{username})
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

