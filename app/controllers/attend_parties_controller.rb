class AttendPartiesController < ApplicationController

	def create
	 	# @user_id = current_user.id
	 	@party_id = Party.find(params[:id]).id
	 	@attend_party = Attend_party.new(party_id: @party_id, user_id: @user_id)


	 	if @attend_party.save
	 		redirect_to attend_parties_path
	 	end
	end

	# 	user = current_user
	# 	party = Party.find(params[:party_id])
	# 	if Attend_party.create(user_id: user.id, party_id: party.id)
	# 		redirect_to attend_parties_path
	# 	else
	# 		redirect_to root_path
	# 	end
	# end



	# def destroy
	#   user = current_user
	# 	party = Party.find(params[:party_id])
	# 	if attend_party = Attend_party.find_by(user_id: user.id, party_id: party.id)
	# 		favorite.delete
	# 		redirect_to attend_parties_path
	# 	else
	# 		redirect_to root_path
	# 	end
	# end

	def destroy
		@attend_party = Attend_party.find(params[:id])
		if @attend_party.destroy
			redirect_to user_path(curent_user)
		end
	end
end
