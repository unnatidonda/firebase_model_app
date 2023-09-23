class ThirdToDoModel {
  String? price;
  String? mapImage;
  String? time;
  String? place;

  String? image;

  ThirdToDoModel({
    this.time,
    this.place,
    this.mapImage,
    this.price,
    this.image,
  });

  ThirdToDoModel.fromJson(Map<String, dynamic> json) {
    price = json["price"];
    place = json["place"];
    mapImage = json["mapImage"];
    time = json["time"];
    image = json['image'];
  }
}
