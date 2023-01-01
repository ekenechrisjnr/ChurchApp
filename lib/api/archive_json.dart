// To parse this JSON data, do
//final archive = archiveFromJson(jsonString);
import 'dart:convert';

List<Archive> archiveFromJson(String str) =>
    List<Archive>.from(json.decode(str).map((x) => Archive.fromJson(x)));

String archiveToJson(List<Archive> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Archive {
  Archive({
    required this.id,
    required this.image,
    required this.vidtitle,
    required this.subtitle,
    required this.datetime,
    required this.vidlink,
  });

  String id;
  String image;
  String vidtitle;
  String subtitle;
  DateTime datetime;
  String vidlink;

  factory Archive.fromJson(Map<String, dynamic> json) => Archive(
        id: json["id"],
        vidtitle: json["vidtitle"],
        subtitle: json["subtitle"],
        image: json["image"],
        datetime: DateTime.parse(json["datetime"]),
        vidlink: json["vidlink"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "vidtitle": vidtitle,
        "subtitle": subtitle,
        "datetime": datetime.toIso8601String(),
        "vidlink": vidlink,
      };
}