class GroupsController < ApplicationController
    before_action :authenticate_user!    
    def new
        @group = Group.new()
    end

    def create
        # @group = Group.new(group_params.merge(user: current_user)) 
        # @test = User.where(email: email_params["emails"]) 
        @group = Group.new(params.require(:group).permit(:name))     
        
        @user = current_user   
        @group.users << @user
        email_params["emails"].split(",").each do |e|
            @group.users << User.where(email: e)
        end
        # @group.users << @test
        if @group.save
            redirect_to root_path     
        end
    end

    def email_params
        params.require(:group).permit(:emails)
    end

    def show
        
    end

     
end
