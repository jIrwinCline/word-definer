require("pry")
require("word")

class Definition
  attr_reader :id
  attr_accessor :text, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(text, word_id, id=nil)
    @text = text
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@definitions.values()
  end

  def self.find(id)
    @@definitions[id]
  end

end
