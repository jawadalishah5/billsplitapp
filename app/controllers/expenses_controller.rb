class ExpensesController < ApplicationController

    def new
        
    end

    def create
        
        # @email = params.require(:email)

        # @total = total
        # @total = params.require(:total)
        # redirect_to root_path

        
        # change expense
        @group_id = params[:group_id]
        @payer = User.where(email: params[:email])[0]

        #total
        @total = params[:total].to_i
        
        # update main expense
        @old_expense = Expense.where(user_id: @payer.id, group_id: @group_id).first
        @expense_new = @old_expense.update(amount: @old_expense.amount.to_i + @total)
        
        if params[:type] == "equal"

            # division
            @members = []
            params.except(:authenticity_token, :group_id, :email, :action, :total, :commit, :controller, :type).each do |key, value|
                puts key
                if value == "1"
                    @members.append(key)
                end
            end

            # splitting amount
            @members.each do |member|
                old_row = Expense.where(user_id: member, group_id: @group_id).first
                new_row = old_row.update(amount: old_row.amount.to_i - @total/@members.length())
            end
        else
            @members = params.except(:authenticity_token, :group_id, :email, :action, :total, :commit, :controller, :type).each

            # splitting amount
            @members.each do |key, value|
                old_row = Expense.where(user_id: key, group_id: @group_id).first
                new_row = old_row.update(amount: old_row.amount.to_i - value.to_i)
            end
        end

        if @expense_new
            redirect_back(fallback_location: root_path)
        end


         
        
        # render html: ("<script>alert('"+@group.id.to_s+"')</script>").html_safe
        
    end

end
