class ApplicationController < ActionController::Base
   #protetc_from_forgery with: :exception
   before_action :authenticate_user!
end
