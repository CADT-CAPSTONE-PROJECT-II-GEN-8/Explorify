import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/model/cv/user_education.dart';
import 'package:frontend_mobile/screens/login/logic/user_input_logic.dart';
import 'package:frontend_mobile/screens/profile/logic.dart/edu_input_logic.dart';
import 'package:frontend_mobile/screens/profile/service/profile_service.dart';

class EduForm extends StatefulWidget {
  const EduForm({super.key});

  @override
  State<EduForm> createState() => _EduFormState();
}

class _EduFormState extends State<EduForm> {
  EduInputLogic eduInputLogic = EduInputLogic();

  late TextEditingController _levelController;
  late TextEditingController _institutionController;
  late TextEditingController _fieldController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  // late TextEditingController _descriptionController ;
  final _formKey = GlobalKey<FormState>();
  final bool isSubmitted = false;
  ProfileService profile = ProfileService();
  void _submitEdu() {
    profile.eduSubmit(
        context: context,
        userEducation: UserEducation(
            userEducationId: 0,
            educationLevel: eduInputLogic.educationLevel,
            school: eduInputLogic.school,
            major: eduInputLogic.major,
            startDate: eduInputLogic.startDate,
            endDate: eduInputLogic.endDate));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _levelController =
        TextEditingController(text: eduInputLogic.educationLevel);
    _institutionController = TextEditingController(text: eduInputLogic.school);
    _fieldController = TextEditingController(text: eduInputLogic.major);
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
//  _descriptionController = TextEditingController(text: );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _levelController.dispose();
    _institutionController.dispose();
    _fieldController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    // _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text("Level of Education",
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _levelController, // Assign the controller
            onChanged: (value) => eduInputLogic.updateEducationLevel(value),
            decoration: InputDecoration(
              hintText: "Enter Your Level",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),

              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 7), // Adjust padding values
              enabledBorder: OutlineInputBorder(
                // Custom border style
                borderRadius: BorderRadius.circular(15), // Rounded corners
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use theme color
                  width: 2.0, // Adjust border thickness
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // Style for focused state
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use accent color
                  width: 2.0,
                ),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.black), // Match text style
          ),
          SizedBox(
            height: 24,
          ),
          Text("Institution Name",
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _institutionController, // Assign the controller
            decoration: InputDecoration(
              hintText: "Enter Your Institution",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),

              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 7), // Adjust padding values
              enabledBorder: OutlineInputBorder(
                // Custom border style
                borderRadius: BorderRadius.circular(15), // Rounded corners
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use theme color
                  width: 2.0, // Adjust border thickness
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // Style for focused state
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use accent color
                  width: 2.0,
                ),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.black), // Match text style
          ),
          SizedBox(
            height: 24,
          ),
          Text("Field of Study", style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _fieldController, // Assign the controller
            decoration: InputDecoration(
              hintText: "Enter Your Study Field",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),

              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 7), // Adjust padding values
              enabledBorder: OutlineInputBorder(
                // Custom border style
                borderRadius: BorderRadius.circular(15), // Rounded corners
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use theme color
                  width: 2.0, // Adjust border thickness
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // Style for focused state
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use accent color
                  width: 2.0,
                ),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.black), // Match text style
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Start Date",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _startDateController, // Assign the controller
                      decoration: InputDecoration(
                        hintText: "DD/MM/YYYY",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.7)),

                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 7), // Adjust padding values
                        enabledBorder: OutlineInputBorder(
                          // Custom border style
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                          borderSide: BorderSide(
                            color: AppColor.grey
                                .withOpacity(0.5), // Use theme color
                            width: 2.0, // Adjust border thickness
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Style for focused state
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: AppColor.grey
                                .withOpacity(0.5), // Use accent color
                            width: 2.0,
                          ),
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black), // Match text style
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("End Date",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _endDateController, // Assign the controller
                      decoration: InputDecoration(
                        hintText: "DD/MM/YYYY",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.7)),

                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 7), // Adjust padding values
                        enabledBorder: OutlineInputBorder(
                          // Custom border style
                          borderRadius:
                              BorderRadius.circular(15), // Rounded corners
                          borderSide: BorderSide(
                            color: AppColor.grey
                                .withOpacity(0.5), // Use theme color
                            width: 2.0, // Adjust border thickness
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Style for focused state
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: AppColor.grey
                                .withOpacity(0.5), // Use accent color
                            width: 2.0,
                          ),
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black), // Match text style
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Text("Description", style: Theme.of(context).textTheme.titleSmall),
          SizedBox(
            height: 12,
          ),
          // Container(
          //   width: 1000,
          //   height: 200.0,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.0),
          //     border: Border.all(
          //       color: Colors.grey[300]!,
          //       width: 1.0,
          //     ),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: TextField(
          //       controller: _descriptionController,
          //       maxLines: null,
          //       expands: true,
          //       decoration: const InputDecoration(
          //         hintText: 'Write additional information here',
          //         border: InputBorder.none,
          //       ),
          //       style: TextStyle(fontSize: 12.0),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isSubmitted == true;
              });
              if (_formKey.currentState!.validate()) {
                _submitEdu();
                // print("ok");
              }
            },
            child: Text('Save'),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
