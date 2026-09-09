class DestinationsModel {
  String title;
  String location;
  String image;
  String detailImage;
  String description;
  String fullDescription;
  double rating;
double price;
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

  factory DestinationsModel.fromJson(Map<String, dynamic> json) {
    return DestinationsModel(
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      image: json['image'] ?? '',
      detailImage: json['detail_image'] ?? '',
      description: json['description'] ?? '',
      fullDescription: json['full_description'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
price: (json['price'] as num?)?.toDouble() ?? 0.0,
      enabled: json['enabled'] ?? false,

      highlights: json['highlights'] != null
          ? List<Map<String, String>>.from(
              (json['highlights'] as List).map(
                (highlight) => Map<String, String>.from(highlight),
              ),
            )
          : [],
    );
  }
}

