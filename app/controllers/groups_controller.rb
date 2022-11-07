class GroupsController < ApplicationController
    before_action :authenticate_user!    
    def new
        @group = Group.new()
    end

    def create
        @group = Group.new(group_params.merge(user: current_user))     

        if @group.save
            redirect_to root_path     
        end
    end

    def group_params
        params.require(:group).permit(:name)
    end

     
end
