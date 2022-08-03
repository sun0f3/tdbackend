class PageController < ApplicationController

  def qwe
    cookies[:user_id] = cookies[:user_id] || Random.rand(1000000)
    cookies[:events2] = cookies[:events2].to_s + "-contacts"
    headers['anyheader'] = 777
  end
end
