require 'spec_helper'

describe "Authentication" do

  subject { page }
  
  describe "when not logged in" do
  
    describe "visit home page" do
      before { visit root_path }
  
      it { should have_selector('h1', text: 'Welcome to the In and Out Board!') }
      it { should have_link('here', href: new_user_registration_path) }
      it { should have_link('here', href: new_user_session_path) }
    end
    
    describe "visit board page" do
      before { put board_path }
      specify { response.should redirect_to(new_user_session_path) }
    end
    
    describe "visit activity log page" do
      before { put log_path }
      specify { response.should redirect_to(new_user_session_path) }
    end
  end
  
  describe "after logging in" do
    before { 
      @user = FactoryGirl.create(:user) 
      visit new_user_session_path  
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password  
      click_button "Sign in"  
    }
      
    describe "should redirect to board page" do
      it { should have_selector('h3', text: 'Board') }
    end
    
    describe "visit activity log" do
      before { visit log_path }
      it { should have_selector('h3', text: 'Activity Log') }
    end
    
    describe "visit board" do
      before { visit board_path }
      it { should have_selector('h3', text: 'Board') }
      
      describe "change status" do
        before { 
          fill_in "status_change_status", :with => 'Meeting'
          click_button "Out!"
        }
        it "should update the status" do
          @user.current_status.in.should be(false)
          @user.current_status.status.should == 'Meeting'
        end
      end
    end
  end

end