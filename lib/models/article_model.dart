class Article {
  final String title;
  final String summary;
  final String publishedDate;
  final String source;
  final String url;
  final String imageUrl;

  Article({
    required this.title,
    required this.summary,
    required this.publishedDate,
    required this.source,
    required this.url,
    required this.imageUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      summary: json['summary'],
      publishedDate: json['published_at'],
      source: json['news_site'],
      url: json['url'],
      imageUrl: json['image_url'] ?? '',
    );
  }
}
