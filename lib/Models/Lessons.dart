import 'package:cloud_firestore/cloud_firestore.dart';

class LessonModel {
  String title;
  int sequence;
  String description;
  String videoUrl;
  String imageUrl;
  bool izTaken;
  LessonModel.getData(data) {
    this.title = data['title'];
    this.sequence = data['sequence'];
    this.description = data['description'];
    this.imageUrl = data['imageUrl'];
    this.videoUrl = data['url'];
  }
}
