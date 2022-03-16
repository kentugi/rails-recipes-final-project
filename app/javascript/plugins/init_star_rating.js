import "jquery-bar-rating";

// app/javascript/plugins/init_star_rating.js
// import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {

  console.log($('#review_rating'))
    // Your code goes here
    $('#review_rating').barrating({
      theme: 'css-stars'
    });
  console.log("inside rating")
};

export { initStarRating };
