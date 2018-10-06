class PartiesController < ApplicationController
	def new
		@party = Party.new
	end

	def create
		party = Party.new(party_params)
		party.save!
		redirect_to party_path(party.id)
	end

	def show
		@party = Party.find(params[:id])
		@clips = Clip.where(party_id: @party.id).all
	end

	def index
		@parties = Party.all
		# @clips = Clip.where(party_id: @party.id).all
		@parties = Party.search(params[:search])
		@parties = Party.page(params[:page]).per(3).order('created_at DESC')
	end


	private

	def party_params
		params.require(:party).permit(:party_name, :date, :place, :attend_number, :attend_price, :belongings, :contact, :message)
	end

end
