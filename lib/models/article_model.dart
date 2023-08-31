class ArticleModel {
  List<Articles>? articles;

  ArticleModel({this.articles});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  Articles({
    this.title,
    this.description,
    this.url,
    this.urlToImage,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;

    return data;
  }
}
