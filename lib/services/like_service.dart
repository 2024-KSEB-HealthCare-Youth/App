import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/rest_api.dart';

class LikeService extends ChangeNotifier {
  final Set<int> _likedPosts = {};
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<void> toggleLike(int postId, int currentLikeCount) async {
    if (_likedPosts.contains(postId)) {
      _likedPosts.remove(postId);
      await RestAPI.updateLikeStatus(postId); // DELETE request
    } else {
      _likedPosts.add(postId);
      await RestAPI.updateLikeStatus(postId); // PUT request
    }
    notifyListeners();
  }

  bool isPostLiked(int postId) {
    return _likedPosts.contains(postId);
  }
}
