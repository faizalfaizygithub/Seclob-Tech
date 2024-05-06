class PhotosModel {
  String? sts;
  String? msg;
  int? postCount;
  List<Media>? media;

  PhotosModel({this.sts, this.msg, this.postCount, this.media});

  PhotosModel.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    postCount = json['postCount'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sts'] = sts;
    data['msg'] = msg;
    data['postCount'] = postCount;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  String? sId;
  UserId? userId;
  String? fileType;
  String? fileName;
  String? filePath;
  String? description;
  List<String>? likedBy;
  int? likeCount;
  List<Null>? commentId;
  int? commentCount;
  bool? story;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Media(
      {this.sId,
      this.userId,
      this.fileType,
      this.fileName,
      this.filePath,
      this.description,
      this.likedBy,
      this.likeCount,
      this.commentId,
      this.commentCount,
      this.story,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Media.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    fileType = json['fileType'];
    fileName = json['fileName'];
    filePath = json['filePath'];
    description = json['description'];
    likedBy = json['likedBy'].cast<String>();
    likeCount = json['likeCount'];
    if (json['commentId'] != null) {
      commentId = <Null>[];
      json['commentId'].forEach((v) {
        // commentId!.add(new Null.fromJson(v));
      });
    }
    commentCount = json['commentCount'];
    story = json['story'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    if (userId != null) {
      data['userId'] = userId!.toJson();
    }
    data['fileType'] = fileType;
    data['fileName'] = fileName;
    data['filePath'] = filePath;
    data['description'] = description;
    data['likedBy'] = likedBy;
    data['likeCount'] = likeCount;
    if (commentId != null) {
      // data['commentId'] = commentId!.map((v) => v!.toJson()).toList();
    }
    data['commentCount'] = commentCount;
    data['story'] = story;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class UserId {
  String? sId;
  String? firstName;
  String? lastName;
  ProfilePic? profilePic;

  UserId({this.sId, this.firstName, this.lastName, this.profilePic});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profilePic = json['profilePic'] != null
        ? ProfilePic.fromJson(json['profilePic'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    if (profilePic != null) {
      data['profilePic'] = profilePic!.toJson();
    }
    return data;
  }
}

class ProfilePic {
  String? sId;
  String? filePath;

  ProfilePic({this.sId, this.filePath});

  ProfilePic.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    filePath = json['filePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['filePath'] = filePath;
    return data;
  }
}
