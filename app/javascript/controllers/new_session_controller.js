import { Controller } from "stimulus"
import * as Credential from "credential";
import * as Encoder from "encoder";

// import { MDCTextField } from '@material/textfield';

export default class extends Controller {
  static targets = ["usernameField", "emailField"]

  create(event) {
    const url = this.data.element.dataset.sessionUrl;
    const email = this.emailFieldTarget.value;

    // var that = this;
    $.ajax({
      url: "/webauthn_session",
      data: { 
        authenticity_token: $('[name="csrf-token"]')[0].content,
        registration: { email: email }
      },
      method: 'POST',
      success: function(data, status, xhr) {
        // console.log(data);
        var [data, status, xhr] = event.detail;
        console.log(status);
        var credentialOptions = data;
        credentialOptions["challenge"] = Encoder.strToBin(credentialOptions["challenge"]);
        credentialOptions["allowCredentials"].forEach(function(cred, i){
          cred["id"] = Encoder.strToBin(cred["id"]);
        })
        Credential.get(credentialOptions);
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
