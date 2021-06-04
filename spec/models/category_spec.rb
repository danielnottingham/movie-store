require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'presence' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:movies) }
  end
end
