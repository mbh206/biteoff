import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spinner"
export default class extends Controller {
  static targets = ["list"];


  startSpin() {



    const length = this.data.get("length");
    const winnerIndex = this.data.get("winner");
    const itemHeight = 50;
    const initialSpinDistance = (itemHeight * length) * 2;
    const spinDistance = -initialSpinDistance - (winnerIndex * itemHeight);


    // const addedSpinDistance = spinDistance - (winnerIndex * itemHeight) - 50



    this.listTarget.style.transition = "transform 3s ease-out";
    this.listTarget.style.transform = `translateY(${spinDistance}px)`;



    // setTimeout(() => {

    //   this.listTarget.style.transform = "translateY(0)";
    // }, 10000);
  }
}
