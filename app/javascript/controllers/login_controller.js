import { Controller } from "@hotwired/stimulus";
import * as procoreIframeHelpers from "@procore/procore-iframe-helpers";

export default class extends Controller {
  connect() {
    window.addEventListener('message', (event) => {
      if (event.data.source != 'react-devtools-content-script') {
        console.log(event.data);
      }
    });

    window.parent.postMessage({ type: 'initialize' }, "*");
  }

  login() {
    window.addEventListener('message', (event) => {
      if (event.data.source != 'react-devtools-content-script') {
        console.log(event.data);
      }
    });

    window.parent.postMessage({ type: 'initialize' }, "*");
  }
}
