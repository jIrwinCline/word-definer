require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
#
# describe('create an album path', {:type => :feature}) do
#   it('creates an album and then goes to the album page') do
#     visit('/albums')
#     click_on('Add a new album')
#     fill_in('album_name', :with => 'Yellow Submarine')
#     click_on('Go!')
#     expect(page).to have_content('Yellow Submarine')
#   end
# end
#
# describe('create a song path', {:type => :feature}) do
#   it('creates an album and then goes to the album page') do
#     album = Album.new("Yellow Submarine",1965,"xxx", "xxx", nil)
#     album.save
#     visit("/albums/#{album.id}")
#     fill_in('song_name', :with => 'All You Need Is Love')
#     fill_in('songwriter', :with => 'songwriter')
#     click_on('Add song')
#     expect(page).to have_content('All You Need Is Love')
#   end
# end
#
# describe('create an album path', {:type => :feature}) do
#   it('creates an album and then goes to the album page') do
#     visit('/albums')
#     save_and_open_page
#     click_on('Add a new album')
#     fill_in('album_name', :with => 'Yellow Submarine')
#     click_on('Go!')
#     expect(page).to have_content('Yellow Submarine')
#   end
# end
