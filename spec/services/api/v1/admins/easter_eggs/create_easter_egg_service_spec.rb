# frozen_string_literal: true

RSpec.describe Api::V1::Admins::EasterEggs::CreateEasterEggService, type: :service do
  subject(:service) { described_class.new(params) }

  let(:latitude) { attributes_for(:easter_egg)[:latitude] }
  let(:longitude) { attributes_for(:easter_egg)[:longitude] }
  let(:clue) { attributes_for(:easter_egg)[:clue] }
  let(:params) { ActionController::Parameters.new({ latitude:, longitude:, clue: }).permit! }

  describe '#call' do
    describe 'Success' do
      it 'creates a new EasterEgg with a unique code' do
        expect { service.call }.to change(EasterEgg, :count).by(1)

        created_easter_egg = EasterEgg.last
        expect(created_easter_egg.latitude).to eq(latitude)
        expect(created_easter_egg.longitude).to eq(longitude)
        expect(created_easter_egg.clue).to eq(clue)
        expect(created_easter_egg.revealed).to be(false)
        expect(created_easter_egg.code).to be_present
      end
    end

    describe 'Failure' do
      let(:latitude) { nil }

      it 'does not create a new EasterEgg' do
        expect { service.call }.not_to change(EasterEgg, :count)
      end
    end
  end
end
