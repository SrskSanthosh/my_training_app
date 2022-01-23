class TrainingModelResponse {
  List<TrainingList>? trainingList;

  TrainingModelResponse({this.trainingList});

  TrainingModelResponse.fromJson(Map<String, dynamic> json) {
    if (json['trainingList'] != null) {
      trainingList = <TrainingList>[];
      json['trainingList'].forEach((v) {
        trainingList!.add(TrainingList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (trainingList != null) {
      data['trainingList'] = trainingList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrainingList {
  String? id;
  String? courseDate;
  String? courseTime;
  String? location;
  String? courseTitle;
  String? courseAuthor;
  String? authorProfileImg;
  String? coursePromo;

  TrainingList(
      {this.id,
      this.courseDate,
      this.courseTime,
      this.location,
      this.courseTitle,
      this.courseAuthor,
      this.authorProfileImg,
      this.coursePromo});

  TrainingList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseDate = json['courseDate'];
    courseTime = json['courseTime'];
    location = json['location'];
    courseTitle = json['courseTitle'];
    courseAuthor = json['courseAuthor'];
    authorProfileImg = json['authorProfileImg'];
    coursePromo = json['coursePromo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['courseDate'] = courseDate;
    data['courseTime'] = courseTime;
    data['location'] = location;
    data['courseTitle'] = courseTitle;
    data['courseAuthor'] = courseAuthor;
    data['authorProfileImg'] = authorProfileImg;
    data['coursePromo'] = coursePromo;
    return data;
  }
}
