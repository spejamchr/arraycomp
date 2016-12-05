class UserOptionsController < ApplicationController

  def create
    session[:user_options] = UserOptions.new(user_options_params).attributes
    redirect_back(fallback_location: '/')
  end

  private

  def user_options_params
    params.require(:user_options).permit(
      :flag_at_months,
      :show_percent_graphs
    )
  end

end
