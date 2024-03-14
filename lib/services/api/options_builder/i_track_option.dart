import 'package:flutter/material.dart';

final class TrackOptions {
  List<ITrackOption> options;

  TrackOptions(this.options);
}

abstract class ITrackOption {
  final String _trackId;
  String get trackId => _trackId;

  final List<VoidCallback> callbacks = [];

  String get title;
  String get description;
  Icon get icon;

  ITrackOption(String trackId) : _trackId = trackId;

  Future execute();

  void addCallback(VoidCallback callback) {
    callbacks.add(callback);
  }
}
