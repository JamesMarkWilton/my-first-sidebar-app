import { Controller } from "@hotwired/stimulus";
import * as procoreIframeHelpers from "@procore/procore-iframe-helpers";

export default class extends Controller {
  context = procoreIframeHelpers.initialize();

  connect() {
    this.success();
  }

  login() {
    this.context.authentication.authenticate({
      url: "/auth/procore",
      onSuccess: function (payload) {
        window.location = "/me";
      },
      onFailure: function (error) {
        console.log(error);
      },
    });
  }

  success() {
    this.context.authentication.notifySuccess({});
  }
}
