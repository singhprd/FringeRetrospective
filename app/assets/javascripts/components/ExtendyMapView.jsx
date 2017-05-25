var ExtendyMapView = React.createClass({
  getInitialState: function(){
    console.log( this.props.event_id )
    return{};
  },
  render: function() {
    return (
      <div>
          <a data-toggle="collapse" href={"#collapse"+1}><button className="btn btn-default active">map</button></a>

          <div id={"collapse"+1} className="panel-collapse collapse">
            <div className="panel-body">Panel Body</div>
            <div className="panel-footer">Panel Footer</div>
          </div>

    </div>
      );
  }
});

