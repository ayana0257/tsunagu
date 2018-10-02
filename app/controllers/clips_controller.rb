class ClipsController < ApplicationController

	def create
		@user_id = current_user.user_id
		@party_id = Party.find(params[:id]).id
		if user_signed_in?
		@clip = Clip.new(party_id: @party_id, user_id: current_user.id)
		@clip.save!
			redirect_to clips_path
		else
			redirect_to root_path
		end
	end

	def destroy
		@clip = Clip.find(params[:id])
		if @clip.destroy
		   redirect_to clips_path
		end
	end

	def index
    	@user = current_user
    	@clips = @user.clips
    	# @clips = Clip.where(user_id: @user.id).all
    	# @clips = Clip.page(params[:page]).per(3).order('created_at DESC')
	end

	# def index
	# 	if user_signed_in?
	# 	# @user = current_user
	# 	@clips = Clip.where(user_id: @user.id).all
	#     else
	#     redirect_to new_user_session_path
	#     end
	# end
end
