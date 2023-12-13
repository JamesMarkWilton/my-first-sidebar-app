class MeController < ApplicationController

  before_action :authenticate_user!

  def index
    @me = client.get('me').body
  end
end
