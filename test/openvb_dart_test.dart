import 'package:openvb/openvb.dart';
import 'package:test/test.dart';

void main() {
  Singer? singer;

  test('Load Singer from JSON', () {
    singer = Singer.fromFile("C:\\Users\\danie\\mikoto\\singer\\Sayaka FLIGHT ver\\singer.json");

    expect(singer, isNotNull);
    
    print("[Singer]");
    print("Meta: ${singer!.meta.toJson()}");
    print("Origin: ${singer!.origin.toJson()}");
    print("Language: ${singer!.language.toJson()}");
    print("Libraries: ${singer!.libraries.length}:");
    
    for(var library in singer!.libraries) {
      print("  ${library.name} (${library.files.length} files, ${library.utterances.length} utterances)");
    }
  });
}
