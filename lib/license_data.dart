class License {
  String id;
  final String license;

  License({
    this.id=' ',
    required this.license,
  });

  Map <String, dynamic> toJson() =>  {
    'id':id,
    'license':license,
  };

  static License fromJson (Map<String, dynamic> json) => License(
    license: json['license'],
  );
  
}