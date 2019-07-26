require 'pry'
# require 'definitions'


class Word
  attr_reader :id
  attr_accessor :spelling

  @@words = {}
  @@total_rows = 0

  def initialize(spelling, id=nil)
    @spelling = spelling
    # @songs = []
    @id = id || @@total_rows += 1 #ask about this
  end

  def self.all()
    @@words.values()
  end

  def self.find(id)
    @@words[id]
  end

  def self.search(query)
    @@words.values.select { |word| word.spelling == query }
  end

  def self.sort
    @@words.values.sort
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def save
    @@words[self.id] = Word.new(self.spelling,self.id)
  end

  def ==(word_to_compare)
    self.spelling() == word_to_compare.spelling()
  end

  def update(spelling)
    self.spelling = spelling
    @@words[self.id] = Word.new(self.spelling,self.id)
  end

  def delete
    @@words.delete(self.id)
  end

  def songs
    Definition.find_by_word(self.id)
  end

end
