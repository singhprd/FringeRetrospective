import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "userSelect" ]

  initialize() {

  }

  addUser() {
    var userToAdd = this.userSelectTarget.options[ this.userSelectTarget.selectedIndex ].value;
    var listId = this.element.dataset.listId;

    var updateData = {
      user_id: userToAdd,
      add_user: true,
      // list_id: listId,
    }

    $.ajax({
      url: '/lists/'+listId,
      type: 'PUT',
      data: updateData,
      success: function(result,status,xhr) {
      }.bind(this),
      error: function() {
        console.log('failed');
      }
    });
  }

  removeUser(e) {
    var userToRemove = e.target.dataset.userId;
    var listId = this.element.dataset.listId;

    var updateData = {
      user_id: userToRemove,
      remove_user: true,
    }

    $.ajax({
      url: '/lists/'+listId,
      type: 'PUT',
      data: updateData,
      success: function(result,status,xhr) {
      }.bind(this),
      error: function() {
        console.log('failed');
      }
    });
  }
}
