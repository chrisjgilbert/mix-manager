require 'rails_helper'

feature "user visits homepage and adds mix", type: :feature, js: true do
  scenario "successfully" do
    visit root_path
    expect(page).to have_css 'h1', text: 'Mix Manager'
    fill_in 'title', with: 'title of mix'
    fill_in 'description', with: 'description of mix'
    fill_in 'url', with: 'url of mix'
    click_button 'submit'
    expect(page).to have_css 'h2', text: 'title of mix'
    expect(page).to have_css 'p', text: 'description of mix'
  end
end
