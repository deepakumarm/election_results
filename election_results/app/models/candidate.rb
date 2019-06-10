class Candidate < ApplicationRecord
  belongs_to :constituency
  belongs_to :party
end
