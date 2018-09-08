class PartiesController < ApplicationController
	def new
		@party = Party.new
	end

	def create
		party = Party.new(party_params)
		party.save
		redirect_to party_path(party.id)
	end

	def show
		@party = Party.find(params[:id])
	end

	def index
		@parties = Party.all
	end


	private

	def party_params
		params.require(:party).permit(:date, :place, :attend_number, :attend_price, :belongings, :contact, :message)
	end

end
