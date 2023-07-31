//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library Backend.ClientApi;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/album_api.dart';
part 'api/asset_api.dart';
part 'api/circle_api.dart';
part 'api/hls_asset_api.dart';
part 'api/internal_api.dart';
part 'api/original_album_api.dart';
part 'api/playlist_api.dart';
part 'api/playlist_item_api.dart';
part 'api/radio_api.dart';
part 'api/search_api.dart';

part 'model/album_read_dto.dart';
part 'model/album_read_dto1.dart';
part 'model/album_write_dto.dart';
part 'model/asset.dart';
part 'model/asset_read_dto.dart';
part 'model/circle_read_dto.dart';
part 'model/circle_read_dto1.dart';
part 'model/circle_status.dart';
part 'model/circle_status1.dart';
part 'model/circle_website_read_dto.dart';
part 'model/circle_write_dto.dart';
part 'model/hls_playlist_type.dart';
part 'model/hls_playlist_write_dto.dart';
part 'model/hls_segment_write_dto.dart';
part 'model/localized_field.dart';
part 'model/localized_field1.dart';
part 'model/operation.dart';
part 'model/original_album_read_dto.dart';
part 'model/original_album_read_dto1.dart';
part 'model/original_album_read_dto_action_result.dart';
part 'model/original_album_write_dto.dart';
part 'model/original_track_read_dto.dart';
part 'model/original_track_read_dto_action_result.dart';
part 'model/original_track_write_dto.dart';
part 'model/playlist_create_request.dart';
part 'model/playlist_item_add_request.dart';
part 'model/playlist_item_delete_request.dart';
part 'model/playlist_item_read_dto.dart';
part 'model/playlist_read_dto.dart';
part 'model/playlist_type.dart';
part 'model/playlist_visibility.dart';
part 'model/problem_details.dart';
part 'model/radio_song.dart';
part 'model/thumbnail_read_dto.dart';
part 'model/time_span.dart';
part 'model/track_get_multiple_resp.dart';
part 'model/track_read_dto.dart';
part 'model/track_read_dto1.dart';
part 'model/track_update_dto.dart';
part 'model/track_write_dto.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
