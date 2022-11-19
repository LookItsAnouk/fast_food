class ApplicationController < ActionController::Base
    
    before_action :set_query

    def set_query
        @q = Recipe.ransack(params[:q])
    end

    def user_signed_in?
        current_user.present?
    end
        helper_method :user_signed_in?
        helper_method :current_user


    def user_is_cook?
        current_user.present? && current_user[:is_cook?] == "true"
    end
    helper_method :user_is_cook?

    private

    def current_user
        @current_user ||= User.find_by_id session[:user_id]
    end


    def authenticate_user!
        redirect_to new_session_path, notice: "Please sign in" unless user_signed_in?
    end
end