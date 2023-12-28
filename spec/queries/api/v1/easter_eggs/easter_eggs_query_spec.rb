# frozen_string_literal: true

RSpec.describe Api::V1::EasterEggs::EasterEggsQuery, type: :query do
  describe '#call' do
    subject(:result) { described_class.call(params) }

    let(:first_easter_egg) { create(:easter_egg, revealed: true) }
    let(:second_easter_egg) { create(:easter_egg, revealed: false) }
    let(:hunter) { create(:hunter) }
    let(:params) { {} }

    it { expect(result).is_a?(ActiveRecord::Relation) }

    context 'when no params are provided' do
      it 'returns all easter eggs' do
        expect(result).to include(first_easter_egg, second_easter_egg)
      end
    end

    context 'when revealed param is provided' do
      let(:params) { { revealed: true } }

      it 'returns easter eggs with the specified revealed status' do
        expect(result).to include(first_easter_egg)
        expect(result).not_to include(second_easter_egg)
      end
    end

    context 'when hunter_email param is provided' do
      let(:params) { { hunter_email: hunter.email } }

      before do
        first_easter_egg.hunter = hunter
        first_easter_egg.save
      end

      it 'returns easter eggs hunted by the specified hunter' do
        expect(result).to include(first_easter_egg)
        expect(result).not_to include(second_easter_egg)
      end
    end
  end
end
