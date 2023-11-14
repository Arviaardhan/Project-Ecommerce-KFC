class Voucher {
  final int id;
  final String name;
  final String image;
  final String limit;

  Voucher({
    required this.id,
    required this.name,
    required this.image,
    required this.limit,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      limit: json['limit'],
    );
  }
}
