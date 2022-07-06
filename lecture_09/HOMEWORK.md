
# TODO

## Let's DIG IT DEEPER

* check you have `dig` cli in your terminal. If it's not, try to install via package manager or use web version tool like this https://www.digwebinterface.com/

* launch several DNS requests like this `dig taxdome.com`
Find A-records in response

* Try to find MX-records adding `mx` in the end `dig taxdome.com mx` or `any` if you wish see all records

* try to see whole dns process lookup via command `dig +trace taxdome.com`



## Ruby & ActiveRecord
### TIPS

* inside sqlite REPL use `.help` to see all commands
* `.q` for quit
* `.tables` to see all tables inside db


# TODO

* check demo.rb out and launch it by `ruby demo.rb`

* connect to db `sqlite3 demo.db` and write `.tables` to check it out

* launch `SELECT * FROM users` sql command

* try to create new db via sqlite3 `sqlite3 new_db.db`

* create fields for users `CREATE TABLE IF NOT EXISTS users (name TEXT, age INT);`

* change demo.rb code to make it work with your new database you just created
