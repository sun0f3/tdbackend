require 'active_record'

# create sqlite3 database if it is not exists via cli `sqlite3 demo.db`
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'demo.db')


# Expects a table named `users`  by convention
# Example SQLite3 statement to create table:
# CREATE TABLE IF NOT EXISTS users (name TEXT, age INT);
class User < ActiveRecord::Base
  # fields name and  age are detected automatically
end

# Create a new user object then save it to store in database
new_user = User.new(name: 'Dano', age: 30)
new_user.save

User.new { |u|
    u.name = 'NanoDano'
    u.age = 60
}.save

# Create and save in one step with `.create()`
User.create(name: 'John Leon', age: 90)

puts User.all.inspect
puts '*******'
puts User.find_by(name: 'John Leon').inspect
