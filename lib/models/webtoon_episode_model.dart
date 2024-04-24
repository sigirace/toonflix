class WebtoonEpisodeModel {
  final String id, title, rating, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = _decodeHtmlEntities(json['title']),
        rating = json['rating'],
        date = json['date'];

  static String _decodeHtmlEntities(String input) {
    return input.replaceAll('&lt;', '').replaceAll('&gt;', '');
  }
}
