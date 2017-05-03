class ExpenseController < ApplicationController


#   def index
#     @expenses = Expenses.all
#   end

#   def show
#     p "*"*90
#     p "PARAMS IN SHOW EXPENSE"
#     p params.inspect
#     p "*"*90
#     # @expense = Expense.find_by(params[:date])
#     @expense = Expense.find(params[:id])

#   end

#   def new
#     @expense = current_user.expenses.new
#     respond_to do |format|
#       format.html
#       # format.js
#     end

#     p "*"*90
#     p "params in new expense"
#     p params.inspect
#     p "*"*90

#     # if request.xhr?
#     #   # respond_with(@usrID, @shftID)
#     #   @user = current_user
#     #   @expense = @user.expenses.new
#     #   #layout: false
#     # else
#     #   p "Hit new else status"
#     #   status 422
#     # end

#   end

#   def create
#     # @types = ['Gas', 'Food', 'Maintenance', 'Car Payment', 'License, Title and Registration', 'Car Wash', 'Parking Fees', 'Tolls', 'Phone Bill', 'Other']
#     @expense = current_user.expenses.new(expense_params)
#     p "*"*90
#     p "params in create expense"
#     p params.inspect
#     p "*"*90
#     if @expense.save!
#       redirect_to user_expense_path(current_user.id, @expense.id)
#     else
#       render :new
#     end
#   end

#   def update
#   end

#   def destroy
#   end
# end
#################################################################################

  def index

      @user = User.find(params[:user_id])
      @shifts = @user.shifts.all
      @expenses = @user.expenses.all


  end

  def show

    @expense = Expense.find(params[:id])

  end

  def new

    @expense = Expense.new
  
  end

  def create

    @expense = current_user.expenses.new(expense_params)

    if @expense.save!
      redirect_to user_expense_path(current_user.id, @expense.id)
    else
      render :new
    end
  end

  def edit

    @expense = current_user.expenses.find(params[:id])

  end

  def update

    @expense = current_user.expenses.find(params[:id])

    if @expense.update_attributes(expense_params)
      flash[:success] = "Info updated"
      redirect_to user_expense_path(current_user, @expense.id)
      # redirect_to user_expense_path(@expense.user_id, @expense.id)
    else
      flash[:danger] = "Edits did not save, try again"
      render 'edit'
    end
  end

  def destroy

    @expense = current_user.expenses.find(params[:id])
    @expense.destroy
    flash[:success] = "Expense deleted"
    redirect_to user_shift_index_path(current_user)
  end

end


private

def expense_params
  params.require(:expenses).permit(:date, :expense_type, :cost, :id, :user_id)
end