import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spinner"
export default class extends Controller {
  static targets = ["list"];


  startSpin() {
    console.log(this.data.get("winner"));


    const winnerIndex = this.data.get("winner");
    const itemHeight = 50;
    const spinDistance = (-(winnerIndex * itemHeight));


    this.listTarget.style.transition = "transform 3s ease-out";
    this.listTarget.style.transform = `translateY(${spinDistance}px)`;



    // setTimeout(() => {

    //   this.listTarget.style.transform = "translateY(0)";
    // }, 10000);
  }
}
