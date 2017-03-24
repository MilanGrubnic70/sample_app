require 'spec_helper'

describe "AuthenticationPages" do 

	subject { page }

		describe "signin page" do
			before { visit signin_path }

			# it { should have_selector('h1', text: 'Sign in') }
			it { should have_correct_heading('Sign in') }  #refactor above
			# it { should have_selector('title', 	text: 'Sign in') }
			it { should have_correct_title('Sign in') } #refactor above
			
		end 

		describe "signin" do
			before { visit signin_path }

			describe "with invalid information" do
				before { click_button "Sign in"}

				# it { should have_selector('title', text: 'Sign in') }
				it { should have_correct_title('Sign in') } #refactor above

				# it { should have_selector('div.alert.alert-error', text: 'Invalid') }
				it { should have_error_message('Invalid') } #refactor above

				describe "after visiting another page" do
					before { click_link "Home" }
					# it { should_not have_selector('div.alert.alert-error') }
					it { should_not have_error_message('Invalid') } #refactor above
				end
			end

			describe "with valid information" do
				let(:user) { FactoryGirl.create(:user) }
				# before do
				# 	fill_in "Email", 	with: user.email.upcase
				# 	fill_in "Password",	with: user.password
				# 	click_button "Sign in"
				# end
				before { valid_signin(user) } #refactor of above

				# it { should have_selector('title', 		text: user.name) }
				it { should have_correct_title(user.name) } #refactor of above
				# it { should have_link('Profile', 			href: user_path(user)) }
				it {should have_profile_link(user_path(user)) } #refactor of above
				# it { should have_link('Sign out', 		href: signout_path) }
				it { should have_signout_link(signout_path) } #refactor of above
				it { should have_link('Settings', 			href: edit_user_path(user) )}
				# it { should_not have_link('Sign in', 		href: signin_path) }
				it { should_not have_signin_link(signin_path) } #refactor of above

				describe "followed by signout" do
					before { click_link "Sign out" }
					it { should have_link("Sign in") }
				end

			end
		end
end

