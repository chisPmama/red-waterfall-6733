class SearchController < ApplicationController
  def index
    @nation = params[:nation]

    conn = Faraday.new(url: "https://last-airbender-api.fly.dev")
    response = conn.get("/api/v1/characters?affiliation=#{@nation}&perPage=100")

    data = JSON.parse(response.body, symbolize_names: true)

    @member_results = []
    data.each do |details|
      @member_results << Member.new(details)
    end
  end
end