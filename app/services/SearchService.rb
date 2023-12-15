class SearchService
  def conn
		conn = Faraday.new(url: "https://last-airbender-api.fly.dev")
	end
	
	def get_members(nation)
    response = conn.get("/api/v1/characters?affiliation=#{nation}&perPage=100")
	end
end