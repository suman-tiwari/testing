require 'rails_helper'

RSpec.describe Post, driver: :selenium_chrome, js: true do
	describe 'create' do
		it 'should create a post' do
			visit new_post_path
			fill_in 'Title', with: "My Post"
			fill_in 'Content', with: "My Content"

			click_button 'Create Post'
			expect(page).to have_content 'Post was successfully created.'
		end
	end
end