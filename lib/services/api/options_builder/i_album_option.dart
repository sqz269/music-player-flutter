import 'package:flutter/material.dart';

final class AlbumOptions {
  List<IAlbumOption> options;

  AlbumOptions(this.options);
}

abstract class IAlbumOption {
  final String _albumId;
  String get albumId => _albumId;

  final List<VoidCallback> callbacks = [];

  String get title;
  String get description;
  Icon get icon;

  IAlbumOption(String albumId) : _albumId = albumId;

  Future execute();

  void addCallback(VoidCallback callback) {
    callbacks.add(callback);
  }
}
