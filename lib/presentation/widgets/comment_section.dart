import 'package:flutter/material.dart';
import '../../data/models/comment_data.dart';

class CommentSection extends StatelessWidget {
  final List<CommentData> comments;
  final Set<int> likedComments;
  final TextEditingController commentController;
  final void Function(int) onToggleLikeComment;
  final VoidCallback onAddComment;

  const CommentSection({
    Key? key,
    required this.comments,
    required this.likedComments,
    required this.commentController,
    required this.onToggleLikeComment,
    required this.onAddComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(comment.commentImage),
                      radius: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            comment.date,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(comment.comment),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            likedComments.contains(index)
                                ? Icons.thumb_up
                                : Icons.thumb_up_alt_outlined,
                            color: likedComments.contains(index)
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          onPressed: () => onToggleLikeComment(index),
                        ),
                        Text(comment.likes.toString()),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  labelText: '댓글을 입력하세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: onAddComment,
            ),
          ],
        ),
      ],
    );
  }
}
