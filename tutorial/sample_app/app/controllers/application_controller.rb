class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ApplicationコントローラにSessionヘルパーモジュールを読み込む
  include SessionsHelper
end
