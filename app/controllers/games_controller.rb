require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @dictionary = JSON.parse(open(url).read)['found']
    @included = @word.chars.all? do |letter|
      @count1 = @letters.count(letter)
      @count2 = @word.count(letter)
      @count1 >= @count2
    end
  end
end
