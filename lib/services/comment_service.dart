import '../data/dtos/comment_dto.dart';
import '../utils/rest_api.dart';

class CommentService {
  Future<void> addComment(int postId, CommentDTO newComment) async {
    await RestAPI.addCommentToPost(postId, newComment);
  }
}
