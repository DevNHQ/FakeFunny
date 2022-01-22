import 'dart:typed_data';

class MUser {
  int? id;
  late String name;
  late Uint8List avatarFile;
  late int followed;
  late int following;
  late int countPost;

  MUser({
    this.id,
    required this.name,
    required this.avatarFile,
    this.followed = 0,
    this.following = 0,
    this.countPost = 0,
  });

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{
      "id": id,
      "avatarFile": avatarFile,
      "countPost": countPost,
      "name": name,
      "followed": followed,
      "following": following,
    };
    return data;
  }
  MUser.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    avatarFile = data['avatarFile'];
    countPost = data['countPost'];
    followed = data['followed'];
    following = data['following'];
  }
}
