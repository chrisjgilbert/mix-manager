require 'rails_helper'

feature "user visits homepage and adds mix" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_css 'h1', text: 'Mix Manager'
    fill_in 'Add Mix', with: 'Test Mix'
    click_button 'Submit'
    expect(page).to have_content 'Test Mix'
  end
end
