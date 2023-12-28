# frozen_string_literal: true

RSpec.describe Api::V1::Hunters::EasterEggs::RevealEasterEggService, type: :service do
  subject(:service) { described_class.new(params, hunter.id) }

  let(:easter_egg) { create(:easter_egg) }

  let(:hunter) { create(:hunter) }
  let(:code) { easter_egg.code }
  let(:params) { ActionController::Parameters.new({ code:, id: easter_egg.id }).permit! }

  describe '#call' do
    before do
      service.call
    end

    describe 'Success' do
      it 'reveals an EasterEgg' do
        expect(EasterEgg.last.revealed).to be(true)
        expect(EasterEgg.last.hunter_id).to eq(hunter.id)
      end
    end

    describe 'Failure' do
      let(:code) { 'wrong' }

      it 'does not reveal EasterEgg' do
        expect(EasterEgg.last.revealed).to be(false)
      end
    end
  end
end
