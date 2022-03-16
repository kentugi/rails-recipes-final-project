import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
import "select2";

export default class extends Controller {
  static values = {
    selected: Array,
    width: String
  }

  connect() {
     const selector = $(this.element).select2({
        width: this.widthValue,
        placeholder: "Type your ingredients here..."
       });

    if (this.selectedValue.length > 0) {
      selector.val(this.selectedValue)
      selector.trigger("change")
    }
  }
}
