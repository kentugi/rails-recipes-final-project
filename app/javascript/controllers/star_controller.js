import "jquery-bar-rating";
import $ from "jquery"
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    $('#review_rating').barrating({
      theme: 'css-stars'
    });
  }
}
