class License {         //License class with its unique id and user input with to json method to display the values returned from database.
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