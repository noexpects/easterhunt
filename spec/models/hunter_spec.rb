# frozen_string_literal: true

RSpec.describe Hunter do
  describe 'associations' do
    it { is_expected.to have_many(:easter_eggs) }
  end

  describe 'database columns' do
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false, default: '') }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false, default: '') }
    it { is_expected.to have_db_column(:jti).of_type(:string).with_options(null: false, default: '') }
    it { is_expected.to have_db_index(:email).unique }
  end
end
