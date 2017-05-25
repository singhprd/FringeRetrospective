var EventVoteButtons = React.createClass({

    componentDidMount: function() {
    },

    getInitialState: function() {
        return { score: this.props.score };
    },

    get_votes: function() {
        var that = this;
        $.ajax({
            url: "/events/1/votes",
            type: "GET",
            data: {event_id: "1"},
            success: function(a, b, c) {
                votes = a["votes"];
                this.setState({ score: a["votes"] });
                $("#notice").html(a["notice"]);
            }.bind(this),
            error: function() {
                console.log("failed");
            }
        });
    },
    upvote: function() {
        // this.setState({ score: this.state.score + 1 });
        var that = this;
        $.ajax({
            url: "/votes",
            type: "POST",
            data: { event_id: this.props.event_id, value: 1 },
            success: function(a, b, c) {
                // console.log("a", a, "b",b, "c", c)
                votes = a["votes"];
                if (votes) {
                    this.setState({ score: a["votes"] });
                }
                $("#notice").html(a["notice"]);
            }.bind(this),
            error: function() {
                console.log("failed");
            }
        });
        // this.get_votes()
    },
    downvote: function() {
        // this.setState({ score: this.state.score - 1 });
        var that = this;
        $.ajax({
            url: "/votes",
            type: "POST",
            data: { event_id: this.props.event_id, value: -1 },
            success: function(a, b, c) {
                // console.log("a", a, "b",b, "c", c)
                votes = a["votes"];
                if (votes) {
                    this.setState({ score: a["votes"] });
                }
                $("#notice").html(a["notice"]);
            }.bind(this),
            error: function() {
                console.log("failed");
            }
        });
    },
    render: function() {
        return (
            <div className="btn-group">
            <div className="vote_buttons btn-group" role="group">
            <button onClick={this.upvote} className="btn btn-default">
            👍
            </button>
            <button className="btn btn-default disabled">
            {this.state.score}
            </button>
            <button onClick={this.downvote} className="btn btn-default">
            👎
            </button>
            </div>
            </div>
            );
    }
});
