// To parse this JSON data, do
//
//     final searchResult = searchResultFromJson(jsonString);

import 'dart:convert';

SearchResult searchResultFromJson(String str) => SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
  SearchResult({
    this.status,
    this.total,
    this.data,
  });

  bool status;
  int total;
  List<Datum> data;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
    status: json["status"],
    total: json["total"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total": total,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.villagename,
    this.factoryname,
    this.title,
    this.subtype,
    this.type,
    this.icon,
    this.description,
    this.image,
    this.pdf,
    this.videoUrl,
    this.date,
  });

  int id;
  String villagename;
  String factoryname;
  String title;
  String subtype;
  String type;
  String icon;
  String description;
  String image;
  String pdf;
  dynamic videoUrl;
  String date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    villagename: json["villagename"],
    factoryname: json["factoryname"],
    title: json["title"],
    subtype: json["subtype"],
    type: json["type"],
    icon: json["icon"],
    description: json["description"],
    image: json["image"],
    pdf: json["pdf"],
    videoUrl: json["video_url"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "villagename": villagename,
    "factoryname": factoryname,
    "title": title,
    "subtype": subtype,
    "type": type,
    "icon": icon,
    "description": description,
    "image": image,
    "pdf": pdf,
    "video_url": videoUrl,
    "date": date,
  };
}
