require 'spec_helper'

describe StatusChange do
    
  before do
    @user = FactoryGirl.create(:user)
    @status_change = @user.status_changes.build(:in => false, :status => 'Lunch')
  end
  
  subject { @status_change }
  
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:in) }
  it { should respond_to(:status) }
  
  it { should be_valid }
  
  its(:user) { should == @user }
  
  describe "when user_id is nil" do
    before { @status_change.user_id = nil }
    it { should_not be_valid }
  end

  describe "when status is too long" do
    before { @status_change.status = "abc" * 100 }
    it { should_not be_valid }
  end

end
