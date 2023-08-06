import 'package:elearning/views/screens/add_course_screen.dart';
import 'package:elearning/views/screens/subCourse_screeen.dart';
import 'package:elearning/views/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/course_controller.dart';
import '../../presenter/controllers/home_controller.dart';
import '../widgets/color.dart';
import '../widgets/my_custom_button.dart';
import '../widgets/my_custom_container.dart';
class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final CourseController courseController = Get.put(CourseController());
  @override
  Widget build(BuildContext context) {
    print('Course List Length: ${courseController.courseList.length}');
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              homeController.showLogoutConfirmationDialog(context);
            },
            icon: const Icon(
              Icons.login_outlined,
              color: buttonColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCustomTextWidget(index: 1, text: 'Welcome, Hamdi Chrif'),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onPressed: () => homeController.toggleContainer1(),
                  buttonwidth: 150.0,
                  text: 'Add',
                  primary: buttonColor,
                  onPrimary: Colors.white,
                  sideColor: buttonColor,
                  icon: Icons.add_circle_outline,
                ),
                const SizedBox(width: 20),
                CustomButton(
                  onPressed: () => homeController.toggleContainer2(),
                  buttonwidth: 150.0,
                  text: 'Courses',
                  primary: primaryColor,
                  onPrimary: Colors.white,
                  sideColor: primaryColor,
                  icon: Icons.book,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.08),
            Expanded(
              child: Obx(
                () => Stack(
                  children: [
                    // Container 2
                    if (homeController.showContainer2.isTrue)
                      ListView.builder(
                        itemCount: courseController.courseList.length,
                        itemBuilder: (context, index) {
                          String courseName = courseController.courseList[index];
                          return Dismissible(
                            key: Key(courseName), // Unique key for each item
                            direction: DismissDirection.horizontal, // Set the swipe direction
                            background: Container(
                              color: Colors.red, // Background color when swiping to delete
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    SizedBox(width: 20),
                                    Icon(Icons.delete, color: Colors.white),
                                    SizedBox(width: 10),
                                    Text("Delete", style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            secondaryBackground: Container(
                              color: primaryColor, // Background color when swiping to modify
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(Icons.edit, color: Colors.white),
                                    SizedBox(width: 10),
                                    Text("Modify", style: TextStyle(color: Colors.white)),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                // Delete operation
                                courseController.showUpdateDialog(context, courseName);
                              } else if (direction == DismissDirection.startToEnd) {
                                // Modify operation
                                courseController.showDeleteDialog(context, courseName);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: () async {
                                  courseController.setGridTapped(true, index);
                                  await courseController.fetchSubCourses(courseName);
                                  Get.to(() => SubCourses(index1: index));
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                courseName,
                                                style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: primaryColor,
                                                  letterSpacing: 2,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Obx(() => courseController.isGridTapped.value &&
                                                courseController.currentGridTappedIndex.value ==
                                                    index
                                                ? const SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: CircularProgressIndicator(
                                                color: buttonColor,
                                                strokeWidth: 2.0,
                                              ),
                                            )
                                                : const Icon(
                                              Icons.arrow_circle_right,
                                              color: buttonColor,
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    // Container 1
                    if (homeController.showContainer1.isTrue)
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            MyContainer(
                              gestuorTap: () {},
                              text: 'Add Controller',
                              icon: FontAwesomeIcons.personCirclePlus,
                              borderRadius: 16.0,
                              containerColor: primaryColorWithOpacity,
                              borderWidth: 2.0,
                              index: 6,
                              heightContainer: screenHeight * 0.2,
                            ),
                            const SizedBox(height: 30),
                            MyContainer(
                              gestuorTap: () {
                                Get.to(const AddCourse());
                              },
                              text: 'Add Course',
                              icon: FontAwesomeIcons.bookOpen,
                              borderRadius: 16.0,
                              borderColor: buttonColor,
                              containerColor: buttonColorWithOpacity,
                              borderWidth: 2.0,
                              index: 6,
                              heightContainer: screenHeight * 0.2,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}