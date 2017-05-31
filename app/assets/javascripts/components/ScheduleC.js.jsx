var ScheduleC = React.createClass({
  // propTypes: {
  //   startMileage: React.PropTypes.node,
  //   endMileage: React.PropTypes.node,
  //   gas: React.PropTypes.node
  // },

    getDefaultProps: function(){
        return {
            shifts: 0,
            earnings: 0
        };
    },
    
    getInitialState: function() {
        return {
            shifts: this.props.shifts,
            earnings: this.props.earnings
        };
    },

  render: function() {
    return (
      <div>
          <h5>Schedule C Questions</h5>
          <p>You can either deduct actual expenses (like gas, repairs, upkeep) or mileage at 57.5 cents/mile. For the most part, the mileage deduction is the better option as actual expenses have to be reduced by the business use percentage (ie, if the total use of your car for Postmates is only 10%, then you only get to deduct 10% of those expenses. </p>
          <input type="checkbox" checked data-toggle="toggle" data-class="fast"/>


      </div>
    );
  }
});



