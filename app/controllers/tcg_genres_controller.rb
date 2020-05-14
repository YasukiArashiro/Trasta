class TcgGenresController < ApplicationController
	def create
		@tcg_genre = TcgGenre.new
		@tcg_genre.user_id = current_user.id
		@tcg_genre.tcg_tag_id = params[:tcg_tag_id]
		@tcg_genre.save
		redirect_to edit_user_path(current_user)
	end

	def destroy
		@tcg_genre = TcgGenre.find_by(user_id: current_user.id, tcg_tag_id: params[:id])
		@tcg_genre.destroy
		redirect_to edit_user_path(current_user)
	end
end
