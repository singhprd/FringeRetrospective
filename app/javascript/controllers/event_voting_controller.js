import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "eventVoting", "eventVoteCount" ]

  initialize() {
  }

  upvote() {
    this.vote(+1);
  }

  downvote() {
    this.vote(-1);
  }

  vote(value) {
    this.optimisticVoteUpdate(value);

    var postData = { event_id: this.eventId(), value: value }

    $.ajax({
      url: '/votes',
      type: 'POST',
      data: postData,
      success: function(result,status,xhr) {
        var votes = result.votes;
        console.log(votes);
        $('#notice').html(result.notice);
        this.updateVoteCount(result.votes, value)
      }.bind(this),
      error: function() {
        console.log('failed');
      }
    });
  }

  optimisticVoteUpdate(value) {
    // this.eventVoteCountTarget.innerText =
    //   parseInt(this.eventVoteCountTarget.innerText) + value;
  }

  eventId() {
    return this.element.dataset.eventId
  }

  updateVoteCount(newVoteText, value) {
    this.eventVoteCountTarget.innerText = newVoteText;
    
    // const currentVoteCount = parseInt(this.eventVoteCountTarget.innerText);
    // const newVoteCount = parseInt(newVoteText);

    // if (value > 0) {
    //   if (newVoteCount > currentVoteCount) {
    //     this.eventVoteCountTarget.innerText = newVoteCount;
    //   }
    // }

    // if (value < 0) {
    //   if (newVoteCount < currentVoteCount) {
    //     this.eventVoteCountTarget.innerText = newVoteCount;
    //   } 
    // }
  }
}
