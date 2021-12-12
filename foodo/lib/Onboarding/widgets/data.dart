class Items {
  final String title;
  final String description;
  final String imageurl;

  Items(this.description, this.imageurl,this.title);
}

List<Items> data_list = [
  
  Items("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "assets/images/cook.png","Clean and hygenic food"),
  Items("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 'assets/images/delivery.png',"Fastest delivery on time"),
  Items("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "assets/images/offer.png","Hight discount Sale "),
];
