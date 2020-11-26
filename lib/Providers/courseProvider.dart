import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:mynewapp/Models/CourseModel.dart';

class CourseProvider extends ChangeNotifier {
  CourseModel currentCourse;
  DocumentSnapshot currentCourseDoc;
  setCurrentCourse({@required CourseModel courseModel}) {
    this.currentCourse = courseModel;
    notifyListeners();
  }

  updateLessons({@required lessons}) {
    this.currentCourse.lessons = lessons;
    notifyListeners();
  }

  setCourseDoc({@required DocumentSnapshot currentCourseDoc}) {
    this.currentCourseDoc = currentCourseDoc;
    notifyListeners();
  }
}
