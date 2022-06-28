require 'sqlite3'
require 'sinatra'
require 'sinatra/cookies'
require 'json'

db = SQLite3::Database.open 'diary.db'

db.execute <<-SQL
  create table notes (
    date varchar(50),
    subject varchar(50),
    note varchar(50)
  );
SQL

# Execute inserts with parameter markers
db.execute("INSERT INTO notes (date, subject, note) 
            VALUES (?, ?, ?, ?)", ["Jane", "me@janedoe.com", "A", "http://blog.janedoe.com"])

db.execute( "select * from students" ) do |row|
  p row
end

get '/about' do
end

get '/' do
end
