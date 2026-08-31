class DestinationsModel {
  String title;
  String location;
  String image;
  String detailImage;
  String description;
  String fullDescription;
  String rating;
  String price;
  bool enabled;
  List<Map<String, String>> highlights;

  DestinationsModel({
    required this.title,
    required this.location,
    required this.image,
    required this.detailImage,
    required this.description,
    required this.fullDescription,
    required this.rating,
    required this.price,
    required this.enabled,
    required this.highlights,
  });

  factory DestinationsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return DestinationsModel(
      title: json['title'],
      location: json['location'],
      image: json['image'],
      detailImage: json['detailImage'],
      description: json['description'],
      fullDescription: json['fullDescription'],
      rating: json['rating'],
      price: json['price'],
      enabled: json['enabled'],
      highlights: List<Map<String, String>>.from(
        json['highlights'].map(
          (highlight) =>
              Map<String, String>.from(highlight),
        ),
      ),
    );
  }
}

