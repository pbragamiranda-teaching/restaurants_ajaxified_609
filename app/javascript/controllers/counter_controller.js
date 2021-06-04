import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "count" ]

  connect() {
    // console.log(this.countTarget);
    setInterval(this.refresh, 5000);
  }


  refresh = () => {
    console.log('5 seconds have passed')
    fetch('/restaurants', { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        this.countTarget.innerText = data.restaurants.length;
      });
  }
}
