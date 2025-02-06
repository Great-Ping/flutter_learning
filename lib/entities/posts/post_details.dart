
class PostDetails {
  const PostDetails({
    required this.id,
    required this.name,
    required this.description,
  });

  final int id;
  final String name;
  final String description;


  factory PostDetails.fromJson(
      Map<String, dynamic> json
  ) {
    return PostDetails(
        id: json["id"] as int,
        name: json["title"] as String,
        description: json["body"] as String
    );
  }

}
