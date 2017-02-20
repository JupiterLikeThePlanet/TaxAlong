class ExpenseController < ApplicationController


  def index
    @expenses = Expenses.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    respond_to do |format|
      format.html
      # format.json {render: }
      # format.js
    end
    # @current_shift = nil
    # respond_to do |format|
    #   format.html { redirect_to user_shift_path(:id => @client.id) }
    # end
    p "*"*90
    p "params in new expense"
    p params.inspect
    p "*"*90

    p "~"*90
    p "Who is the current user"
    p current_user
    p "~"*90

    # p "+"*90
    # p "What is the current shift"
    # p current_shift
    # p "+"*90

    p "+"*90
    p params[:id]
    p params[:shift_id]


    unless params[:id] === nil || params[:shift_id] === nil
      @usrID = params[:id]
      @shftID = params[:shift_id]
    end

    p "user id and shift id"
    p @usrID
    p @shftID
    p "+"*90

    if request.xhr?
      # respond_with(@usrID, @shftID)
      @user = current_user
      @expense = @user.expenses.new
      #layout: false
    else
      p "Hit new else status"
      status 422
    end

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
  # params.require(:expenses).permit(:type, :cost, @current_user.id, current_shift)
  params.require(:expenses).permit(:type, :cost, :id, :shift_id)
end