import 'package:flutter/material.dart';
import 'package:myapp/data/dtos/onePostdetail_dto.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../services/like_service.dart';

class PostDetailHeader extends StatelessWidget {
  final OnepostdetailDTO post;
  final VoidCallback onLikePressed;

  const PostDetailHeader({
    Key? key,
    required this.post,
    required this.onLikePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    post.profileImage ?? 'https://via.placeholder.com/150'),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.nickName ?? 'dummy',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(post.createdAt),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Provider.of<LikeService>(context).isPostLiked(post.postId)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Provider.of<LikeService>(context)
                              .isPostLiked(post.postId)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: onLikePressed,
                  ),
                  Text(
                    '${post.likeCount}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            post.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 8.0,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                post.content,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
