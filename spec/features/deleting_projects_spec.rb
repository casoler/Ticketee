require 'rails_helper'

RSpec.feature 'Users can delete projects' do
	# before do
	# 	visit '/'

 #    click_link 'New Project'
 #  end

  scenario 'successfully' do
    FactoryGirl.create(:project, name: 'Sublime Text 3')

    visit '/'
    click_link 'Sublime Text 3'
    click_link 'Delete Project'

    expect(page).to have_content 'Project has been deleted.'
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content 'Sublime Text 3'
  end

  # scenario 'when providing invalid attributes' do
  # 	click_button 'Create Project'

  # 	expect(page).to have_content 'Project has not been created.'
  # 	expect(page).to have_content "Name can't be blank"
  # end
end
