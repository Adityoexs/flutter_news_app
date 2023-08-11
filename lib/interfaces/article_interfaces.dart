class ArticleInterface {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  ArticleInterface(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.content});
}
