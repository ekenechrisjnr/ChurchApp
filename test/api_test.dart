import 'package:dlcf_radio/api/api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  test(
    'fetchStream caches the response and avoids duplicate API calls',
    () async {
      int requestCount = 0;

      final mockClient = MockClient((request) async {
        requestCount++;
        return http.Response('''[
          {
            "topic": "Test Topic",
            "preacher": "Test Preacher",
            "service": "Test Service",
            "datetime": "2023-01-01T12:00:00Z",
            "url": "http://example.com/stream"
          }
          ]''', 200);
      });

      // Call 1: Should trigger a network request
      await fetchStream(client: mockClient);
      expect(requestCount, 1, reason: 'First call should hit the network');

      // Call 2: Should use cached data
      await fetchStream(client: mockClient);
      expect(
        requestCount,
        1,
        reason: 'Second call should use cache and not hit the network',
      );

      // Call 3: Even with a different client (though here we pass same), it should use cache
      await fetchStream();
      expect(requestCount, 1, reason: 'Third call should still use cache');
    },
  );
}
