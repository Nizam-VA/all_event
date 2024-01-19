import 'package:all_events/model/business/item.dart';
import 'package:all_events/utils/constants.dart';
import 'package:all_events/utils/text_styles.dart';
import 'package:all_events/view/screen/web_view/screen_web_view.dart';
import 'package:flutter/material.dart';

class ScreenEventDetails extends StatelessWidget {
  const ScreenEventDetails({super.key, required this.event});
  final Item event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        iconTheme: const IconThemeData(color: Colors.black),
        title:
            Text(event.eventname!, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 5,
              child: SizedBox(
                width: Constants.width,
                height: Constants.height * .34,
                child: Column(
                  children: [
                    Container(
                      width: Constants.width,
                      height: Constants.height * .25,
                      child: Image.network(event.thumbUrlLarge!,
                          fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Constants.width * .75,
                            child: Text(
                              event.eventname!,
                              style: boldBlack,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.star_border)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHight10,
                  const Row(
                    children: [
                      Icon(Icons.date_range_outlined),
                      Text('Date & Time', style: boldBlack)
                    ],
                  ),
                  kHight10,
                  Text(event.endTimeDisplay!, style: semiRegularBlack),
                  kHight10,
                  const Row(
                    children: [
                      Icon(Icons.place_outlined),
                      Text('Venue', style: boldBlack),
                    ],
                  ),
                  kHight10,
                  Text(
                    '${event.venue!.fullAddress}, ${event.venue!.street}, ${event.venue!.city}, ${event.venue!.state}, ${event.venue!.country}.',
                    style: semiRegularBlack,
                  ),
                  kHight10,
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenWebView(websiteURL: event.eventUrl!),
                        ),
                      );
                    },
                    child: const Text(
                      'Visit event on web',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  kHight10,
                  const Row(
                    children: [
                      Icon(Icons.image_outlined),
                      Text("Event's Photos", style: boldBlack),
                    ],
                  ),
                  kHight10,
                  Container(
                    width: Constants.width,
                    height: Constants.height * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          event.bannerUrl!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
