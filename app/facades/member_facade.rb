class MemberFacade
	def get_members(nation)
		service = SearchService.new
		member_data = parse_json(service.get_members(nation))
	end

	def parse_json(data)
		data = JSON.parse(data.body, symbolize_names: true)
		member_results = []
    data.each do |details|
      member_results << Member.new(details)
    end
		member_results
	end
end