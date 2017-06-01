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
            click: true,
        };
    },
    
    getInitialState: function() {
        return {
            shifts: this.props.shifts,
            earnings: this.props.earnings,
            click: this.props.click,
            thing: this.props.thing
        };
    },

// This is firing twice
    switchBoolean: function() {
      this.setState({
        click: !(this.state.click)
      });
    },

  render: function() {
    console.log(this.state.click);
    return (
      <div>
          <h5>Schedule C Questions</h5>
          <p>You can either deduct actual expenses (like gas, repairs, upkeep) or mileage at 57.5 cents/mile. For the most part, the mileage deduction is the better option as actual expenses have to be reduced by the business use percentage (ie, if the total use of your car for Postmates is only 10%, then you only get to deduct 10% of those expenses. </p>


          <p>{this.state.click.toString()}</p>

          <p>Q: Would you like to expense your vehicle costs by cents/mile or by your individual expenses?</p>
            
          <div className="inline_selections" id="mileage">
            <p>Individual expenses</p>
            <label className="switch" onChange={this.switchBoolean}>
              <input type="checkbox"/>
              <div className="slider round"></div>
            </label>
            <p>Cents per mile</p>
          </div>


      </div>
    );
  }
});



