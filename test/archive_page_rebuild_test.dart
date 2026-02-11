import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dlcf_radio/pages/archive_page.dart';
import 'package:dlcf_radio/api/archive_json.dart';

void main() {
  testWidgets('fetchArchive is called on every rebuild', (WidgetTester tester) async {
    int callCount = 0;
    Future<List<Archive>> mockFetch() async {
      callCount++;
      return [];
    }

    // We use a ValueNotifier to trigger rebuilds
    final ValueNotifier<int> rebuildNotifier = ValueNotifier(0);

    await tester.pumpWidget(
      MaterialApp(
        home: ValueListenableBuilder<int>(
          valueListenable: rebuildNotifier,
          builder: (context, value, child) {
            return ArchivePage(
              fetchArchive: mockFetch,
            );
          },
        ),
      ),
    );

    // Initial build
    expect(callCount, 1, reason: 'Should be called once on first build');

    // Trigger a rebuild
    rebuildNotifier.value++;
    await tester.pump();

    // With the fix, build() is called again, but the future is cached.
    // We expect callCount to be 1.
    expect(callCount, 1, reason: 'Should NOT be called again on rebuild');
  });
}
