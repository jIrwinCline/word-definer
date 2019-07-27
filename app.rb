require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word.rb')
require('./lib/definitions.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get ('/words/new') do
  erb(:new_word)
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

# get ('/words/:spelling') do
#   @word = Word.search(params[:spelling])
#   erb(:word)
# end

post ('/words') do
  spelling = params[:spelling]
  word = Word.new(spelling)
  word.save()
  @words = Word.all()
  erb(:words)
end

get ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:spelling])
  @words = Word.all
  erb(:words)
end

delete ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

get ('/custom_route') do
  erb(:custom_route)
end

get ('/search_word') do
  @words = Word.all
  erb(:words)
end

post ('/query_word') do
  # "Hello world"
  @words = Word.search(params[:spelling])
  # binding.pry
  erb(:search_word)
end
#-------------------------------------------------------------
get ('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definitions)
end

post ('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition], @word.id)
  definition.save()
  erb(:word)
end

patch ('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:spelling], @word.id, params[:definitionwriter])
  erb(:word)
end

delete ('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
