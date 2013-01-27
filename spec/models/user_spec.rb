require 'spec_helper'

describe User do
  
  before do
    @user = FactoryGirl.create(:user)
  end
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  
  it { should respond_to(:current_status) }
  it { should respond_to(:status_changes) }
  
  it { should be_valid }
  
  describe "status changes" do
    before { @user.save }
    let!(:older) do
      FactoryGirl.create(:status_change, user: @user, created_at: 2.day.ago)
    end
    let!(:newer) do
      FactoryGirl.create(:status_change, user: @user, created_at: 1.hour.ago)
    end
    
    it "should have status changes in correct order" do
      @user.status_changes.should == [newer, older]
    end    
    
    it "should return newest status as current status" do
      @user.current_status.should == newer
    end
  end

end
