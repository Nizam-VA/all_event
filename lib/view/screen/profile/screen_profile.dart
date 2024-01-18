import 'package:all_events/utils/common.dart';
import 'package:all_events/utils/constants.dart';
import 'package:all_events/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kHight20,
                  CircleAvatar(
                    radius: width * .176,
                    backgroundColor: Colors.blue[400],
                    child: CircleAvatar(
                      radius: width * .175,
                      backgroundColor: Colors.blue[50],
                      child: Image.asset(
                        'assets/images/person logo.png',
                        height: height * .08,
                      ),
                    ),
                  ),
                  kHight10,
                  const Text('Guest User', style: bigBoldBlack),
                  kHight30,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Account', style: bigBoldBlack),
                    Column(
                      children: List.generate(
                        4,
                        (index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              padding: const EdgeInsets.all(8),
                              width: width,
                              height: height * .06,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      accountIcons[index],
                                      kWidth10,
                                      Text(accountTitles[index]),
                                    ],
                                  ),
                                  Icon(
                                    CupertinoIcons.right_chevron,
                                    color: Colors.blue,
                                    size: 24,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    kHight20,
                    const Text('Events', style: bigBoldBlack),
                    Column(
                      children: List.generate(
                        5,
                        (index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              padding: const EdgeInsets.all(8),
                              width: width,
                              height: height * .06,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      eventsIcons[index],
                                      kWidth10,
                                      Text(eventsTitles[index]),
                                    ],
                                  ),
                                  Icon(
                                    CupertinoIcons.right_chevron,
                                    color: Colors.blue,
                                    size: 24,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    kHight20,
                    const Text('Account', style: bigBoldBlack),
                    Column(
                      children: List.generate(
                        3,
                        (index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              padding: const EdgeInsets.all(8),
                              width: width,
                              height: height * .06,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      aboutIcons[index],
                                      kWidth10,
                                      Text(aboutTitles[index]),
                                    ],
                                  ),
                                  Icon(
                                    CupertinoIcons.right_chevron,
                                    color: Colors.blue,
                                    size: 24,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
