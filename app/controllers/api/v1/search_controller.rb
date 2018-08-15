class Api::V1::SearchController < Api::V1::BaseController

	def show
		search_params = (params[:search] || "").downcase
		books = Book.full_text_search(search_params, match: :all)
		render json: books,each_serializer: BookSerializer
	end

end