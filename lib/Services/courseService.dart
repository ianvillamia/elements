import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mynewapp/Models/CourseModel.dart';
import 'package:mynewapp/Models/Lessons.dart';
import 'package:mynewapp/Providers/courseProvider.dart';

class CourseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void subscribeToCourse(
      {@required String ref, @required String courseID}) async {
    await users
        .doc(ref)
        .collection('courses')
        .doc(courseID)
        .update({'subscribed': true});
  }

  void takeLesson(
      {@required String userRef,
      @required CourseModel course,
      @required int lessonNumber,
      @required CourseProvider courseProvider}) async {
    //get list
    int lessonLength = course.lessons.length;

    if (lessonNumber == lessonLength) {
      //dont update
      course.lessons[lessonNumber].izTaken = true;
      course.lessons[lessonNumber].izUpdated = true;
    } else {
      course.lessons[lessonNumber].izTaken = true;
      course.lessons[lessonNumber + 1].izUpdated = true;
    }
    //print(course.lessons[lessonNumber].izTaken);
    List tobeAdded = [];
    List<LessonModel> rebuild = [];
    course.lessons.forEach((lesson) {
      rebuild.add(lesson);
      tobeAdded.add(LessonModel.toMap(lesson: lesson));
    });

    print(userRef);
    print(course.ref);
    print('here potato');
    print(tobeAdded);
    try {
      await users
          .doc(userRef)
          .collection('courses')
          .doc(course.ref)
          .update({'lessons': tobeAdded}).then((value) {
        print('took lesson');
        courseProvider.updateLessons(lessons: rebuild);
      });
    } catch (e) {
      print('Error' + e.toString());
    }
  }

  void correctAnswer({
    @required String userRef,
    @required CourseModel course,
  }) async {
    await users.doc(userRef).collection('courses').doc(course.ref).update(
        {'score': FieldValue.increment(1)}).then((value) => print('wow'));
  }
}
