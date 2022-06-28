require 'sinatra'
require 'json'
require 'rffdb'

class User < RubyFFDB::Document
  attribute :date, :class => Date
  attribute :note, :class => String

  def delete
    File.delete(self.file_path)
  end
end

user1 = User.new
user1.date = Date.new
user1.note = 'My first note'
user1.save

user2 = User.new
user2.date = Date.new
user2.note = 'Hello, this is User 2'
user2.save

get '/' do
 "<body><p>Привет! Это мой нерабочий дневник</p><p>Хочешь прочитать мои записки? Жми <a href='/diary'>сюда</a></p></body>"
end

get '/about' do
  "<h1>Страница про то, почему я решила завести дневник.</h1>"
end

get '/diary' do
 form = '<form action="/users" method="post">
 <textarea name="note" placeholder="Your note" maxlength="1000" size="50" min-height="200" required style="color:red"></textarea>
 <input type="submit" value="Добавить"/>'
 puts form

result = User.all.map { |user| "<ol><li><p>#{user.date}</p> <p>#{user.note}</p> <p>#{user.id}</p></li></ol>" }.join('')
"#{form}<ul>#{result}</ul>"
end

post '/users' do
 user = User.new
 user.date = Date.new
 user.note = params['note']
 user.save
 redirect '/diary'
end

get '/notes/:id/delete' do
  id = params['id']
  note = User.get(id)
  note.delete
  redirect '/diary'
end


