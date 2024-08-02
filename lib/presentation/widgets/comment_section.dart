import 'package:flutter/material.dart';
import '../../data/dtos/comment_get_dto.dart';
import 'package:intl/intl.dart';

class CommentSection extends StatelessWidget {
  final List<CommentGetDTO> comments;
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...comments.map((comment) => _buildComment(comment)).toList(),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: commentController,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment...',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: onAddComment,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComment(CommentGetDTO comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: comment.profileImage != null
                    ? NetworkImage(comment.profileImage!)
                    : const NetworkImage('https://via.placeholder.com/150'),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.nickName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(comment.createdAt),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            comment.content,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
