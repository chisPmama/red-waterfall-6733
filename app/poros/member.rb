class Member
  attr_reader :id, :name, :allies, :enemies, :affiliations
  
    def initialize(data)
      @id = data[:_id]
      @name = data[:name]
      @allies = data[:allies]
      @enemies = data[:enemies]
      @affiliations = data[:affiliations]
    end
  
  end