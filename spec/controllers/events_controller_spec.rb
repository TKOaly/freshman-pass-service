require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'POST #create' do
    it 're-renders the new event form when event validation fails' do
      user = FactoryGirl.create(:user)
      user.add_role 'admin'
      sign_in user

      FactoryGirl.create(:event, name: 'Testing in prod')
      allow_any_instance_of(EventsController)
        .to receive(:fetch_tekis_events)
        .and_return([{ 'id' => 3045, 'name' => 'Calendar event' }])

      post :create, params: {
        event: {
          name: 'Testing in prod',
          'date(3i)' => '8',
          'date(2i)' => '10',
          'date(1i)' => '2026',
          event_link: '',
          event_points: '-1',
          fresher_can_participate: '1',
          tutor_can_participate: '1',
          participation_type: 'task'
        }
      }

      expect(response).to render_template(:new)
      expect(response).to have_http_status(:ok)
    end
  end
end
