class Product {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;
  final double price;
  final double rating;
  final int reviewsCount;
  final double discountPercentage;
  final List<String> categories;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    required this.price,
    required this.rating,
    required this.reviewsCount,
    required this.discountPercentage,
    required this.categories,
  });
}