import 'offer.dart';

class GetAllOffersResponseModel {
  GetAllOffersResponseModel({
    required this.offers,
    required this.firstPage,
    required this.hasNext,
    required this.hasPrev,
    required this.nextPage,
    required this.page,
    required this.prevPage,
    required this.totalCount,
  });

  List<Offer> offers;
  int firstPage;
  bool hasNext;
  bool hasPrev;
  int nextPage;
  int page;
  int prevPage;
  int totalCount;

  factory GetAllOffersResponseModel.fromJson(Map<String, dynamic> json) => GetAllOffersResponseModel(
    offers: List<Offer>.from(json["data"].map((x) => Offer.fromJson(x))),
    firstPage: json["first_page"],
    hasNext: json["has_next"],
    hasPrev: json["has_prev"],
    nextPage: json["next_page"],
    page: json["page"],
    prevPage: json["prev_page"],
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(offers.map((x) => x.toJson())),
    "first_page": firstPage,
    "has_next": hasNext,
    "has_prev": hasPrev,
    "next_page": nextPage,
    "page": page,
    "prev_page": prevPage,
    "total_count": totalCount,
  };
}