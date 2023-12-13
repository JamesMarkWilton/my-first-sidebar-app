class ApplicationController < ActionController::Base
    after_action :allow_iframe

    private

    def allow_iframe
        response.headers.except! 'X-Frame-Options'
    end

    def current_user
      @current_user ||= User.find_by(procore_id: session[:procore_id]) if session[:procore_id]
    end

    def authenticate_user!
      redirect_to root_path, error: "Your session has expired." unless current_user
    end
    
    def client
      @client ||= Procore::Client.new(
          client_id: ENV['PROCORE_KEY'],
          client_secret: ENV['PROCORE_SECRET'],
          store: store = Procore::Auth::Stores::ActiveRecord.new(object: current_user),
          options: {host: ENV['BASE_URL']}
      )
  end
end
