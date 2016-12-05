class UserOptionsController < ApplicationController

  def create
    options = UserOptions.new(user_options_params)
    session[:flag_at_months] = options.flag_at_months
    redirect_back(fallback_location: '/')
  end

  private

  def user_options_params
    params.require(:user_options).permit(
      :flag_at_months
    )
  end

end
