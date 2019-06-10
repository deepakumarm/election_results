class PartyController < ApplicationController
	def index
		@party=Party.all
	end
	def new
	end
	def create
		party=Party.new(params_player)

		if party.save
			redirect_to :root
		else
			flash[:errors]=party.errors.full_messages
			redirect_to :back
		end
	end
	def show
		party=Party.find(params[:id]);
		@partyname=party.name
	end
	def edit
		@party=Party.find(params[:id]);
	end
	def update
		party=Party.find(params[:id]);
		if party.update(params_player)
			redirect_to :root
		else
			flash[:errors]=party.errors.full_messages
			redirect_to :back
		end
	end
	def delete
		party=Party.find(params[:id]);
		party.destroy
		redirect_to :root
	end
	private
	def params_player
		params.require(:party).permit(:name)
	end
end

