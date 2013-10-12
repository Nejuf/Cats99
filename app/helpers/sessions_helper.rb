module SessionsHelper

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    current_user
  end

  def current_user
    current_session = Session.find_by_token(session[:session_token])
    return if current_session.nil?
    @current_user ||= User.find_by_id(current_session.user_id)
  end

  def logout!
    if logged_in?
      Session.find_by_token(session[:session_token]).destroy
      @current_user.session_token = nil
    end

    session[:session_token] = nil
  end

  def current_user_owner_of_cat?
    @cat = Cat.find(params[:id])
    if current_user.id == @cat.owner_id
      true
    else
      flash[:errors] = ["You must be the owner of that cat for that action."]
      redirect_to new_session_url
    end
  end

end
