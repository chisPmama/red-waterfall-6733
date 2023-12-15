class Member
  attr_reader :id, :name, :allies, :enemies, :affiliation, :photo_url
  
    def initialize(data)
      @id = data[:_id]
      @name = data[:name]
      @allies = data[:allies].empty? ? ["None"] : data[:allies]
      @enemies = data[:enemies].empty? ? ["None"] : data[:enemies]
      @affiliation = data[:affiliation]
      @photo_url = data[:photoUrl]
    end
  
  end