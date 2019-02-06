require 'rails_helper'
require_relative './feature_helpers'

feature "user visits homepage" do
  scenario "adds mix then edits mix" do
    visit_root_path_and_add_new_mix
    expect(page).to have_css 'h2', text: 'title of mix'
    expect(page).to have_css 'p', text: 'description of mix'
    expect(page).to have_selector(:css, 'a[href="url of mix"]')
    click_button 'edit'
    fill_in 'title', with: 'updated title'
    fill_in 'description', with: 'updated description'
    fill_in 'url', with: 'updated mix url'
    click_button 'submit'
    expect(page).not_to have_css 'h2', text: 'title of mix'
    expect(page).not_to have_css 'p', text: 'description of mix'
    expect(page).not_to have_selector(:css, 'a[href="url of mix"]')
    expect(page).to have_css 'h2', text: 'updated title'
    expect(page).to have_css 'p', text: 'updated description'
    expect(page).to have_selector(:css, 'a[href="updated mix url"]')
  end
end
