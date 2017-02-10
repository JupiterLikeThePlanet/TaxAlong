// var React = require("react-rails");

var AdjustIncome = React.createClass({
  // propTypes: {
  //   startMileage: React.PropTypes.node,
  //   endMileage: React.PropTypes.node,
  //   gas: React.PropTypes.node
  // },

    getDefaultProps: function(){
        return {
            startMileage: 0,
            endMileage: 0,
            gas: 0
        };
    },
    
    getInitialState: function() {
        return {
            startMileage: this.props.startMileage,
            endMileage: this.props.endMileage,
            gas: this.props.gas
        };
    },

  render: function() {
    return (
      <div>
          <h3>Start Mileage: {this.props.startMileage}</h3>
          <h3>End Mileage: {this.props.endMileage}</h3>
          <h3>Gas: {this.props.gas}</h3>
      </div>
    );
  }
});


// module.exports = AdjustIncome;