// import 'package:flutter/material.dart';

// Future<void> showConfirmationDialog(BuildContext context) async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('No CV uploaded yet'),
//         content: const Text(
//             'You don\'t have a CV uploaded yet. Would you like to upload one now?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               // navigate to upload CV screen
//               Navigator.pop(context);
//               // TODO: Add navigation to upload CV screen
//             },
//             child: const Text('Upload CV'),
//           ),
//         ],
//       );
//       // AlertDialog(
//       //   title: const Text('No CV uploaded yet'),
//       //   content: const SingleChildScrollView(
//       //     child: ListBody(
//       //       children: <Widget>[
//       //         Text('You don\'t have a CV uploaded yet. Would you like to upload one now?'),
//       //         Text('\nYou will not be able to undo this action.'),
//       //       ],
//       //     ),
//       //   ),
//       //   actions: <Widget>[
//       //     TextButton(
//       //       child: const Text('NO'),
//       //       onPressed: () {
//       //         Navigator.of(context).pop();
//       //       },
//       //     ),
//       //     TextButton(
//       //       child: const Text('YES'),
//       //       onPressed: () {
//       //         // delete account logic here
//       //         Navigator.of(context).pop();
//       //       },
//       //     ),
//       //   ],
//       // );
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/text.dart';

enum ConfirmationType { warning, success }

Future<void> showConfirmationDialog(BuildContext context,
    {required ConfirmationType type,
    required String title,
    required String content,
    required String positiveButtonText,
    VoidCallback? onPositivePressed,
    VoidCallback? onNegativeButtonPressed}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      String dialogTitle = "";
      String dialogContent = "";
      String positiveButtonLabel = "";
      VoidCallback? positiveButtonAction;
      VoidCallback? negativeButtonAction;
      switch (type) {
        case ConfirmationType.warning:
          dialogTitle = title;
          dialogContent = content;
          positiveButtonLabel = positiveButtonText ?? "Yes";
          positiveButtonAction = onPositivePressed;
          negativeButtonAction = onNegativeButtonPressed;
          break;
        case ConfirmationType.success:
          dialogTitle = title ?? "Success";
          dialogContent = content ?? "Your action was successful.";
          positiveButtonLabel = positiveButtonText ?? "Ok";
          break;
      }

      return Dialog(
        // width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, top: 40.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, top: 16.0),
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 12, left: 12, top: 16.0, bottom: 24.0),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: MaterialButton(
                            elevation: 0,
                            highlightElevation: 0,
                            highlightColor: AppColor.primary,
                            onPressed: positiveButtonAction,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                side: BorderSide(
                                  color: AppColor.primary,
                                )),
                            color: AppColor.primary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 90, vertical: 8),
                            child: Text(
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              positiveButtonLabel,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: MaterialButton(
                            elevation: 0,
                            highlightElevation: 0,
                            highlightColor: AppColor.buttonSecondary,
                            onPressed: negativeButtonAction,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                side: BorderSide(
                                  color: AppColor.primary,
                                )),
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 8),
                            child: Text(
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              AppText.enText['cancel_text']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.primary),
                            ),
                          ),
                        ),
                      ]),
                )
              ],
            ),
            Positioned(
              top: 20.0,
              right: 20.0,
              child: Container(
                height: 33,
                width: 33,
                decoration: const BoxDecoration(
                  color: AppColor.error, // Replace with your desired color
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.all(8),
                  icon: const Icon(
                    Icons.close,
                    color: AppColor.white,
                    size: 18,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      );
      // AlertDialog(
      //   title: Text(dialogTitle),
      //   content: Text(dialogContent),
      //   actions: [
      //     TextButton(
      //       onPressed: () => Navigator.pop(context),
      //       child: const Text('Cancel'),
      //     ),
      //     TextButton(
      //       onPressed: positiveButtonAction,
      //       child: Text(positiveButtonLabel),
      //     ),
      //   ],
      // );
    },
  );
}
