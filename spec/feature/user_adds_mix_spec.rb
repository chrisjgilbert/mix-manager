require 'rails_helper'
require_relative './feature_helpers'

feature "user visits homepage", type: :feature, js: true do
  scenario "adds a mix" do
    visit_root_path_and_add_new_mix
    expect(page).to have_css 'h2', text: 'title of mix'
    expect(page).to have_css 'p', text: 'description of mix'
    expect(page).to have_selector(:css, 'a[href="url of mix"]')
  end

end

feature "user visits homepage", type: :feature, js: true do
  scenario "adds then deletes a mix" do
    visit_root_path_and_add_new_mix
    click_button 'delete'
    expect(page).not_to have_css 'h2', text: 'title of mix'
    expect(page).not_to have_css 'p', text: 'description of mix'
    expect(page).not_to have_selector(:css, 'a[href="url of mix"]')
  end

end
