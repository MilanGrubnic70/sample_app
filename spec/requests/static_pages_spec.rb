require 'spec_helper'

describe "Static pages" do

	let(:base_title) {"Ruby on Rails Tutorial Sample App"}
	
	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', 	text: heading) }
		it { should have_selector('title', 	text: full_title(title)) }
	end

	describe "Home page" do

		before { visit root_path }		
		let(:heading) {'Sample App'}
		let(:title)   {''}

		it_should_behave_like "all static pages"
		it { should_not have_selector('title', text: '| Home')}

		describe "for signed-in users" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
				FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
				sign_in user
				visit root_url
			end

			it "should render the user's feed" do
				user.feed.each do |item|
					page.should have_selector("li##{item.id}", text: item.content)
				end 
			end

			describe "follower/following counts" do
				let(:other_user) {FactoryGirl.create(:user) }
				before do
					other_user.follow!(user)
					visit root_path
				end

				it { should have_link("0 following", href: following_user_path(user)) }
				it { should have_link("1 followers", href: followers_user_path(user)) }
			end
		end

		it { should have_selector('h1', 		text: 'Sample App') }
		it { should have_selector('title',	 	text: "#{base_title}")}	
		it { should have_selector('title', 		text: full_title(''))} #refactored
		it { should_not have_selector('title', 	text: '| Home')}
		it { should have_content('Sample App')}
		it { should have_selector('title', 		text: "#{base_title}")}
		it { should_not have_selector('title', 	text: '| Home')}

	end

	
	describe "Help page" do

		before { visit help_path }
		let(:heading) {'Help'}
		let(:title) {'Ruby on Rails Tutorial Sample App | Help'}

		it { should have_selector('h1', text: heading) }
		it { should have_selector('title', text: title) }

		it { should have_content('Help')}


		it { page.should have_selector('h1', 	text: 'Help') }
		it { page.should have_selector('title', text: "#{base_title} | Help") } 
		it { page.should have_selector('title', text: full_title("Help")) } #refactored

	end

	describe "About page" do

		before { visit about_path }
		let(:heading) {'About'}
		let(:title) {'Ruby on Rails Tutorial Sample App | About'}

		it { should have_selector('h1', text: heading)}
		it { should have_selector('title', text: title)}

		it { should have_content('About Us') }
		it { should have_selector('h1', text: 'About') }
		it { should have_selector('title', text: "#{base_title} | About") }
		it { should have_selector('title', text: full_title("About")) } #refactored

	end

	describe "Contact page" do

		before { visit contact_path}
		let(:heading) {'Contact'}
		let(:title) {'Ruby on Rails Tutorial Sample App | Contact'}

		it { should have_selector("h1", text: heading)}
		it { should have_selector("title", text: title)}


		it { should have_content('Contact Us') }
		it { should have_selector('h1', text: 'Contact') }
		it { should have_selector('title', text: "#{base_title} | Contact Us") }
		it { should have_selector('title', text: full_title("Contact Us")) } #refactored

		it "should have the right links on the layout" do
			visit root_path

			click_link "Sign in"
			page.should have_selector('title', text: full_title('Sign in'))

			click_link "About"
			page.should have_selector('title', text: full_title('About Us'))

			click_link "Help"
			page.should have_selector('title', text: full_title('Help'))

			click_link "Contact"
			page.should have_selector('title', text: full_title('Contact'))

			click_link "Home"
			click_link "Sign up now!"
			page.should have_selector('title', text: full_title('Sign up'))

			click_link "sample app"
			page.should have_selector('title', text: full_title(''))
		end

	end

end
