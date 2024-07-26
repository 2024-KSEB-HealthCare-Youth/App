class PostService {
  static List<Map<String, dynamic>> getInitialPosts() {
    return [
      {
        'name': 'Alyce Lambo',
        'date': '25/06/2020',
        'comment':
            'Really convenient and the points system helps benefit loyalty. Some mild glitches here and there, but nothing too egregious. Obviously needs to roll out to more remote',
        'likes': 10,
        'comments': [
          {
            'name': 'Brian C',
            'date': '25/06/2020',
            'comment': 'Great post!',
            'likes': 5
          }
        ],
      },
      // Additional posts...
    ];
  }
}
