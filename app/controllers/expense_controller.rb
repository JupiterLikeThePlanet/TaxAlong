class ExpenseController < ApplicationController
  def index
    @expenses = Expenses.all
  end

  def show
  end

  def new
    @user = User.find(params[:id])
    @expense = @user.expense.new
  end

  def create
    @expense = current_user.expenses.new(expense_params)

    if @expense.save!
      redirect_to expense_path(@expense.id)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
end


private

def expense_params
  params.require(:expenses).permit(:type, :cost)
end