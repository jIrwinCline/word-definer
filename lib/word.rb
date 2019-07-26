require 'pry'
require 'definitions'


class Word
  attr_reader :id
  attr_accessor :word

  @@words = {}
  @@next_id = 0

  def initialize (word, id=nil)
    @word = words
    @id = id || @@next_id += 1
  end

  def self.all()
    @@albums.values()
  end

  def self.find(id)
    @@words[id]
  end

  def self.clear
    @@words = {}
    @@next_id = 0
  end

  def save
    @@words[self.id] = Word.new(self.name,self.id)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.word()
  end

  def definitions
    Definition.find_by_word(self.id)
  end

end
