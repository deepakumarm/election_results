class ConstituencyController < ApplicationController
	def index
		@constituency=Constituency.all
	end
	def new
	end
	def creates
	end
	def display
		@name=params[:array][:name]
		@state=params[:array][:state]
		@candidate=params[:array][:candidate]
		c=Constituency.new
		c.name=@name
		c.state_id=@state.to_i
		c.candidates_id=@candidate.to_i
		if c.save
			@string="done"
		else
			@string=c.errors.full_messages
		end
	end
	def create
		constituency=Constituency.new(params_player)

		if constituency.save
			redirect_to constituency_home_path
		else
			flash[:errors]=constituency.errors.full_messages
			redirect_back fallback_location: admin_options_path
		end
	end
	def show
		constituency=Constituency.find(params[:id]);
		@constituencyname=constituency.name
	end
	def edit
		@constituency=Constituency.find(params[:id]);
	end
	def update
		constituency=Constituency.find(params[:id]);
		if constituency.update(params_player)
			redirect_to constituency_home_path
		else
			flash[:errors]=constituency.errors.full_messages
			redirect_to :back
		end
	end
	def delete
		constituency=Constituency.find(params[:id]);
		constituency.destroy
		redirect_to constituency_home_path
	end
	private
	def params_player
		params.require(:constituency).permit(:name)
	end
end

