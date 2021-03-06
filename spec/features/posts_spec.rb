require 'rails_helper'

RSpec.describe Post, driver: :selenium_chrome, js: true do
	describe 'create post' do
		it 'should create a post' do
			visit new_post_path
			fill_in 'Title', with: "My Post"
			fill_in 'Content', with: "My Content"

			click_button 'Create Post'
			expect(page).to have_content 'Post was successfully created.'
		end
	end

	describe 'list post' do
		it 'should list posts' do
			visit posts_path
			expect(page).to have_content 'My Post My Content'
		end
	end

	describe 'update post' do
		it 'should update existing post' do
			visit edit_post_path(Post.first)
			fill_in 'Title', with: "Edited Title"
			fill_in 'Content', with: "Edited content"

			click_button "Update Post"
			expect(page).to have_content "Post was successfully updated."
		end
	end


	describe 'destroy post' do
		it 'should destroy a post' do
			visit posts_path
			accept_alert do
				click_on("Destroy", match: :first)
			end

			expect(page).to have_content "Post was successfully destroyed."
		end
	end

	describe 'post not destroyed' do
		it 'should not destroy a post' do
			visit posts_path
			dismiss_confirm do
				click_on("Destroy", match: :first)
			end

			expect(page).to have_content "Title Content"
		end
	end
end