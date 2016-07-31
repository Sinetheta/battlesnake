require 'sinatra'
require 'json'
require 'pry'
require './lib/board'
require './lib/snake'

set :bind, '0.0.0.0'

before do
  request.body.rewind
  @request_payload = JSON.parse request.body.read
end

post '/start' do
  responseObject = {
    name: "Serpentor",
    color: "#C32327",
    head_url: "http://i.imgur.com/9Zkmwgm.png",
    taunt: "As of now, your little project is deader than disco!"
  }

  return responseObject.to_json
end

post '/move' do
  board = Board.new(@request_payload['snakes'], @request_payload['board'])
  my_snake = board.find_snake("Serpentor")

  responseObject = {
    move: my_snake.next_move(board)
  }

  return responseObject.to_json
end
