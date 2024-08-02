import 'package:flutter/material.dart';
import '../../data/dtos/comment_dto.dart';

class CommentSection extends StatelessWidget {
  final List<CommentDTO> comments;
  final TextEditingController commentController;
  final VoidCallback onAddComment;

  const CommentSection({
    Key? key,
    required this.comments,
    required this.commentController,
    required this.onAddComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var comment in comments)
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(comment.profileImage),
            ),
            title: Text(comment.nickName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment.content),
              ],
            ),
          ),
        TextField(
          controller: commentController,
          decoration: InputDecoration(
            labelText: 'Add a comment',
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: onAddComment,
            ),
          ),
        ),
      ],
    );
  }
}
