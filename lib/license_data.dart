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

  

}