import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CourseController extends GetxController {
  var courseList = <String>[].obs;
  var selectedCourseId = ''.obs;
  var selectedCourseName = ''.obs;
  var subCourseList = <String>[].obs;
  var lectureCourseList = <String>[].obs;
  var timeCourseList = <String>[].obs;
  var descriptionCourseList = <String>[].obs;
  var codeCourseList = <String>[].obs;
  RxList<String> filteredSubcourses = <String>[].obs;
  var selectedSubCourseId = ''.obs;
  RxBool isGridTapped = false.obs;
  var currentGridTappedIndex = Rx<int>(-1);
  final isConnected = true.obs;
  RxBool showAllCourses = false.obs;
  RxBool hasNewCourses = false.obs;
  RxList lectures = [].obs;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    fetchCourses();
    checkConnectivity();
    Connectivity().onConnectivityChanged.listen((result) {
      isConnected.value = (result != ConnectivityResult.none);
    });
  }                           
  Future<void> fetchCourses() async {
    try {
      print("Fetching courses..;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.");
      FirebaseFirestore firestoreelci = FirebaseFirestore.instanceFor(app: Firebase.app('elci'));
      final querySnapshot = await firestoreelci.collection('courses').get();
      courseList.clear(); // Use the class-level courseList instead of creating a new one.
      querySnapshot.docs.forEach((doc) {
        courseList.add(doc.id);
      });
      print('fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff$querySnapshot');
      print('fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff$courseList');
      print(courseList);
      if (courseList.isNotEmpty) {
        selectedCourseId.value = courseList[0];
        selectedCourseName.value = courseList[0];
        print('Courses from elci: $courseList');
      } else {
        print('No courses found in elci.');
      }
      await fetchSubCourses(selectedCourseId.value);
      print('object object object object objectobjectobjectobjectobjectobjectobjectobject${selectedCourseId.value}');
      update();
    } catch (e) {
      print('Error fetching courses from projectB: $e');
    }
  }
  Future<void> fetchSubCourses( String selectCourse) async {
    try {
      subCourseList.clear();
      FirebaseFirestore firestoreelci = FirebaseFirestore.instanceFor(app: Firebase.app('elci'));
      final subcollectionsSnapshot = await firestoreelci.collection('courses')
          .doc(selectCourse)
          .collection('subcourses')
          .get();
      for (final doc in subcollectionsSnapshot.docs) {
        final subCourseName = doc.id;
        subCourseList.add(subCourseName);
      }
      if (subCourseList.isNotEmpty) {
        selectedSubCourseId.value = subCourseList[0];
      }
      print('ffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaffffff$subCourseList');
      update();
    } catch (e) {
      print('Error fetching subcourses: $e');
    }
  }
  Future<List<String>> fetchLectures(String selectCourse, String selectedSubCourse) async {
    lectureCourseList.clear();
    try {
      final lecturecollectionsSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectCourse)
          .collection('subcourses')
          .doc(selectedSubCourse)
          .collection('lectures')
          .get();
      for (final doc in lecturecollectionsSnapshot.docs) {
        final lectureCourseName = doc.id;
        lectureCourseList.add(lectureCourseName);
      }
      update();
      return lectureCourseList;
    } catch (e) {
      print('Error fetching lectures: $e');
      return [];
    }
  }
  Future<List<String>> fetchTime(String selectCourse, String selectedSubCourse) async {
    timeCourseList.clear();
    try {
      final timecollectionsSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectCourse)
          .collection('subcourses')
          .doc(selectedSubCourse)
          .collection('time')
          .get();
      for (final doc in timecollectionsSnapshot.docs) {
        final timeCourseName = doc.id;
        timeCourseList.add(timeCourseName);
      }
      update();
      return timeCourseList;
    } catch (e) {
      print('Error fetching lectures: $e');
      return ['no Cnnx'];
    }
  }
  Future<List<String>> fetchDescription(String selectCourse, String selectedSubCourse) async {
    descriptionCourseList.clear();
    try {
      final descriptioncollectionsSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectCourse)
          .collection('subcourses')
          .doc(selectedSubCourse)
          .collection('description')
          .get();
      for (final doc in descriptioncollectionsSnapshot.docs) {
        final descCourseName = doc.id;
        descriptionCourseList.add(descCourseName);
      }
      update();
      return descriptionCourseList;
    } catch (e) {
      print('Error fetching lectures: $e');
      return ['no Cnnx'];
    }
  }
  Future<List<String>> fetchCode(String selectCourse, String selectedSubCourse) async {
    codeCourseList.clear();
    try {
      final codecollectionsSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectCourse)
          .collection('subcourses')
          .doc(selectedSubCourse)
          .collection('code')
          .get();
      for (final doc in codecollectionsSnapshot.docs) {
        final codeCourseName = doc.id;
        codeCourseList.add(codeCourseName);
      }
      update();
      return codeCourseList;
    } catch (e) {
      print('Error fetching lectures: $e');
      return ['no Cnnx'];
    }
  }
  void onCourseSelected(String? courseId) {
    if (courseId != null) {
      selectedCourseId.value = courseId;
      selectedCourseName.value = courseId;
      fetchSubCourses(selectedCourseId.value);
    }
  }
  void onSubCourseSelected(String? subCourseId) {
    if (subCourseId != null) {
      selectedSubCourseId.value = subCourseId;
      fetchLectures(selectedCourseId.value, selectedSubCourseId.value);
      print('subcourse selected: $subCourseId');
    }
  }
  void setGridTapped(bool value, int index) {
    isGridTapped.value = value;
    currentGridTappedIndex.value = index;
  }
  void resetGridTapped() {
    isGridTapped.value = false;
    currentGridTappedIndex.value = -1;
  }
  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    isConnected.value = (connectivityResult != ConnectivityResult.none);
  }
  void search(String keyword) {
    if (keyword.isEmpty) {
      filteredSubcourses.assignAll(courseList);
    } else {
      filteredSubcourses.assignAll(
        courseList.where((course) => course.toLowerCase().contains(keyword.toLowerCase())),
      );
    }
  }
  // Function to update a document in the "course" collection
  Future<void> updateCollectionId(String oldCollectionId, String newCollectionId) async {
    try {
      await Firebase.initializeApp();
      FirebaseFirestore firestoreelci = FirebaseFirestore.instanceFor(app: Firebase.app('elci'));

      // Remove any trailing spaces from the newCollectionId
      newCollectionId = newCollectionId.trim();

      CollectionReference oldCollectionRef = firestoreelci.collection('courses').doc(oldCollectionId).collection('subcourses');
      CollectionReference newCollectionRef = firestoreelci.collection('courses').doc(newCollectionId).collection('subcourses');

      print('Old Collection Reference: $oldCollectionRef');
      print('New Collection Reference: $newCollectionRef');

      // Step 1: Copy Data
      QuerySnapshot oldCollectionSnapshot = await oldCollectionRef.get();
      List<QueryDocumentSnapshot> oldDocs = oldCollectionSnapshot.docs;

      for (QueryDocumentSnapshot oldDocSnapshot in oldDocs) {
        Map<String, dynamic> data = oldDocSnapshot.data() as Map<String, dynamic>;

        // Get a reference to the new document
        DocumentReference newDocRef = newCollectionRef.doc(oldDocSnapshot.id);

        // Write data to the new document
        await newDocRef.set(data);
        print('Copied data for document ${oldDocSnapshot.id}');

        // Delete the old document
        await oldDocSnapshot.reference.delete();
        print('Deleted old document ${oldDocSnapshot.id}');
      }

      // Step 2: Delete Old Collection Reference
      await firestoreelci.collection('courses').doc(oldCollectionId).delete();
      print('Old Collection ${oldCollectionId} deleted successfully');

      // Fetch the updated courses and subcourses data
      await fetchCourses();
      await fetchSubCourses(selectedCourseId.value);

      print('Collection ID updated successfully');
    } catch (e) {
      print('Error updating collection ID: $e');
    }
  }
  // Function to delete a document from the "course" collection
  Future<void> deleteCourse(String courseId) async {
    try {
      await FirebaseFirestore.instance.collection('courses').doc(courseId).delete();
      print('Course deleted successfully');
    } catch (e) {
      print('Error deleting course: $e');
    }
  }
  Future<void> showUpdateDialog(BuildContext context, String courseName) async {
    TextEditingController newNameController = TextEditingController();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Course'),
          content: TextField(
            controller: newNameController,
            decoration: InputDecoration(labelText: 'New Course Name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                String newName = newNameController.text;
                if (newName.isNotEmpty) {
                  await updateCollectionId(courseName, newName);
                  Navigator.pop(context);
                }
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
  Future<void> showDeleteDialog(BuildContext context, String courseName) async {
    bool confirmDelete = false;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Course'),
          content: Text('Are you sure you want to delete the course?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                confirmDelete = true;
                if (confirmDelete) {
                  await deleteCourse(courseName);
                  Navigator.pop(context);
                }
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}