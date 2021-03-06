require 'rails_helper'

RSpec.feature 'Users can edit existing projects' do
  before do
    #given
    FactoryGirl.create(:project, name: 'Sublime Text 3')

    #when
    visit '/'
    click_link 'Sublime Text 3'
    click_link 'Edit Project'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Sublime Text 4 Beta'
    click_button 'Update Project'

    #expect
    expect(page).to have_content 'Project has been updated.'
    expect(page).to have_content 'Sublime Text 4 Beta'
  end

  scenario 'when providing invalid attributes' do
    fill_in 'Name', with: ''
  	click_button 'Update Project'

  	expect(page).to have_content 'Project has not been updated.'
  	expect(page).to have_content "Name can't be blank"
  end
end
