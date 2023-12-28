# frozen_string_literal: true

RSpec.describe Api::V1::AdminEasterEggSerializer, type: :serializer do
  subject(:serialized_hash) { described_class.new(easter_egg).as_json }

  let(:hunter) { create(:hunter) }
  let(:easter_egg) { create(:easter_egg, revealed: true, hunter:) }

  it 'serializes the correct attributes' do
    attributes = serialized_hash['data']['attributes']
    expect(attributes['id']).to eq(easter_egg.id)
    expect(attributes['latitude']).to eq(easter_egg.latitude)
    expect(attributes['longitude']).to eq(easter_egg.longitude)
    expect(attributes['code']).to eq(easter_egg.code)
    expect(attributes['clue']).to eq(easter_egg.clue)
    expect(attributes['revealed']).to eq(easter_egg.revealed)
  end

  context 'when revealed is true' do
    it 'serializes the hunter association' do
      expect(serialized_hash['data']['relationships']).to be_present
      expect(serialized_hash['data']['relationships']['hunter']['data']['id']).to eq(hunter.id.to_s)
    end
  end

  context 'when revealed is false' do
    before { easter_egg.update(revealed: false, hunter_id: nil) }

    it 'does not serialize the hunter association' do
      expect(serialized_hash['data']['relationships']).to be_empty
    end
  end
end
