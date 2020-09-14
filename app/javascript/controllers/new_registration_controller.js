import { Controller } from "stimulus"
import * as Credential from "credential";
import * as Encoder from "encoder";
import $ from 'jquery';


// import { MDCTextField } from '@material/textfield';

export default class extends Controller {
  static targets = ["usernameField", "emailField"]

  create(event) {
    const url = this.data.element.dataset.url;
    const email = this.emailFieldTarget.value;

    // var that = this;
    $.ajax({
      url: url,
      data: { 
        authenticity_token: $('[name="csrf-token"]')[0].content,
        registration: { email: email }
      },
      method: 'POST',
      success: function(data, status, xhr) {
        console.log(data);
        var credentialOptions = data;

        credentialOptions["challenge"] = Encoder.strToBin(credentialOptions["challenge"]);
        // Registration
        if (credentialOptions["user"]) {
          credentialOptions["user"]["id"] = Encoder.strToBin(credentialOptions["user"]["id"]);
          // var credential_nickname = event.target.querySelector("input[name='registration[nickname]']").value;
          var credential_nickname = "TODO cred nickname"
          var callback_url = `/webauthn_registration/callback?credential_nickname=${credential_nickname}`

          Credential.create(encodeURI(callback_url), credentialOptions);
        }
      },
      error: function(data, status, xhr) {
        flash.innerHTML = data.responseJSON["errors"];
      }
    });

  }

  error(event) {
    let response = event.detail[0];
    let usernameField = new MDCTextField(this.usernameFieldTarget);
    usernameField.valid = false;
    usernameField.helperTextContent = response["errors"][0];
  }
}
