import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "newFriendEmail" ]

  initialize() {
  }

  addFriend() {
    const email = this.newFriendEmailTarget.value;
    this.createFriendRequest(email);
  }

  acceptRequest(e) {
    let requestId = e.target.dataset.requestId
    var stimulusController = this;

    let data = {
      friend_request_action: "ACCEPT"
    }

    $.ajax({
      type: "PUT",
      url: "/friend_requests/" + requestId,
      data: data,
      context: this,
      success: () => {
        Turbolinks.visit(window.location, { action: 'replace' })
      }
    });
  }

  deleteRequest(e) {
    let requestId = e.target.dataset.requestId
    var stimulusController = this;

    $.ajax({
      type: "DELETE",
      url: "/friend_requests/" + requestId,
      context: this,
      success: () => {
        Turbolinks.visit(window.location, { action: 'replace' })
      }
    });
  }

  // stopClose(e) {
  //   e.stopPropagation();
  // }

  // delete(e) {

  //   var stimulusController = this;

  //   let list_item_id = e.target.dataset.listItemId;

  //   $.ajax({
  //     type: "DELETE",
  //     url: "/list_items/" + list_item_id,
  //     context: this,
  //     success: (data) => {
  //       this.contentTarget.innerHTML = data;
  //     }
  //   });
  // }

  createFriendRequest(email) {
    var stimulusController = this;

    let data = {
      email: email
    }

    $.ajax({
      type: "POST",
      url: "/friend_requests",
      data: data,
      context: this,
      success: () => {
        Turbolinks.visit(window.location, { action: 'replace' })
      }
    });
  }

  unfriend(e) {
    let friendId = e.target.dataset.friendId;

    let data = {
      friend_request_action: "DELETE",
      friendId: friendId,
    }

    $.ajax({
      type: "DELETE",
      url: "/friends/" + friendId,
      data: data,
      context: this,
      success: () => {
        Turbolinks.visit(window.location, { action: 'replace' })
      }
    });
  }

  // // handleResponse(data, textStatus, qjXHR) {
  // //   debugger;
  // }
}


