class FarmLocationsResponseModel {
  FarmLocationsResponseModel({
    required this.data,
    required this.firstPage,
    required this.hasNext,
    required this.hasPrev,
    required this.nextPage,
    required this.page,
    required this.prevPage,
    required this.totalCount,
  });

  List<Datum> data;
  int firstPage;
  bool hasNext;
  bool hasPrev;
  int nextPage;
  int page;
  int prevPage;
  int totalCount;

  factory FarmLocationsResponseModel.fromJson(Map<String, dynamic> json) => FarmLocationsResponseModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPage: json["first_page"],
    hasNext: json["has_next"],
    hasPrev: json["has_prev"],
    nextPage: json["next_page"],
    page: json["page"],
    prevPage: json["prev_page"],
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page": firstPage,
    "has_next": hasNext,
    "has_prev": hasPrev,
    "next_page": nextPage,
    "page": page,
    "prev_page": prevPage,
    "total_count": totalCount,
  };
}

class Datum {
  Datum({
    required this.address,
    required this.city,
    required this.continent,
    required this.country,
    required this.id,
    required this.insertedAt,
    required this.lat,
    required this.lng,
    required this.province,
    required this.region,
    required this.state,
    required this.updatedAt,
    required this.userId,
  });

  String address;
  String city;
  String continent;
  String country;
  int id;
  DateTime insertedAt;
  String lat;
  String lng;
  String province;
  dynamic region;
  String state;
  DateTime updatedAt;
  int userId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    address: json["address"],
    city: json["city"],
    continent: json["continent"],
    country: json["country"],
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    lat: json["lat"],
    lng: json["lng"],
    province: json["province"],
    region: json["region"],
    state: json["state"],
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "city": city,
    "continent": continent,
    "country": country,
    "id": id,
    "inserted_at": insertedAt.toIso8601String(),
    "lat": lat,
    "lng": lng,
    "province": province,
    "region": region,
    "state": state,
    "updated_at": updatedAt.toIso8601String(),
    "user_id": userId,
  };
}