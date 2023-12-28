# frozen_string_literal: true

RSpec.describe Api::V1::Admins::EasterEggs::UpdateEasterEggService, type: :service do
  subject(:service) { described_class.new(params) }

  let!(:easter_egg) { create(:easter_egg) }

  let(:clue) { 'New Clue' }
  let(:params) { ActionController::Parameters.new({ clue:, id: easter_egg.id }).permit! }

  describe '#call' do
    describe 'Success' do
      it 'updates an existing EasterEgg' do
        expect { service.call }.not_to change(EasterEgg, :count)
        expect(service.easter_egg.clue).to eq(clue)
      end
    end

    describe 'Failure' do
      let(:clue) { FFaker::Lorem.characters(300) }

      it 'does not update an EasterEgg' do
        expect { service.call }.not_to change(EasterEgg, :count)
        expect(service.easter_egg.clue).not_to eq(clue)
      end
    end
  end
end
