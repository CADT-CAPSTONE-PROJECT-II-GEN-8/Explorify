// import 'package:flutter/material.dart';
// import 'package:frontend_mobile/common/colors.dart';
// import 'package:frontend_mobile/screens/history/widgets/custom_danger_button.dart';
// import 'package:frontend_mobile/screens/history/widgets/remove_btn.dart';

// class InternshipApplyScreen extends StatelessWidget {
//   const InternshipApplyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             Text(
//               "Internship Applications",
//               style: Theme.of(context)
//                   .textTheme
//                   .titleLarge
//                   ?.copyWith(fontWeight: FontWeight.w600, color: Colors.blue),
//             ),
//             const SizedBox(height: 8),
//             _buildInternshipCard(
//               context,
//               title: "Software Engineer Intern",
//               company: "TechCorp",
//               description:
//                   "Work on developing and maintaining software applications.",
//               contactInfo: "Email: hr@techcorp.com\nPhone: +1234567890",
//             ),
//             const SizedBox(height: 8),
//             _buildInternshipCard(
//               context,
//               title: "Marketing Intern",
//               company: "MarketGurus",
//               description:
//                   "Assist with marketing campaigns and social media management.",
//               contactInfo: "Email: careers@marketgurus.com\nPhone: +0987654321",
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInternshipCard(
//     BuildContext context, {
//     required String title,
//     required String company,
//     required String description,
//     required String contactInfo,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 8.0,
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall
//                   ?.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               company,
//               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                   fontWeight: FontWeight.w500, color: Colors.grey[800]),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   fontWeight: FontWeight.normal, color: Colors.grey[800]),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               contactInfo,
//               style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                   fontWeight: FontWeight.normal, color: Colors.grey[600]),
//             ),
//             const SizedBox(height: 8),
//             OverflowRemoveBarButton(
//               title: 'Remove',
//               onPressed: () => _confirmRemove(context, title),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void _confirmRemove(BuildContext context, String title) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return GestureDetector(
//           onVerticalDragDown: (_) => Navigator.of(context).pop(),
//           child: Container(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.symmetric(
//                       vertical: 10.0, horizontal: 5.0),
//                   height: 4.0, // Height of the handle indicator
//                   width: 40.0,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.5),
//                     borderRadius: BorderRadius.circular(2.0),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 Text(
//                   'Confirm Removal',
//                   style: Theme.of(context).textTheme.titleLarge,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 16.0),
//                 Container(
//                   margin: const EdgeInsets.symmetric(
//                       vertical: 10.0, horizontal: 5.0),
//                   height: 1.0,
//                   color: Colors.grey.withOpacity(0.5),
//                 ),
//                 const SizedBox(height: 16.0),
//                 Text(
//                   'Are you sure you want to remove "$title"?',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 16.0),
//                 ),
//                 const SizedBox(height: 24.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Expanded(
//                       child: TextButton(
//                         // onPressed: () => _confirmRemove(context, title),
//                         onPressed: () {},
//                         style: TextButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.0),
//                             side:
//                                 const BorderSide(color: AppColor.borderPrimary),
//                           ),
//                         ),
//                         child: const Text('Cancel'),
//                       ),
//                     ),
//                     const SizedBox(width: 16.0),
//                     Expanded(
//                       child: DangerButton(
//                         onPressed: () {
//                           // Handle removal logic
//                           // Navigator.of(context).pop();
//                         },
//                         buttonText: 'Remove',
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class InternshipApplyScreen extends StatelessWidget {
  const InternshipApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Applied Internship",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600, color: AppColor.primary),
            ),
            const SizedBox(height: 8),
            _buildInternshipCard(
              context,
              title: "React Developer",
              company: "AmplifyAvenue",
              location: "New York, USA",
              timeApplied: "Applied: 3 days ago",
            ),
            _buildInternshipCard(
              context,
              title: "Graphics Designer",
              company: "PixelPulse Tech",
              location: "New York, USA",
              timeApplied: "Applied: 1 week ago",
            ),
            _buildInternshipCard(
              context,
              title: "UI Designer",
              company: "VelocityCraft",
              location: "New York, USA",
              timeApplied: "Applied: 2 weeks ago",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInternshipCard(
    BuildContext context, {
    required String title,
    required String company,
    required String location,
    required String timeApplied,
  }) {
    return Card(
      color: Colors.white,
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Text(
                    title[0],
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      company,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _confirmRemove(context, title),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey[600], size: 20),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeApplied,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        //fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobInfoChip(BuildContext context, {required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
      ),
    );
  }

  void _confirmRemove(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onVerticalDragDown: (_) => Navigator.of(context).pop(),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  height: 4.0, // Height of the handle indicator
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Confirm Removal',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  height: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Are you sure you want to remove "$title"?',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          //Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side:
                                const BorderSide(color: AppColor.borderPrimary),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle removal logic
                          //Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          iconColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text('Remove'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
