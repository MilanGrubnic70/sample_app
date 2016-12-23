require 'spec_helper'

describe "Static pages" do

	let(:base_title) {"Ruby on Rails Tutorial Sample App"}
	
	subject { page }

	describe "Home page" do

		before { visit root_path }

		it { should have_selector('h1', text: 'Sample App') }
		it { should have_selector('title', text: "#{base_title}")}
		it { should have_selector('title', text: full_title(''))} #refactored
		it { should_not have_selector('title', text: '| Home')}

		# it "should have the content 'Sample App'" do
		# 	page.should have_content('Sample App')
		# end
		it { should have_content('Sample App')}


		# it "should have the base title" do
		# 	page.should have_selector('title', text: "#{base_title}")
		# end
		it { should have_selector('title', text: "#{base_title}")}


		# it "should not have a custom page title" do
		# 	visit root_path
		# 	page.should_not have_selector('title', text: '| Home')
		# end
		it { should_not have_selector('title', text: '| Home')}

	end
	
	describe "Help page" do

		before { visit help_path }

		# it "should have the content 'Help'" do
		# 	page.should have_content('Help')
		# end
		it { should have_content('Help')}

		# it "should have the h1 'Help'" do
		# 	page.should have_selector('h1', text: 'Help')
		# end
		it { page.should have_selector('h1', text: 'Help') }

		# it "should have the title 'Help'" do
		# 	page.should have_selector('title', text: "#{base_title} | Help")
		# end
		it { page.should have_selector('title', text: "#{base_title} | Help") } 
		it { page.should have_selector('title', text: full_title("Help")) } #refactored

	end

	describe "About page" do

		before { visit about_path }

		# it "should have the content 'About Us'" do
		# 	page.should have_content('About Us')
		# end
		it { should have_content('About Us') }

		# it "should have the h1 'About Us'" do
		# 	page.should have_selector('h1', text: 'About')
		# end
		it { should have_selector('h1', text: 'About') }

		# it "should have the title 'About'" do
		# 	page.should have_selector('title', text: "#{base_title} | About")
		# end
		it { should have_selector('title', text: "#{base_title} | About") }
		it { should have_selector('title', text: full_title("About")) } #refactored

	end

	describe "Contact page" do

		before { visit contact_path}

		# it "should have the content 'Contact Us'" do
		# 	visit contact_path
		# 	page.should have_content('Contact Us')
		# end
		it { should have_content('Contact Us') }

		# it "should have the h1 'Contact Us'" do
		# 	visit contact_path
		# 	page.should have_selector('h1', text: 'Contact')
		# end
		it { should have_selector('h1', text: 'Contact') }

		# it "should have the title 'Contact'" do
		# 		visit contact_path
		# 		page.should have_selector('title', 
		# 			text: "#{base_title} | Contact Us")
		# end
		it { should have_selector('title', text: "#{base_title} | Contact Us") }
		it { should have_selector('title', text: full_title("Contact Us")) } #refactored

	end

end
