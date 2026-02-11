import 'dart:convert';

List<Streaming> streamingFromJson(String str) =>
    List<Streaming>.from(json.decode(str).map((x) => Streaming.fromJson(x)));

String streamingToJson(List<Streaming> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Streaming {
  Streaming({
    required this.topic,
    required this.preacher,
    required this.service,
    required this.datetime,
    required this.url,
  });

  String topic;
  String preacher;
  String service;
  DateTime datetime;
  String url;

  factory Streaming.fromJson(Map<String, dynamic> json) => Streaming(
        topic: json["topic"],
        preacher: json["preacher"],
        service: json["service"],
        datetime: DateTime.parse(json["datetime"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "topic": topic,
        "preacher": preacher,
        "service": service,
        "datetime": datetime.toIso8601String(),
        "url": url,
      };
}
