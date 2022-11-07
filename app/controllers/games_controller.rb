require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    parse = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{@word}").read)
    if parse['found'] == false
      @message = "Sorry but #{@word} does not seem to be a valid English word..."
    elsif @word.chars.all? { |letters| @word.count(letters) <= params[:letters].count(letters) }
      @message = "Congratulations! #{@word} is a valid English word!"
    else  @message =  "can't be built out of the words..."
    end
  end
end
