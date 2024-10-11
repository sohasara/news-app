class Article {
  final String source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: map['source']['name'] as String,
      author: map['author'] as String? ?? 'Unknown Author',
      title: map['title'] as String,
      description: map['description'] as String? ?? 'No description available',
      url: map['url'] as String,
      urlToImage:
          map['urlToImage'] as String? ?? '', // Set default empty string
      publishedAt: DateTime.parse(map['publishedAt'] as String),
      content: map['content'] as String? ?? '',
    );
  }
}

/////////////////////////////
///
class NewsRes {
  final List<Article> articles;

  NewsRes({
    required this.articles,
  });

  factory NewsRes.fromMap(Map<String, dynamic> map) {
    var list = map['articles'] as List;
    List<Article> articlesList = list.map((i) => Article.fromMap(i)).toList();
    return NewsRes(articles: articlesList);
  }
}
