class ExpenseController < ApplicationController
  def index
    @expenses = Expenses.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new

    if request.xhr?
      @user = current_user
      @expense = @user.expenses.new
      #layout: false
    else
      p "Hit new else status"
      status 422
    end
\
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