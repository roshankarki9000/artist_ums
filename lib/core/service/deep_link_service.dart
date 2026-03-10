import 'package:app_links/app_links.dart';
import 'dart:async';

class DeepLinkService {
  final AppLinks _appLinks;
  DeepLinkService(this._appLinks);

  StreamSubscription? _sub;

  void init(Function(Uri uri) onLinkReceived) {
    _sub = _appLinks.uriLinkStream.listen((uri) {
      onLinkReceived(uri);
    });
  }

  void dispose() {
    _sub?.cancel();
  }
}
