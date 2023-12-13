class SessionController < ApplicationController
  def index
    session[:company_id] = params[:procoreCompanyId]
    session[:project_id] = params[:procoreProjectId]
  end

  def new
    redirect_to auth_url, allow_other_host: true
  end

  def create
    #pulls information from the request 
    auth_hash = request.env['omniauth.auth']

    #procore user id and email
    session[:procore_id] = auth_hash['info']['procore_id']
    session[:email] = auth_hash['info']['email']
    
    if current_user.nil?
      user = User.create(
        procore_id: auth_hash['info']['procore_id'],
        access_token: auth_hash['credentials']['token'],
        refresh_token: auth_hash['credentials']['refresh_token'],
        expires_at: auth_hash['credentials']['expires_at']
      )

    else
      current_user.update(
        access_token: auth_hash['credentials']['token'],
        refresh_token: auth_hash['credentials']['refresh_token'],
        expires_at: auth_hash['credentials']['expires_at']
      )
    end

    token = Procore::Auth::Token.new(
      access_token: auth_hash['credentials']['token'],
      refresh_token: auth_hash['credentials']['refresh_token'],
      expires_at: auth_hash['credentials']['expires_at']
    )

    #allows app to reference the user's access token to make calls
    store = Procore::Auth::Stores::ActiveRecord.new(object: current_user)
    store.save(token)

    redirect_to me_path
  end

  private
  def auth_url
    url = "#{ENV['OAUTH_URL']}/oauth/authorize?response_type=code&client_id=#{ENV['PROCORE_KEY']}&redirect_uri=#{ENV['REDIRECT_URI']}"
  end
end
