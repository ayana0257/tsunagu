class FavoritesController < ApplicationController

	def create
		@party_id = Party.find(params[:id]).id #特定のitemのid
	    #item_idに@item_id、user_idに@user_idを入れて、Favoriteモデルに新しいオブジェクトを作る
	    if user_signed_in?
	    @favorite = Favorite.new(party_id: @party_id, user_id: current_user.id)
	    @favorite.save
	      #保存に成功した場合、一覧画面に戻る
	    redirect_to favorites_path
	    else
	    redirect_to root_path
	    end
	end
		# @user_id = current_user.id
		# @party_id = Party.find(params[:id]).id
		# @favorite = Favorite.new(party_id: @party_id, user_id: @user_id)

		# if @favorite.save!
		# 	redirect_to favorites_path
		# end

	def destroy
	    favorite = Favorite.find(params[:id])
	    if favorite.destroy
		redirect_to favorites_path
	end
	end

	def index
		if user_signed_in?
		@user = current_user
		@favorite = Favorite.where(user_id: @user.id).all
	    else
	    redirect_to new_user_session_path
	    end
	end
end
