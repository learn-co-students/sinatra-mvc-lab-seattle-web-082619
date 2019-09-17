require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'
require 'pry'

class App < Sinatra::Base

    get '/' do
        erb :user_input 
    end

    post '/piglatinize' do
        # binding.pry
        @original = PigLatinizer.new(params["text"])
        erb :piglatinize
    end
end
