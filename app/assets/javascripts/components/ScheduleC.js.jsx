var ScheduleC = React.createClass({
  // propTypes: {
  //   startMileage: React.PropTypes.node,
  //   endMileage: React.PropTypes.node,
  //   gas: React.PropTypes.node
  // },

    getDefaultProps: function(){
        return {
            shifts: {},
            earnings: {},
            individual_expenses: true,
            outside_miles: 0
        };
    },
    
    getInitialState: function() {
        return {
            shifts: this.props.shifts,
            earnings: this.props.earnings,
            individual_expenses: this.props.individual_expenses,
            outside_miles: this.props.outside_miles
        };
    },

    mileageCentsPerMile: function(){

        // RUBY CODE
        // shifts = this.state.shifts
        // total_mileage = 0
        
        // shifts.each do |shift|
        //   total_mileage += (shift.start_mileage - shift.end_mileage)
        // end

        // mileage_expenses += total_mileage * .575

        // return mileage_expenses

        var shifts = this.state.shifts
        total_mileage = 0
        
        shifts.forEach(function(shift){
          total_mileage += (shift.start_mileage - shift.end_mileage)
        })
       

        mileage_expenses += total_mileage * .575

        return mileage_expenses        
    
    },



    mileageAsExpenses: function(non_work_mileage) {
      
      var shifts = this.state.shifts

      var shift_mileage = 0
      
      shifts.forEach(function(shift){
        shift_mileage += (shift.start_mileage - shift.end_mileage)
      })

      var total_mileage = 0
      total_mileage += (shift_mileage + non_work_mileage)
      
      var expensable_miles = (shift_mileage/ total_mileage) 

      var expenses = current_user.expenses.all
      var total_vehicle_expenses = 0 
      

      expenses.forEach(function(expense){

        if ((expense.expense_type === 'Food') || (expense.expense_type === 'Phone Bill') || (expense.expense_type === 'Other')){
            // continue;
        }else{        
            total_vehicle_expenses += expense.cost
        }

        adjusted_vehicle_expenses = (total_vehicle_expenses * expensable_miles)  

        return adjusted_vehicle_expenses

      })
    },

    switchIndividualExpenses: function(e) {
      var that = this
      console.log("e.target.value: " + e.target.value)
      var bool = JSON.parse(e.target.value)

      this.setState({
        individual_expenses: !bool <<< problem here
      });

      console.log("individual_expenses: " + this.state.individual_expenses)

      // this.setState({
      //   individual_expenses: !(this.state.individual_expenses)
      // });
    },

    handleOutsideMiles: function(e) {
      console.log("inside handleOutsideMiles")
      var miles_integers = parseInt(e.target.value)

      this.setState({
        outside_miles: miles_integers
      });
    },

    estimateScheduleC: function(){

    },

  render: function() {
    // console.log(this.state.individual_expenses);
    console.log(this.state.outside_miles)
    console.log("individual expenses at load: " + this.state.individual_expenses)
    return (
      <div>
          <h5>Schedule C Questions</h5>
          <p>You can either deduct actual expenses (like gas, repairs, upkeep) or mileage at 57.5 cents/mile. For the most part, the mileage deduction is the better option as actual expenses have to be reduced by the business use percentage (ie, if the total use of your car for Postmates is only 10%, then you only get to deduct 10% of those expenses. </p>



          <p>Q: Would you like to expense your vehicle costs by cents/mile or by your individual expenses?</p>


          <select defaultValue="true" onChange={this.switchIndividualExpenses}>
            <option value="true" >Individual Expenses</option>
            <option value="false">Cents per mile</option>
          </select>


          <p>Q: How many do you use your car outside of business?</p>
          <label className="" value={this.state.outside_miles} onChange={this.handleOutsideMiles}>
              <input type="text"/>
          </label>

          
          <p>Q: Which quarter do you want to estimate tax for?</p>
          <select>
            <option value="1">First</option>
            <option selected value="2">Second</option>
            <option value="3">Third</option>
            <option value="4">Fourth</option>
          </select>

          <button onClick={this.estimateScheduleC}>Estimate Tax</button>


      </div>
    );
  }
});



