class Post {
  String? userId;
  String? title;
  String? imageUrl;

  Post({required this.userId, required this.title, required this.imageUrl});
  // https://another-light.tistory.com/77
  // factory => 새로운 인스턴스를 생성하지 않는 생성자 (싱글톤 패턴 => 하나의 인턴스만 생성해서 값을 공유[갱신]하는 느낌)
  // Json으로부터 객체를 만드는 생성자
  // Json은 Dart에서 Map<String, dynamic>과 동일한 형태(key, value)
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'imageUrl': imageUrl,
    };
  }
}
