import 'package:BackendClientApi/api.dart';
import 'package:flutter/material.dart';

final class TrackOptions {
  List<ITrackOption> options;

  TrackOptions(this.options);
}

abstract class ITrackOption {
  final TrackReadDto _track;
  TrackReadDto get track => _track;

  final List<VoidCallback> callbacks = [];

  String get title;
  String get description;
  Icon get icon;

  ITrackOption(TrackReadDto track) : _track = track;

  Future execute();

  void addCallback(VoidCallback callback) {
    callbacks.add(callback);
  }
}
