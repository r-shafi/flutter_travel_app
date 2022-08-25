class PlaceModel {
  final String name;
  final String img;
  final int price;
  final int people;
  final int stars;
  final String description;
  final String location;

  PlaceModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json['name'],
      img: json['img'],
      price: json['price'],
      people: json['people'],
      stars: json['stars'],
      description: json['description'],
      location: json['location'],
    );
  }
}
