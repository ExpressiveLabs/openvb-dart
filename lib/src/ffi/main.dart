@ffi.DefaultAsset('package:openvb_dart/openvb_dart_rs')
library rust;

import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart';

// Read encoded OpenVB file (*.bin pattern)
//[Rust interface]
@ffi.Native<ffi.Pointer<Utf8> Function(ffi.Pointer<Utf8>)>()
external ffi.Pointer<Utf8> _readEncoded(ffi.Pointer<Utf8> path);

// [Dart interface]
String? readEncoded({required String path}) {
  final pathPtr = path.toNativeUtf8();
  final result = _readEncoded(pathPtr);
  calloc.free(pathPtr);
  return result != ffi.nullptr ? result.toDartString() : null;
}


// Write encoded OpenVB file (*.bin pattern)
//[Rust interface]
@ffi.Native<ffi.Bool Function(ffi.Pointer<Utf8>, ffi.Pointer<Utf8>)>()
external bool _writeEncoded(ffi.Pointer<Utf8> path, ffi.Pointer<Utf8> content);

// [Dart interface]
bool writeEncoded({required String path, required String content}) {
  final pathPtr = path.toNativeUtf8();
  final contentPtr = content.toNativeUtf8();
  final result = _writeEncoded(pathPtr, contentPtr);
  calloc.free(pathPtr);
  calloc.free(contentPtr);

  return result;
}