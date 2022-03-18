// class Space {
//   int? id;
//   String? name, imageUrl, price, city, country;
//   int? rating;
//   String? address, font, phone, mapUrl;
//   List? photos;
//   int? numberOfKitchens, numberOfBedrroms, numberOfCupboards;

//   Space({
//     this.id,
//     this.name,
//     this.imageUrl,
//     this.price,
//     this.country,
//     this.city,
//     this.rating,
//     this.address,
//     this.mapUrl,
//     this.phone,
//     this.font,
//     this.photos,
//     this.numberOfBedrroms,
//     this.numberOfCupboards,
//     this.numberOfKitchens,
//   });

// }
class Space {
  int? id;
  String? name;
  String? city;
  String? country;
  int? price;
  String? imageUrl;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List<String>? photos;
  int? numberOfKitchens;
  int? numberOfBedrooms;
  int? numberOfCupboards;

  Space(
      {this.id,
      this.name,
      this.city,
      this.country,
      this.price,
      this.imageUrl,
      this.rating,
      this.address,
      this.phone,
      this.mapUrl,
      this.photos,
      this.numberOfKitchens,
      this.numberOfBedrooms,
      this.numberOfCupboards});

  Space.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    price = json['price'];
    imageUrl = json['image_url'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'].cast<String>();
    numberOfKitchens = json['number_of_kitchens'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['country'] = this.country;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    data['rating'] = this.rating;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['map_url'] = this.mapUrl;
    data['photos'] = this.photos;
    data['number_of_kitchens'] = this.numberOfKitchens;
    data['number_of_bedrooms'] = this.numberOfBedrooms;
    data['number_of_cupboards'] = this.numberOfCupboards;
    return data;
  }
}
