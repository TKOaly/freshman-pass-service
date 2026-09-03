require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  describe 'GET #dokaa' do
    it 'adds the dokaa penalty once for a fuksi user' do
      user = FactoryGirl.create(:user)
      sign_in user

      expect do
        get :dokaa
      end.to change { user.notes.reload.count }.by(1)

      note = user.notes.last
      expect(note.points).to eq(Note::DOKAA_POINTS)
      expect(note.description).to eq(I18n.t('notes.dokaa'))
      expect(note.points_hidden).to eq(false)
      expect(response).to redirect_to(user)

      expect do
        get :dokaa
      end.not_to change { user.notes.reload.count }
    end
  end
end
