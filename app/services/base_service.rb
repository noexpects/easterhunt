# frozen_string_literal: true

class BaseService
  def ok?
    contract.success?
  end

  private

  def validate_params
    @contract = contract.call(@params.to_unsafe_h)
  end
end
