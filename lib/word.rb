require 'pry'
# require 'definitions'


class Word
  attr_accessor :spelling, :id
  @@words = {}
  @@nextId = 0

  def initialize(spelling, id=nil)
    @spelling = spelling
    @id = id || @@nextId += 1
  end

  def self.all
    @@words.values()
  end

  def self.find(id)
    @@words[id]
  end

  def self.clear
    @@words = {}
    @@nextId = 0
  end
  def save
    @@words[self.id] = Word.new(self.spelling,self.id)
  end
  #for testing
  def ==(word_to_compare)
    self.spelling() == word_to_compare.spelling()
  end

  def definitions
    Definition.find_by_word(self.id)
  end

end
