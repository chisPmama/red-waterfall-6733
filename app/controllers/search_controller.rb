class SearchController < ApplicationController
  def index
    @nation = params[:nation]

		facade = MemberFacade.new
		@member_results = facade.get_members(@nation)
  end
end