require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'system-created notes' do
    it 'keeps the existing system penalty valid' do
      user = FactoryGirl.create(:user)
      note = Note.new(points: -3, description: 'System penalty', to: user, points_hidden: false)

      expect(note).to be_valid
    end

    it 'allows the dokaa penalty' do
      user = FactoryGirl.create(:user)
      note = Note.new(points: Note::DOKAA_POINTS, description: I18n.t('notes.dokaa'), to: user, points_hidden: false)

      expect(note).to be_valid
    end
  end
end
