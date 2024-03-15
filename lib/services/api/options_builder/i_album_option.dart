import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';

final class AlbumOptions {
  List<IAlbumOption> options;

  AlbumOptions(this.options);
}

abstract class IAlbumOption {
  final AlbumReadDto _album;
  AlbumReadDto get album => _album;

  final List<VoidCallback> callbacks = [];

  String get title;
  String get description;
  Icon get icon;

  IAlbumOption(AlbumReadDto album) : _album = album;

  Future execute();

  void addCallback(VoidCallback callback) {
    callbacks.add(callback);
  }
}
