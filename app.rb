require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/albums.rb')
require('./lib/song')

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
  erb(:albums)
end

get ('/albums/new') do
  erb(:new_album)
end

get ('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

# get ('/albums/:name') do
#   @album = Album.search(params[:name])
#   erb(:album)
# end

post ('/albums') do
  name = params[:album_name]
  year = params[:album_year]
  genre = params[:album_genre]
  artist = params[:album_artist]
  album = Album.new(name, year, artist, genre, nil)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get ('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch ('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:albums)
end

delete ('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end

get ('/custom_route') do
  erb(:custom_route)
end

get ('/search_album') do
  @albums = Album.all
  erb(:albums)
end

post ('/query_album') do
  # "Hello world"
  @albums = Album.search(params[:name])
  # binding.pry
  erb(:search_album)
end
#---------------------------------------------------------------------
# Get the detail for a specific song such as lyrics and songwriters.
get ('/albums/:id/songs/:song_id') do
  @song = Song.find(params[:song_id].to_i())
  erb(:song)
end

# Post a new song. After the song is added, Sinatra will route to the view for the album the song belongs to.
post ('/albums/:id/songs') do
  @album = Album.find(params[:id].to_i())
  song = Song.new(params[:song_name], @album.id, nil)
  song.save()
  erb(:album)
end

# Edit a song and then route back to the album view.
patch ('/albums/:id/songs/:song_id') do
  @album = Album.find(params[:id].to_i())
  song = Song.find(params[:song_id].to_i())
  song.update(params[:name], @album.id)
  erb(:album)
end

# Delete a song and then route back to the album view.
delete ('/albums/:id/songs/:song_id') do
  song = Song.find(params[:song_id].to_i())
  song.delete
  @album = Album.find(params[:id].to_i())
  erb(:album)
end
