class VoteController < ApplicationController
	after_action :print_count, only: :verify
	def home
		@candidate=Candidate.all
		@cons=Constituency.all
		@state=State.all
		@party=Party.all
		Party.update_all('no_of_constituencies=0')
		State.update_all('party_id=8')
		@state.each{|s|
			@constituency=State.find(s.id).constituencies
			#Party.update_all('no_of_constituencies=0')
			@array=Array.new(Party.count+1){|i| i=0}
		@constituency.each{|constituency|
			@max_votes=Constituency.find(constituency.id).candidates.maximum('no_of_votes')
			@constituency_winnner_id=Candidate.find_by(no_of_votes:@max_votes).id
			constituency.update(:candidates_id => @constituency_winnner_id)
			@party_id=Candidate.find(@constituency_winnner_id).party_id
			#@no_of_cons_won=Party.find(@party_id).no_of_constituencies
			@no_of_cons_won=@array[@party_id]||0
			@no_of_cons_won+=1
			@array[@party_id]=@no_of_cons_won;
		}
		@winning_party_id=@array.rindex(@array.max)
		#@winning_party_id=Party.maximum('no_of_constituencies')
		if @array[@winning_party_id]!=0
			s.update(:party_id => @winning_party_id)
		 	@index=1
		 	@party.each{|p|
		 		p.no_of_constituencies||=0
		 		value=p.no_of_constituencies+@array[@index]
		 		p.update(:no_of_constituencies => value )
		 		@index=@index+1
		 	}
		 	@wparty_id=State.where('party_id!=8').maximum('party_id');
		 	p=Party.find(@wparty_id)
		 	@wparty_name=p.name
		 	@wparty_constituencies=p.no_of_constituencies
		 	@winning_candidates=[]
		 	@cons.each{|constituency|
		 		candidate=Candidate.find(constituency.candidates_id)
		 		if candidate.party.id==@winning_party_id
		 			@winning_candidates.push(candidate)
		 		end
		 		}
				@value = 10
		else
			State.second.update(:party_id => Party.second)
		end
		}
	end
	def print_count
		ShortLink.increment_counter(value,params[:short_ur])
		@value = @value + 1
		puts "rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
		puts @value
	end
	def addvote
		@states=State.all
		@constituencies=Constituency.all
		@candidates=Candidate.all	
	end
	def update
		@state_id=State.find_by(name:"#{params[:state][:name]}")
		@constituency_id=Constituency.find_by(name:"#{params[:constituency][:name]}",state_id:@state_id)
		candidate=Candidate.find_by(name:"#{params[:candidate][:name]}",constituency_id:@constituency_id)
		if candidate
			@votes=candidate.no_of_votes;
			@votes||=0
			@votes+=1
			unless candidate.update(:no_of_votes => "#{@votes}")
				flash[:errors]=[]
				flash[:errors].push("Invalid input")
				redirect_to add_vote_path
			else
				flash[:errors]=[]
				flash[:errors].push("Voted Successfully")
				redirect_to add_vote_path
			end
		else
			flash[:errors]=[]
				flash[:errors].push("Invalid input")
				redirect_to add_vote_path
		end
	end
	def results
	end
	def verify
	end
	def check
		@username=params[:verify][:username]
		@password=params[:verify][:password]
		if @username=="root"
			if(@password==="root")
					redirect_to admin_options_path;
			else
				flash[:errors]=[]
				flash[:errors].push("Incorrect password")
				redirect_to verify_path
			end
		else
			flash[:errors]=[]
			flash[:errors].push("Invalid username")
			redirect_to verify_path
		end
	end
	def set
		@states=State.all
		@constituencies=Constituency.all
	end
	def generate
		@state=params[:set][:state]
		@constituency=params[:set][:constituency]
		@min=params[:set][:min].to_i
		@r=Random.new
		@max=params[:set][:max].to_i
		@state_id=State.find_by(name:"#{@state}").id
		if  @state
			@constituencies=Constituency.where(state_id:@state_id)
			if  @constituency
				@constituencies=@constituencies.find_by(name:"#{@constituency}")
			end
		elsif @constituency
			@constituencies=Constituency.find_by(name:"#{@constituency}")
		else
			flash[:errors]=[]
			flash[:errors].push("Invalid information")
			redirect_to random_vote_path
		end
		@candidates=Candidate.where(constituency_id:@constituencies)
	end
	def finalize
		@candidates=params[:candidate][:value]
		@i=0
		@candidates.each{
			@candidate_id=@candidates["#{@i}"]
			@value=params[:array][:number]["#{@i}"]
			@candidate=Candidate.find(@candidate_id)
			@candidate.update(:no_of_votes => @value)
			@i=@i+1
		}
		flash[:errors]=[]
				flash[:errors].push("Vote counts are saved")
		redirect_to random_vote_path
	end
end

 