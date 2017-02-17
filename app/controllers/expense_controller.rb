class ExpenseController < ApplicationController
  def index
    @expenses = Expenses.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    # if request.get?
      # @user_id = nil
      # respond_to do |format|
      #   format.html { redirect_to user_path, :id => id}
      #   p "request.get params: "
      #   p params
      # end
    #
    # end
    if request.xhr?
      p "Hit new controller, if statement"
      # p request
      p "*"*90
      p params
      p "*"*90
      # sendParams("<%= params[:id].to_json %>")
      @user = current_user
      @expense = @user.expenses.new
      # erb :'/expense/new', layout: false
    else
      p "Hit new else status"
      status 422
    end
    # respond_to do |format|
    #   format.html {redirect_to new_expense_path}
    #   format.js
    # end
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