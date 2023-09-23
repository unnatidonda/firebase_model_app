class NamesModel {
  String? name;
  int? age;
  String? profession;
  String? image;
  Details? details;

  NamesModel({this.name, this.age, this.profession, this.image, this.details});

  NamesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    profession = json['Profession'];
    image = json['image'];
    details = json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['Profession'] = this.profession;
    data['image'] = this.image;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  String? fathername;

  Details({this.fathername = "sdf"});

  Details.fromJson(Map<String, dynamic> json) {
    fathername = json['fathername'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fathername'] = this.fathername;
    return data;
  }
}
