import 'package:dlcf_radio/api/archive_json.dart';
import 'package:dlcf_radio/api/streaming_json.dart';
import 'package:http/http.dart' as uri;

Future<List<Archive>> fetchArchive() async {
  String url = "https://combinatorial-pumps.000webhost.com/app_config.php";
  final result = await uri.get(Uri.parse(url));
  return archiveFromJson(result.body);
}

Future <List<Streaming>>fetchStream() async {
  String url = "https://combinatorial-pumps.000webhost.com/app_config.php";
  final result = await uri.get(Uri.parse(url));
  return streamingFromJson(result.body);
}
