class StateController < ApplicationController
	def index
		@state=State.all
		#@state.sort!{ |a,b| a.name.downcase <=> b.name.downcase }
	end
	def new
	end
	def create
		state=State.new(params_player)

		if state.save
			redirect_to state_home_path
		else
			flash[:errors]=state.errors.full_messages
			redirect_to :back
		end
	end
	def show
		@state=State.find(params[:id]);
		@statename=@state.name
	end
	def edit
		@state=State.find(params[:id]);
	end
	def update
		state=State.find(params[:id]);
		if state.update(params_player)
			redirect_to state_home_path
		else
			flash[:errors]=state.errors.full_messages
			redirect_to :back
		end
	end
	def delete
		state=State.find(params[:id]);
		state.destroy
		redirect_to state_home_path
	end
	private
	def params_player
		params.require(:state).permit(:name)
	end
end
