class CandidateController < ApplicationController
	def index
		@candidate=Candidate.all
	end
	def new
	end
	def create
		candidate=Candidate.new(params_player)

		if candidate.save
			redirect_to candidate_home_path
		else
			flash[:errors]=candidate.errors.full_messages
			redirect_to :back
		end
	end
	def show
		candidate=Candidate.find(params[:id]);
		@candidatename=candidate.name
	end
	def edit
		@candidate=Candidate.find(params[:id]);
	end
	def update
		candidate=Candidate.find(params[:id]);
		if candidate.update(params_player)
			redirect_to candidate_home_path
		else
			flash[:errors]=candidate.errors.full_messages
			redirect_to :back
		end
	end
	def delete
		candidate=Candidate.find(params[:id]);
		candidate.destroy
		redirect_to candidate_home_path
	end
	private
	def params_player
		params.require(:candidate).permit(:name)
	end
end

