// event_id = this.props.event_id
var EventFavouriteStatus = React.createClass({
  getInitialState: function(){
    return{is_favourited: this.props.is_favourited};
  },

  is_favourited: function(){
    var that = this
    $.ajax({
      url: "/events/" + this.props.event_id + "/is_favourited",
      type: "GET",
      data: {event_id: this.props.event_id},
      success: function(a,b,c){
        this.setState({is_favourited: a.bool})
        // $("#notice").html(a['notice'])
      }.bind(this),
      error: function() {
        console.log('failed is_favourited user_event_status.jsx')
      }
    });
  },

  render_appropriate_buttons: function(){
    if (this.props.is_favourited) {
      return <button onClick={this.props.unfavourite} className="btn btn-default active">❤️️</button>
    } else {
      return <button onClick={this.props.favourite} className="btn btn-default">❤️️</button>
    }
  },

  render: function() {
    return (
      <div className="btn-group" role="group">
        {this.render_appropriate_buttons()}
      </div>
      );
  }
});
