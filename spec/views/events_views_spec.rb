require 'rails_helper'

RSpec.describe 'Events view', type: :feature do
  describe 'creating an event' do
    before :each do
      user = FactoryBot.create(:user)
      user.add_role 'admin'

      visit login_path
      fill_in 'user_login', with: user.username
      fill_in 'user_password', with: "password123"
      click_button 'Log in'

      expect(page).to have_content('Signed in successfully')

      visit new_event_path
      fill_in 'event_name', with: 'test event'
      fill_in 'event_event_points', with: 10

      click_button 'Save', match: :first
    end

    it 'is created and displays info correctly' do
      event = Event.first

      expect(page).to have_content(event.name)
      expect(page).to have_content("Points for participation: #{event.participations.first.points}")
    end

    it 'adds points to event' do
      event = Event.first
      expect(event).to be_valid
      expect(event.participations.first.points).to eq(10)
    end

    it 'shows as unattended when created' do
      user = User.last
      user.add_role 'fuksi'
      user.remove_role 'admin'
      event = Event.first
      visit events_path
      expect(find('#unattended')).to have_content('test event')
    end
  end

  describe 'creating a task' do
    before :each do
      user = FactoryBot.create(:user)
      user.add_role 'admin'

      visit login_path
      fill_in 'user_login', with: user.username
      fill_in 'user_password', with: "password123"
      click_button 'Log in'

      expect(page).to have_content('Signed in successfully')

      visit new_participation_path
      fill_in 'participation_description', with: 'test event'
      fill_in 'participation_points', with: 10

      click_button 'Save', match: :first
    end

    it 'is created and displays info correctly' do
      event = Participation.first

      expect(page).to have_content(event.name)
      expect(page).to have_content("Points for participation: #{event.points}")
    end

    it 'is listed on main page' do
      visit events_path
      expect(page).to have_content("test event")
    end
  end
end

