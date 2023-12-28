# frozen_string_literal: true

RSpec.describe Api::V1::AdminSerializer, type: :serializer do
  subject(:serialized_hash) { described_class.new(admin).as_json }

  let(:admin) { create(:admin) }

  it 'serializes the correct attributes' do
    attributes = serialized_hash['data']['attributes']
    expect(attributes['id']).to eq(admin.id)
    expect(attributes['email']).to eq(admin.email)
    expect(attributes['created_at']).to eq(admin.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'))
  end
end
