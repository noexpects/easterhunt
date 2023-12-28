# frozen_string_literal: true

RSpec.describe Api::V1::Admins::EasterEggs::UpdateEasterEggContract do
  subject(:result) { described_class.new.call(params) }

  let!(:easter_egg) { create(:easter_egg) }
  let(:id) { easter_egg.id }
  let(:latitude) { attributes_for(:easter_egg)[:latitude] }
  let(:longitude) { attributes_for(:easter_egg)[:longitude] }
  let(:clue) { attributes_for(:easter_egg)[:clue] }

  let(:params) { { latitude:, longitude:, clue:, id: } }

  describe 'Success' do
    context 'with all params' do
      it 'contract is successful' do
        expect(result).to be_success
      end
    end

    context 'with only some of params' do
      context 'without clue' do
        let(:clue) { nil }

        it 'contract is successful' do
          expect(result).to be_success
        end
      end

      context 'without latitude' do
        let(:latitude) { nil }

        it 'contract is successful' do
          expect(result).to be_success
        end
      end

      context 'without longitude' do
        let(:longitude) { nil }

        it 'contract is successful' do
          expect(result).to be_success
        end
      end
    end
  end

  describe 'Failure' do
    context 'with wrong id' do
      context 'when id is wrong' do
        let(:id) { 0 }
        let(:message) { I18n.t('dry_validation.errors.rules.id.not_exists') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(id: [message])
        end
      end

      context 'when id has wrong type' do
        let(:id) { 'a' }
        let(:message) { I18n.t('dry_schema.errors.int?') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(id: [message])
        end
      end

      context 'when id is empty' do
        let(:id) { nil }
        let(:message) { I18n.t('dry_schema.errors.filled?') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(id: [message])
        end
      end
    end

    context 'with wrong latitude' do
      context 'when latitude is too low' do
        let(:latitude) { rand(-100.0...-95.0) }
        let(:message) { I18n.t('dry_schema.errors.gteq?', num: Constants::EasterEgg::LATITUDE_MIN) }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(latitude: [message])
        end
      end

      context 'when latitude is too high' do
        let(:latitude) { rand(95.0...100.0) }
        let(:message) { I18n.t('dry_schema.errors.lteq?', num: Constants::EasterEgg::LATITUDE_MAX) }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(latitude: [message])
        end
      end

      context 'when latitude has wrong format' do
        let(:latitude) { FFaker::Geolocation.lat.round + 0.9999999 }
        let(:message) { I18n.t('dry_validation.errors.rules.latitude.wrong_format') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(latitude: [message])
        end
      end

      context 'when latitude has wrong type' do
        let(:latitude) { FFaker::Lorem.word }
        let(:message) { I18n.t('dry_schema.errors.float?') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(latitude: [message])
        end
      end
    end

    context 'with wrong longitude' do
      context 'when longitude is too low' do
        let(:longitude) { rand(-200.0...-185.0) }
        let(:message) { I18n.t('dry_schema.errors.gteq?', num: Constants::EasterEgg::LONGITUDE_MIN) }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(longitude: [message])
        end
      end

      context 'when longitude is too high' do
        let(:longitude) { rand(185.0...200.0) }
        let(:message) { I18n.t('dry_schema.errors.lteq?', num: Constants::EasterEgg::LONGITUDE_MAX) }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(longitude: [message])
        end
      end

      context 'when longitude has wrong format' do
        let(:longitude) { FFaker::Geolocation.lng.round + 0.9999999 }
        let(:message) { I18n.t('dry_validation.errors.rules.longitude.wrong_format') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(longitude: [message])
        end
      end

      context 'when longitude has wrong type' do
        let(:longitude) { FFaker::Lorem.word }
        let(:message) { I18n.t('dry_schema.errors.float?') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(longitude: [message])
        end
      end
    end

    context 'with wrong clue' do
      context 'when clue is too long' do
        let(:clue) { 'a' * (Constants::EasterEgg::CLUE_MAX_LENGTH + 1) }
        let(:message) { I18n.t('dry_schema.errors.max_size?', num: Constants::EasterEgg::CLUE_MAX_LENGTH) }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(clue: [message])
        end
      end

      context 'when clue has wrong type' do
        let(:clue) { 1 }
        let(:message) { I18n.t('dry_schema.errors.str?') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(clue: [message])
        end
      end
    end
  end
end
