import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  static values = {
    icon: String,
    title: String,
    html: String,
    confirmButtonText: String,
    showCancelButton: Boolean,
    cancelButtonText: String
  }
  connect(){
  console.log(this.titleValue);

  }

  initSweetalert(event) {

    console.log("hi");

    event.preventDefault(); // Prevent the form to be submited after the submit button has been clicked

    Swal.fire({
      icon: this.iconValue,
      title: this.titleValue,
      html: this.htmlValue,
      confirmButtonText: this.confirmButtonTextValue,
      showCancelButton: this.showCancelButtonValue,
      cancelButtonText: this.cancelButtonTextValue,
      reverseButtons: false
    }).then((action) => {
      if (action.isConfirmed) {
        event.target[event.type](); // "submit"
      }
    })
    .catch(event.preventDefault())
  }
}
