// Entry point to React
var EventCard = React.createClass({
  getInitialState: function() {
    return { event: $.parseJSON(this.props.event), is_favourited: this.props.is_favourited};
  },
  signed_in: function(e, v) {
    if (this.props.user_signed_in) {
      return (
        <div className="btn-toolbar" role="toolbar">
          <EventVoteButtons score={e.score} event_id={e.id} />
          <EventFavouriteStatus favourite={this.favourite} unfavourite={this.unfavourite} is_favourited={this.state.is_favourited} event_id={e.id} />
        </div>
      );
    } else {
      return (
        <div className="btn-toolbar" role="toolbar">
          <EventVoteButtons score={e.score} event_id={e.id} />
          <a href="/users/sign_in" type="button" className="btn btn-default">
            Sign In To Vote
          </a>
        </div>
      );
    }
  },
  favourite: function(){
    // console.log("Faved")
    // Keen Bean Loading
    this.setState({is_favourited: true})
    var that = this
    $.ajax({
      url: "/favourites",
      type: "POST",
      data: {favourite: {event_id: this.state.event.id}},
      success: function(a,b,c){
        this.is_favourited()
      }.bind(this),
      error: function() {
        console.log('failed favourite user_event_status.jsx')
      }
    });
  },

  unfavourite: function(){
    // console.log("Un-Faved")
    // Keen Bean Loading
    this.setState({is_favourited: false})
    var that = this
    $.ajax({
      url: "/favourites/" + this.state.event.id,
      type: "DELETE",
      data: {favourite: {event_id: this.state.event.id}},
      success: function(a,b,c){
        // console.log(a,b,c)
        this.is_favourited()
      }.bind(this),
      error: function() {
        console.log('failed unfavourite user_event_status.jsx')
      }
    });
  },
  is_favourited: function(){
    var that = this
    $.ajax({
      url: "/events/" + this.state.event.id + "/is_favourited",
      type: "GET",
      data: {event_id: this.state.event.id},
      success: function(a,b,c){
        this.setState({is_favourited: a.bool})
        // $("#notice").html(a['notice'])
      }.bind(this),
      error: function() {
        console.log('failed is_favourited user_event_status.jsx')
      }
    });
  },
  check_is_favourited: function(){
    var that = this
    $.ajax({
      url: "/events/" + this.state.event.id + "/is_favourited",
      type: "GET",
      data: {event_id: this.state.event.id},
      success: function(a,b,c){
        if (a.bool) {
          this.setState({is_favourited: "favourite"})
        }
      }.bind(this),
      error: function() {
        console.log('failed is_favourited user_event_status.jsx')
      }
    });
  },
  render: function() {
    $('[data-toggle="tooltip"]').tooltip();
    const e = this.state.event;
    const v = $.parseJSON(this.props.venue);
    return (
      <div
        className="panel panel-primary home_card text-info"
        id={this.state.id}
      >
        <div className={"panel-heading " + (this.state.is_favourited ? "favourite" : "")}>
          <h3 className="panel-title">
            <a href={"/events/" + e.id}>{e.title}</a>
          </h3>
        </div>
        <div className="panel-body">
          <dl className="dl-horizontal">

            <dt>Venue:</dt>
            <dd>{v.name}</dd>

            <dt>Artist:</dt>
            <dd>{e.artist}</dd>

            <dt>Website:</dt>
            <dd> <a href={e.website}>Link </a> </dd>

            <dt>Festival:</dt>
            <dd> {e.festival} </dd>

          </dl>

          <div dangerouslySetInnerHTML={{ __html: e.description }} />

          {this.signed_in(e, v)}

        </div>
      </div>
    );
  }
});