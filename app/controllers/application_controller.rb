class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :_set_current_options_from_user

  protected

  def user_options
    session[:user_options] ||= UserOptions::DEFAULTS
    @user_options ||= UserOptions.new(session[:user_options])
  end

  helper_method :user_options

  private

  # This is a hack to let the Depreciable and Graphable modules know the current
  # `user_options` without having to pass it explicitly everywhere.
  #
  def _set_current_options_from_user
    uo = user_options
    Depreciable.send(:define_method, '_options_from_user', proc { uo })
    Graphable.send(:define_method, '_options_from_user', proc { uo })
  end

end
