class RootController < BaseController
  def index
    if current_user
      redirect_to '/profile'
    else
      redirect_to '/sign_in'
    end
  end
end
