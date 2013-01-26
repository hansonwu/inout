class StatusChange < ActiveRecord::Base
  attr_accessible :in, :status
  belongs_to :user
  
  validates :status, length: { maximum: 60 }
  validates :user_id, presence: true
end
