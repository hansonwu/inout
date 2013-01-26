class StatusChange < ActiveRecord::Base
  attr_accessible :in, :status
  belongs_to :user
  
  validates :in, presence: true
  validates :status, length: { maximum: 100 }
  validates :user_id, presence: true
end
