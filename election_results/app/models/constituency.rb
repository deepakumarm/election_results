class Constituency < ApplicationRecord
  belongs_to :state
  has_many :candidates
end
