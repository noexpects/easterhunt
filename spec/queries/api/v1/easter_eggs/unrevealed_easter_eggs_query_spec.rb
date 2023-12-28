# frozen_string_literal: true

RSpec.describe Api::V1::EasterEggs::UnrevealedEasterEggsQuery, type: :query do
  describe '#call' do
    subject(:result) { described_class.call }

    let!(:first_easter_egg) { create(:easter_egg, revealed: true) }
    let!(:second_easter_egg) { create(:easter_egg, revealed: false) }

    it { expect(result).is_a?(ActiveRecord::Relation) }

    it 'returns unrevialed easter eggs' do
      expect(result).not_to include(first_easter_egg)
      expect(result).to include(second_easter_egg)
    end
  end
end
