import 'package:flutter/material.dart';
import 'package:myapp/data/dtos/post_get_dto.dart';

class PostCard extends StatelessWidget {
  final PostGetDTO post;
  final bool isLiked;
  final VoidCallback onLikePressed;
  final VoidCallback onTap;

  const PostCard({
    Key? key,
    required this.post,
    required this.isLiked,
    required this.onLikePressed,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        post.profileImage ?? 'https://via.placeholder.com/150'),
                    radius: 20,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.nickName ?? 'dummy',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${post.createdAt.day}/${post.createdAt.month}/${post.createdAt.year}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null,
                    ),
                    onPressed: onLikePressed,
                  ),
                  Text('${post.likeCount ?? '0'} likes'),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
