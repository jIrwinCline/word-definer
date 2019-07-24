require 'rspec'
require 'albums'

describe '#Album' do
  before(:each) do
     Album.clear()
   end
  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end
  describe('#save') do
    it("saves an album") do
      album = Album.new("Giant Steps", 1990, "xxxx", "blues", nil) # nil added as second argument
      album.save()
      album2 = Album.new("Blue", 1950, "yyyy", "jazz", nil) # nil added as second argument
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end
  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Blue", 1950, "yyyy", "jazz", nil)
      album2 = Album.new("Blue", 1950, "yyyy", "jazz", nil)
      expect(album).to(eq(album2))
    end
  end
  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Giant Steps", 1990, "xxxx", "blues", nil)
      album.save()
      album2 = Album.new("Blue", 1950, "yyyy", "jazz", nil)
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end
  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Giant Steps", 1990, "xxxx", "blues", nil)
      album.save()
      album2 = Album.new("Blue", 1950, "yyyy", "jazz", nil)
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end
  describe('#update') do
  it("updates an album by id") do
    album = Album.new("Giant Steps", 1990, "xxxx", "blues", nil)
    album.save()
    album.update("A Love Supreme")
    expect(album.name).to(eq("A Love Supreme"))
  end
end
describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", 1990, "xxxx", "blues", nil)
      album.save()
      album2 = Album.new("Blue", 1950, "yyyy", "jazz", nil)
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end
describe('.search') do
    it("search an album by name") do
      album = Album.new("black album", 2000, "metallica", "heavy metal", nil)
      album.save()
      # binding.pry
      expect(Album.search("black album")).to(eq([album]))
    end
  end
describe('.sort') do
    it("sort all albums alphabetically") do
      album = Album.new("black album", 2000, "metallica", "heavy metal", nil)
      album.save()
      album2 = Album.new("an album", 1999, "xxx", "metal", nil)
      album2.save()
      # expect(Album.sort).to(eq([album]))
    end
  end
end
