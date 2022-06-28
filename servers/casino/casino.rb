require 'sinatra'

get '/' do
%|
<head>
<style>
h1 { color: #111; font-family: 'Helvetica Neue', sans-serif; font-size: 25px; font-weight: bold; letter-spacing: -1px; line-height: 1; text-align: center; margin-top: 30px; }
label { color: #685206; font-family: 'Helvetica Neue', sans-serif; font-size: 14px; line-height: 24px; margin: 0 0 24px; text-align: justify; text-justify: inter-word; }
input { height: 25px; width: 150px;}
form {margin-left: 30%; margin-top: 25px;}
</style>
<a href="/app"> Go to casino </a>
|
end

get '/about' do
%|
<head>
<style>
h1 { color: #111; font-family: 'Helvetica Neue', sans-serif; font-size: 25px; font-weight: bold; letter-spacing: -1px; line-height: 1; text-align: center; margin-top: 30px; }
label { color: #685206; font-family: 'Helvetica Neue', sans-serif; font-size: 14px; line-height: 24px; margin: 0 0 24px; text-align: justify; text-justify: inter-word; }
input { height: 25px; width: 150px;}
form {margin-left: 30%; margin-top: 25px;}
</style>
<h1> Welcome to my casino! </h1>
<p> This casino is owned by Ollie</p>
<p> Feel free to make a bet!</p>
|
end

get '/app' do
%|
<head>
<style>
h1 { color: #111; font-family: 'Helvetica Neue', sans-serif; font-size: 25px; font-weight: bold; letter-spacing: -1px; line-height: 1; text-align: center; margin-top: 30px; }
label { color: #685206; font-family: 'Helvetica Neue', sans-serif; font-size: 14px; line-height: 24px; margin: 0 0 24px; text-align: justify; text-justify: inter-word; }
input { height: 25px; width: 150px;}
form {margin-left: 30%; margin-top: 25px;}
</style>
<h1> Welcome to my casino! </h1>
<form action="bet" method="post">
    <label for="bet">Enter a number from 1 to 10 </label>
   <input type="number" id="bet" name="bet" min="1" max="10">
  <input type="submit">
</form>
|
end

post '/bet' do
random = rand(1..10)
a = params[:bet].to_i
if a == random 
"You're lucky today!"
  else
  "Try again"
  end
  %|
  <a href="/app"> Go to casino </a>
  |
end
