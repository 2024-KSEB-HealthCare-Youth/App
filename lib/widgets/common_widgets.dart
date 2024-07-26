import 'package:flutter/material.dart';

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

Widget buildCreatePostSection(VoidCallback onTap) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          radius: 25,
        ),
        const SizedBox(width: 10),
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

Widget buildPostDetail(Map<String, dynamic> post) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          radius: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                post['date'],
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                post['comment'],
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
                post['likes'] > 0
                    ? Icons.thumb_up
                    : Icons.thumb_up_alt_outlined,
                color: post['likes'] > 0 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {},
            ),
            Text(post['likes'].toString()),
          ],
        ),
      ],
    ),
  );
}
