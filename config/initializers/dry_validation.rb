# frozen_string_literal: true

Dry::Validation::Contract.config.messages.backend = :i18n
Dry::Validation::Contract.config.messages.default_locale = :en
Dry::Validation::Contract.config.messages.load_paths << 'config/locales/en.errors.yml'
