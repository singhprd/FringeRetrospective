var FilterBar = React.createClass({
	params: function() {
        filter = this.props.current_filter;
        return {
            favourites: filter["favourites"],
            year: filter["year"]
        }
	},
    redirect: function(param, value) {
        var params = this.params()
        // Update the params to change the filter
        params[param] = value;
    	window.location = "/?" + $.param( params );
    },
    is_active: function(param, value) {
  		var params = this.params()
        if (typeof params == 'undefined') { return }
    	if (params[param].toString() == value) {
    		return "active"
    	}
    },
    render: function() {
        return (
      	<div className="btn-toolbar">
        	<div className="btn-group">
        		<button onClick={() => this.redirect("favourites", "false")} className={"btn btn-primary navbar-btn btn-sm " + (this.is_active("favourites", "false"))}>All</button>
        		<button onClick={() => this.redirect("favourites", "true")} className={"btn btn-primary navbar-btn btn-sm " + (this.is_active("favourites", "true"))}>Favourites</button>
        	</div>
			<div className="btn-group">
    		<button onClick={() => this.redirect("year", "2015")} className={"btn btn-primary navbar-btn btn-sm " + (this.is_active("year", "2015"))}>2015</button>
    		<button onClick={() => this.redirect("year", "2016")} className={"btn btn-primary navbar-btn btn-sm " + (this.is_active("year", "2016"))}>2016</button>
    		<button onClick={() => this.redirect("year", "2017")} className={"btn btn-primary navbar-btn btn-sm " + (this.is_active("year", "2017"))}>2017</button>
        	</div>
      	</div>
            );
    }
});
