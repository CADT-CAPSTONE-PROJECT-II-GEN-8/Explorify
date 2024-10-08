import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/widget/custom_container.dart';

class PrimaryCustomContainer extends StatelessWidget {
  const PrimaryCustomContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.30,
        child: Stack(
          children: [
            Positioned(
              left: -170,
              top: -150,
              child: CustomContainer(
                circleColor: AppColor.appbBarColor.withOpacity(.2),
              ),
            ),
            Positioned(
              left: -90,
              top: -150,
              child: CustomContainer(
                circleColor: AppColor.appbBarColor.withOpacity(.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}




  AppBar customAppBar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
      title: const Text(
        'Dashboard',
        style:
            TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      leading: InkWell(
        onTap: () {},
        child: const Icon(
          Icons.subject,
          color: Colors.white,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              size: 20,
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110.0),
          child: Container(
            padding: const EdgeInsets.only(left: 30, bottom: 20),
            child: Row(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person_outline_rounded),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.deepPurple,
                        size: 20,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hubert Wong',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Text(
                        'hubert.wong@mail.com',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '+1 1254 251 241',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }