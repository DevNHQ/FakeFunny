import 'dart:typed_data';

class MPost {
  int? id;
  late String? name;
  late String? status;
  late String? commentCount;
  late String? tag;
  late String? music;
  late Uint8List? imageFile;
  late int likesCount;
  late int sharesCount;

  MPost(
      {this.id,
      this.name,
      this.status,
      this.commentCount,
      this.tag,
      this.music,
      this.imageFile,
      this.likesCount = 0,
      this.sharesCount = 0});

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{
      "id": id,
      "name": name,
      "status": status,
      "commentCount": commentCount,
      "tag": tag,
      "music": music,
      "imageFile": imageFile,
      "likesCount": likesCount,
      "sharesCount": sharesCount,
    };
    return data;
  }

  MPost.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    status = data['status'];
    commentCount = data['commentCount'];
    tag = data['tag'];
    music = data['music'];
    imageFile = data['imageFile'];
    likesCount = data['likesCount'];
    sharesCount = data['sharesCount'];
  }
}
