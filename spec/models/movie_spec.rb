require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'presence' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:rent_price) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:category) }
  end
end
