import 'package:get/get.dart';

extension GetXExtension on GetInterface {
  S getOrPut<S>(S dependency,
      {String? tag,
      bool permanent = false,
      InstanceBuilderCallback<S>? builder}) {
    if (isRegistered<S>(tag: tag)) {
      return find<S>(tag: tag);
    } else {
      return put<S>(dependency, tag: tag, permanent: permanent);
    }
  }
}
