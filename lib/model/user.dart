import 'dart:typed_data';

class MUser {
  int? id;
  late String? name;
  late String? idName;
  late Uint8List? avatarFile;
  late int follower;
  late int following;
  late int totalLike;

  MUser({
    this.id,
    this.name,
    this.idName,
    this.avatarFile,
    this.follower = 0,
    this.following = 0,
    this.totalLike = 0,
  });

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{
      "id": id,
      "name": name,
      "idName": idName,
      "avatarFile": avatarFile,
      "follower": follower,
      "following": following,
      "totalLike": totalLike,
    };
    return data;
  }
  MUser.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    idName = data['idName'];
    avatarFile = data['avatarFile'];
    totalLike = data['totalLike'];
    follower = data['follower'];
    following = data['following'];
  }
}
