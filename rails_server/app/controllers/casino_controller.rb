class CasinoController < ApplicationController
  def index
    session[:balance] ||= 12
    session[:random] ||= 50
    session[:value] ||= random(100)

    @balance = session[:balance]
    @random = session[:random]
    @value =  session[:value]
  end

  def hit
    less = params[:less] || false
    balance = session[:balance].to_i
    random = session[:random].to_i
    value =  session[:value].to_i

    Rails.logger.debug "balance: #{balance}"
    Rails.logger.debug "random: #{random}"
    Rails.logger.debug "value: #{value}"

    if random  < value
      Rails.logger.debug "*** win branch"
      flash[:notice] =  "You win!!! Value was #{value} Random #{random}"
      balance  = less ? balance + 1 : balance -  1
    else
      Rails.logger.debug "*** loose branch"
      flash[:notice] =  "You loose!!! Value was #{value} Random #{random}"
      balance  = less ? balance - 1 : balance +  1
    end
    session[:balance] = balance

    reset_game_values

    redirect_to action: :index
  end


  private

  def reset_game_values
    session[:random] = Random.rand(100)
    session[:value] = Random.rand(100)
  end

end
