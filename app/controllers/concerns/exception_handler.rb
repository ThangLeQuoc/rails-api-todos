module ExceptionHandler
  # provides the more graceful `included` method
  # TODO @thangle: what is this extend keyword, how is it different than the > symbol ?
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end
  end
end