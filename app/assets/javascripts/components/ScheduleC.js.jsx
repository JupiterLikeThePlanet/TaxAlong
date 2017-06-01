var ScheduleC = React.createClass({
  // propTypes: {
  //   startMileage: React.PropTypes.node,
  //   endMileage: React.PropTypes.node,
  //   gas: React.PropTypes.node
  // },

    getDefaultProps: function(){
        return {
            shifts: 0,
            earnings: 0,
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

// This is firing twice
    switchIndividualExpenses: function() {
      this.setState({
        individual_expenses: !(this.state.individual_expenses)
      });
    },

    handleOutsideMiles: function(e) {
      var miles_integers = parseInt(e.target.value)

      this.setState({
        outside_miles: miles_integers
      });
    },

  render: function() {
    // console.log(this.state.individual_expenses);
    console.log(this.state.outside_miles)
    return (
      <div>
          <h5>Schedule C Questions</h5>
          <p>You can either deduct actual expenses (like gas, repairs, upkeep) or mileage at 57.5 cents/mile. For the most part, the mileage deduction is the better option as actual expenses have to be reduced by the business use percentage (ie, if the total use of your car for Postmates is only 10%, then you only get to deduct 10% of those expenses. </p>


          <p>{this.state.individual_expenses.toString()}</p>

          <p>Q: Would you like to expense your vehicle costs by cents/mile or by your individual expenses?</p>
            

          <div className="inline_selections">
            <p>Individual expenses</p>
          </div>

          <div className="inline_selections">
            <label className="switch" onChange={this.switchIndividualExpenses}>
              <input type="checkbox"/>
              <div className="slider round"></div>
            </label>
          </div>
          
          <div className="inline_selections">
            <p>Cents per mile</p>
          </div>

          <p>Q: How many do you use your car outside of business?</p>
          <label className="" value={this.state.outside_miles} onChange={this.handleOutsideMiles}>
              <input type="text"/>
          </label>

          
          <p>Q: Which quarter do you want to estimate tax for?</p>
          <select>
            <option value="1">First</option>
            <option value="2">Second</option>
            <option selected value="3">Third</option>
            <option value="4">Fourth</option>
          </select>


      </div>
    );
  }
});



