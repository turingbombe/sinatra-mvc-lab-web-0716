require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    @piglatin =PigLatinizer.new
    @user_phrase = params[:user_phrase]
    erb :user_output
  end
end