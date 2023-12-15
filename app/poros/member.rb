class Member
  attr_reader :id, :name, :allies, :enemies, :affiliation
  
    def initialize(data)
      @id = data[:_id]
      @name = data[:name]
      @allies = data[:allies].empty? ? "NONE" : data[:allies]
      @enemies = data[:enemies].empty? ? "NONE" : data[:enemies]
      @affiliation = data[:affiliation]
    end
  
  end