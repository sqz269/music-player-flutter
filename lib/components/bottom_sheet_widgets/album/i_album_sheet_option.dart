import 'package:flutter/cupertino.dart';

abstract class IAlbumBotSheetOption extends StatelessWidget {
  const IAlbumBotSheetOption({super.key});

  void addCallback(VoidCallback callback);
}
