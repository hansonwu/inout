class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  
  validates :name, presence: true, length: { maximum: 50 }
  
  has_many :status_changes, dependent: :destroy
  has_one :current_status, :class_name => "StatusChange", :order => 'created_at DESC'
  
  def status
    # Unless user is in or there is no status record, return an 'out' message 
    unless self.current_status.nil? || self.current_status.in
      current_status.status
    end
  end
end
