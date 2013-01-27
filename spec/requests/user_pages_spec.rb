require 'spec_helper'

describe "User pages" do

  subject { page }
  
  describe "user registration" do
    before { @user = FactoryGirl.build(:user) }
    it "allows new user to register" do  
      visit new_user_registration_path
  
      fill_in "Name", :with => @user.name
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password
      fill_in "Password confirmation", :with => @user.password_confirmation
  
      expect { click_button "Sign up" }.to change(User, :count).by(1)
    end
  end

  describe "user log in" do
    before { 
      @user = FactoryGirl.create(:user) 
      visit new_user_session_path  
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password  
      click_button "Sign in"
    }
    
    it "allows registered user to sign in" do    
      should have_content("Signed in successfully.")
    end
    
    describe "log out after logging in" do
      before { click_link "Logout" }
      it { should have_content("Signed out successfully.") }
    end
  end
end