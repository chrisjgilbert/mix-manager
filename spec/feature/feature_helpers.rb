def visit_root_path_and_add_new_mix
  visit root_path
  fill_in 'title', with: 'title of mix'
  fill_in 'description', with: 'description of mix'
  fill_in 'url', with: 'url of mix'
  click_button 'submit'
end
