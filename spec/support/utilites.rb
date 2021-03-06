include ApplicationHelper

def valid_signin(user)
	fill_in "Email", 	with: user.email
	fill_in "Password",	with: user.password
	click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: message)
	end
end

RSpec::Matchers.define :have_alert_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-success', text: message)
	end
end

RSpec::Matchers.define :have_correct_heading do |heading|
	match do |page|
		page.should have_selector('h1', text: heading)
	end
end

RSpec::Matchers.define :have_correct_title do |title|
	match do |page|
		page.should have_selector('title', text: title)
	end
end

RSpec::Matchers.define :have_profile_link do |link|
	match do |page|
		page.should have_link('Profile', href:link)
	end
end

RSpec::Matchers.define :have_signout_link do |link|
	match do |page|
		page.should have_link('Sign out', href:link)
	end
end

RSpec::Matchers.define :have_signin_link do |link|
	match do |page|
		page.should_not have_link('Sign in', href:link)
	end
end

def sign_in(user)
	visit signin_path
	fill_in "Email", 	with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"	
	# Sign in when not using Capybara.
	cookies[:remember_token] = user.remember_token
end





# def full_title(page_title)
# 	base_title = "Ruby on Rails Tutorial Sample App"
# 	if page_title.empty?
# 		base_title
# 	else
# 		"#{base_title} | #{page_title}"
# 	end
# end
