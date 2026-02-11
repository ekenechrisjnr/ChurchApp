import 'package:dlcf_radio/api/archive_json.dart';
import 'package:dlcf_radio/api/streaming_json.dart';
import 'package:http/http.dart' as uri;

Future<List<Archive>> fetchArchive() async {
  String url = "https://combinatorial-pumps.000webhost.com/app_config.php";
  final result = await uri.get(Uri.parse(url));
  return archiveFromJson(result.body);
}

List<Streaming>? _streamCache;

Future <List<Streaming>>fetchStream({uri.Client? client}) async {
  if (_streamCache != null) {
    return _streamCache!;
  }

  String url = "https://combinatorial-pumps.000webhost.com/app_config.php";
  final httpClient = client ?? uri.Client();
  try {
    final result = await httpClient.get(Uri.parse(url));
    if (result.statusCode == 200) {
      _streamCache = streamingFromJson(result.body);
      return _streamCache!;
    } else {
      throw Exception('Failed to load stream');
    }
  } finally {
    if (client == null) {
      httpClient.close();
    }
  }
}
