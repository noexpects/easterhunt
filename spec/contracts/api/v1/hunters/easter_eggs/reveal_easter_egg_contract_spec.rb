# frozen_string_literal: true

RSpec.describe Api::V1::Hunters::EasterEggs::RevealEasterEggContract do
  subject(:result) { described_class.new.call(params) }

  let!(:easter_egg) { create(:easter_egg) }
  let(:id) { easter_egg.id }
  let(:code) { easter_egg.code }

  let(:params) { { code:, id: } }

  describe 'Success' do
    it 'contract is successful' do
      expect(result).to be_success
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

    context 'with wrong code' do
      context 'when code is wrong' do
        let(:code) { '00000000' }
        let(:message) { I18n.t('dry_validation.errors.rules.code.wrong_secret_code') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(code: [message])
        end
      end

      context 'when code has wrong format' do
        let(:code) { '0' }
        let(:message) do
          I18n.t('dry_schema.errors.size?.value.string.arg.default', size: Constants::EasterEgg::UNIQUE_CODE_LENGTH)
        end

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(code: [message])
        end
      end

      context 'when code has wrong type' do
        let(:code) { 11_111_111 }
        let(:message) { I18n.t('dry_schema.errors.str?') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(code: [message])
        end
      end

      context 'when code is empty' do
        let(:code) { nil }
        let(:message) { I18n.t('dry_schema.errors.filled?') }

        it 'fails with correct message' do
          expect(result).to be_failure
          expect(result.errors.to_h).to include(code: [message])
        end
      end
    end
  end
end
