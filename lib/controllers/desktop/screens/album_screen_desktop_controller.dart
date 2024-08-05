import 'package:backend_client_api/api.dart';
import 'package:get/get.dart';
import 'package:tlmc_player_app/services/impl/api_client_provider.dart';

class AlbumScreenDesktopState {
  final String albumId;
  final AlbumReadDto masterAlbum;
  final List<AlbumReadDto> albums;
  final List<TrackReadDto> tracks;

  AlbumScreenDesktopState({
    required this.albumId,
    required this.masterAlbum,
    required this.albums,
    required this.tracks,
  });
}

class AlbumScreenDesktopController extends GetxController
    with StateMixin<AlbumScreenDesktopState> {
  final String albumId;

  AlbumScreenDesktopController({required this.albumId});

  @override
  void onInit() {
    super.onInit();

    loadAlbum();
  }

  Future<AlbumScreenDesktopState> loadAlbumWithMultipleDiscs(
      AlbumReadDto knownAlbum) async {
    var albumApi = AlbumApi(Get.find<ApiClientProvider>().getApiClient());

    // if the known album is the master album, we need to load all the albums
    AlbumReadDto master;
    List<AlbumReadDto> child = [];

    if (knownAlbum.discNumber == 0) {
      // known album is the master album
      master = knownAlbum;
      for (var childAlbum in master.childAlbums!) {
        child.add(
          (await albumApi.getAlbum(childAlbum.id!))!,
        );
      }
    } else {
      // known album is a child album
      master = (await albumApi.getAlbum(knownAlbum.parentAlbum!.id!))!;

      // load all the child albums
      for (var childAlbumIncomplete in master.childAlbums!) {
        var childAlbum = await albumApi.getAlbum(childAlbumIncomplete.id!);
        child.add(
          childAlbum!,
        );
      }

      // master.childAlbums?.forEach((element) async {
      //   child.add((await albumApi.getAlbum(element.id!))!);
      // });
    }

    List<TrackReadDto> tracks = [];
    for (var element in child) {
      tracks.addAll(element.tracks!);
    }

    // Sort child albums by their disc number
    child.sort((a, b) => a.discNumber!.compareTo(b.discNumber!));

    return AlbumScreenDesktopState(
      albumId: albumId,
      masterAlbum: master,
      albums: child,
      tracks: tracks,
    );
  }

  Future<void> loadAlbum() async {
    var albumApi = AlbumApi(Get.find<ApiClientProvider>().getApiClient());

    AlbumReadDto? album;
    try {
      album = await albumApi.getAlbum(albumId);
      if (album == null) {
        change(null, status: RxStatus.error('Failed to load album'));
        return;
      }
    } catch (e) {
      change(null, status: RxStatus.error('Failed to load album, $e'));
      return;
    }

    AlbumScreenDesktopState states;
    if (album.numberOfDiscs! > 1) {
      try {
        states = await loadAlbumWithMultipleDiscs(album);
      } catch (e) {
        change(null, status: RxStatus.error('Failed to load album, $e'));
        return;
      }
    } else {
      // album only have one disc
      states = AlbumScreenDesktopState(
        albumId: albumId,
        masterAlbum: album,
        albums: [album],
        tracks: album.tracks!,
      );
    }

    // sort the tracks by their index
    states.tracks.sort((a, b) => a.index!.compareTo(b.index!));
    states.masterAlbum.tracks?.sort((a, b) => a.index!.compareTo(b.index!));
    for (var album in states.albums) {
      album.tracks?.sort((a, b) => a.index!.compareTo(b.index!));
    }

    change(states, status: RxStatus.success());
  }
}
