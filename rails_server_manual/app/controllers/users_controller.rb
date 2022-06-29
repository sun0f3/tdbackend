'/users'
class UsersController < ApplicationController
  def qwe
  end

  def index
    @users = [{name: 'Eugene'}, {name: 'Vasya'}]

    render 'index', layout: 'special_custom'
  end
end
