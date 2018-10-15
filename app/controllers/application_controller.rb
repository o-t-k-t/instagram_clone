class ApplicationController < ActionController::Base
  include SessionsHelper
  include FeedsHelper

  protect_from_forgery with: :exception
end
