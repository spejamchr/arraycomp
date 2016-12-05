class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :_set_current_options_from_user

  protected

  def user_options
    set_session_defaults
    @user_options ||= UserOptions.new(
      flag_at_months: session[:flag_at_months],
    )
  end

  helper_method :user_options

  private

  def set_session_defaults
    session[:flag_at_months] ||= Depreciable::DEFAULT_FLAG_AT_MONTHS
  end

  # This is a hack to let the Depreciable module know the current `user_options`
  # without having to pass it explicitly everywhere.
  #
  def _set_current_options_from_user
    uo = user_options
    Depreciable.send(:define_method, '_options_from_user', proc { uo })
  end

end
