class TodoModelData {
  String? price;
  String? itemname;
  // Color? color;
  String? image;

  TodoModelData({
    this.price,
    this.itemname,
    this.image,
    // this.color,
  });

  TodoModelData.fromJson(Map<String, dynamic> json) {
    price = json["price"];
    itemname = json["itemname"];
    // color = json["color"];
    image = json['image'];
  }
}
