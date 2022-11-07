class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        @group = Group.where(:user_id => current_user.id)
    end

end
