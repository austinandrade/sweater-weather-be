class ApplicationController < ActionController::API
  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
