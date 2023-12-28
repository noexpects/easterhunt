# frozen_string_literal: true

RSpec.describe EasterEgg do
  describe 'associations' do
    it { is_expected.to belong_to(:hunter).optional }
  end

  describe 'database columns' do
    it { is_expected.to have_db_column(:code).of_type(:string) }
    it { is_expected.to have_db_column(:latitude).of_type(:float) }
    it { is_expected.to have_db_column(:longitude).of_type(:float) }
    it { is_expected.to have_db_column(:clue).of_type(:text) }
    it { is_expected.to have_db_column(:revealed).of_type(:boolean).with_options(null: false, default: false) }
    it { is_expected.to have_db_column(:hunter_id).of_type(:integer) }
    it { is_expected.to have_db_index(:hunter_id) }
  end
end
