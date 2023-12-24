# frozen_string_literal: true

module RackSessionFix
  extend ActiveSupport::Concern

  class FakeRackSession < Hash
    def enabled?
      false
    end
  end

  included do
    before_action :set_fake_session_for_devise

    private

    def set_fake_session_for_devise
      request.env['rack.session'] ||= FakeRackSession.new
    end
  end
end
