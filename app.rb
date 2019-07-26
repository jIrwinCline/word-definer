require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word.rb')
# require('./lib/definitions.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

get ('/words/new') do
  erb(:new_word)
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

# post ('/words') do
#   name = params[:word]
#   word = Word.new(word)
#   word.save()
#   @words = Word.all()
#   erb(:word)
# end

post ('/words') do
  spelling = params[:spelling]
  word = Word.new(spelling)
  word.save()
  @words = Word.all()
  erb(:word)
  # redirect to('/words')
end
