import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["room_name", "room_size", "room_class", "room_status", 
    "room_address", "room_city", "room_state", "room_zip", "room_country", 
    "room_price", "room_description", "room_smoke", "number_of_beds", "bed_size", 
    "room_picture", "room_phone"
  ];

  connect() {
    console.log("Connected to the share controller");
    console.log(this.data.get("urlValue"));
    console.log(this.resultTarget);
  }
  async share(e) {
    e.preventDefault();

    const shareData = {
      room_name: this.room_nameTargetContent, 
      room_size: this.room_sizeTargetContent, 
      room_class: this.room_classTargetContent, 
      room_status: this.room_statusTargetContent, 
      room_address: this.room_addressTargetContent, 
      room_city: this.room_cityTargetContent, 
      room_state: this.room_stateTargetContent, 
      room_zip: this.room_zipTargetContent, 
      room_country: this.room_countryTargetContent, 
      room_price: this.room_priceTargetContent, 
      room_description: this.room_descriptionTargetContent, 
      room_smoke: this.room_smokeTargetContent, 
      number_of_beds: this.number_of_bedsTargetContent,  
      room_picture: this.room_pictureTargetContent, 
      room_phone: this.room_phoneTargetContent,
      url: this.data.get("urlValue"),
    };
    try {
      await navigator.share(shareData);
      this.resultTarget.textContent = "Room shared successfully";
    } catch (err) {
      this.resultTarget.textContent = `Error: ${err}`;
    }
  }
}