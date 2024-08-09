// common_widgets.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/post_data.dart';
import '../../data/models/user_data.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Pacifico',
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    foregroundColor: Colors.black,
  );
}

Widget buildCreatePostSection(VoidCallback onTap, UserData user) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              user.profileImage ?? 'https://via.placeholder.com/150'),
          radius: 25,
        ),
        const SizedBox(width: 10),
        Text(
          user.nickName ?? 'dummy',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 100, // Set the width as needed
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200], // Change background color
                  foregroundColor: Colors.black54, // Change text color
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0), // Reduce padding
                  textStyle: const TextStyle(fontSize: 14), // Reduce font size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  '글 작성하기',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildPostDetail(
    PostData post, bool isLiked, VoidCallback onLikePressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                post.nickName,
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
              const SizedBox(height: 5),
              Text(
                post.content,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            IconButton(
              icon: Icon(
                isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                color: isLiked ? Colors.blue : Colors.grey,
              ),
              onPressed: onLikePressed,
            ),
            Text(post.likeCount.toString()),
          ],
        ),
      ],
    ),
  );
}
