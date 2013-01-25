class StatusChange < ActiveRecord::Base
  attr_accessible :in, :status, :user_id
end
