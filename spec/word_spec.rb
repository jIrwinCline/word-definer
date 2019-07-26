require 'rspec'
require 'word'

describe '#Word' do
  before(:each) do
    Word.clear()
  end
  describe '.all' do
    it("returns empty array because nothing has been saved") do
      expect(Word.all.to(eq([]))
    end
  end
  # describe '#save' do
  #   it('saves the word') do
  #     word = Word.new("word")
  #     word.save()
  #     expect(Word.all).to(eq([word]))
  #   end
  # end
  # describe '#==' do
  #   it "is the same word if it has the same attributes as the other word" do
  #     word1 = Word.new("word")
  #     word2 = Word.new("word")
  #     expect(word1 == word2).to eq(true)
  #   end
  #   it "is the not same word if it doesn't have the same attributes as the other word" do
  #     word1 = Word.new("word")
  #     word2 = Word.new("word")
  #     expect(word1 == word2).to eq(false)
  #   end
  # end
  # describe '.clear' do
  #   it "clears all words" do
  #     word1 = Word.new("word")
  #     word2 = Word.new("word")
  #     word1.save()
  #     word2.save()
  #     Word.clear()
  #     expect(Word.all).to eq([])
  #   end
  # end
  # describe '.find' do
  #   it "finds a word by id" do
  #     word1 = Word.new("word")
  #     word2 = Word.new("word")
  #     word1.save()
  #     word2.save()
  #     expect(Word.find(word1.id)).to eq(word1)
  #     expect(Word.find(word2.id)).to eq(word2)
  #   end
  # end
  # describe '' do
  #   it "" do
  #
  #   end
  # end
  # describe '' do
  #   it "" do
  #
  #   end
  # end

end # end of tests
