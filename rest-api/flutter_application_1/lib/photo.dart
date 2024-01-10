class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbenailUrl;

  Photo({required this.albumId, required this.id, required this.title, required this.url, required this.thumbenailUrl});

  Photo.fromJson(Map<String, dynamic> json)
       : albumId = json['albumId'],
         id = json['id'],
         title = json['title'],
         url = json['url'],
         thumbenailUrl = json['thumbenaiUrl'];

  Map<String, dynamic> toJson(){
    return {
      'albumId' : id,
      'id' : id,
      'title' : title,
      'url' : url,
      'thumbenaiUrl' : thumbenailUrl,
    };
  }       
}