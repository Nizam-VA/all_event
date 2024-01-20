import 'package:all_events/controller/blocs/category/category_bloc.dart';
import 'package:all_events/controller/blocs/events/events_bloc.dart';
import 'package:all_events/utils/common.dart';
import 'package:all_events/utils/constants.dart';
import 'package:all_events/view/screen/all_events/screen_all_events.dart';
import 'package:all_events/view/screen/event_categories/screen_event_categories.dart';
import 'package:all_events/view/screen/event_details/screen_event_details.dart';
import 'package:all_events/view/screen/search_filter/screen_search_filter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EventsBloc>().add(GetAllEventsEvent());
    context.read<CategoryBloc>().add(GetAllCategoriesEvent());
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(context),
            _buildPopularEventsSection(context),
            _buildExploreCategoriesSection(),
            _buildRecentlyViewedEventsSection(),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: Constants.height * 0.13,
      toolbarHeight: Constants.height * .13,
      pinned: true,
      flexibleSpace: _buildAppBarContent(context),
    );
  }

  Widget _buildAppBarContent(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(Constants.imageUrl),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: Constants.height * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    Container(
                      height: Constants.height * 0.035,
                      width: Constants.height * 0.035,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Ahmadabad",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.white),
                    const Spacer(),
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => ScreenSearchFilter(),
                    ),
                  );
                },
                child: Container(
                  height: Constants.height * 0.05,
                  width: Constants.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          "What do you feel like doing?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularEventsSection(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular Events",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenAllEvents(),
                      ),
                    );
                  },
                  child: const Text('View All'),
                )
              ],
            ),
          ),
          BlocBuilder<EventsBloc, EventsState>(
            builder: (context, state) {
              return state is EventLoadingState
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 15),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          height: Constants.height * 0.23,
                          width: Constants.width * .8,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: Constants.height * 0.23,
                                width: Constants.width * .8,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 25,
                                bottom: 62,
                                child: Material(
                                  color: Colors.white,
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 40,
                                    width: 40,
                                    child: const Icon(Icons.star_outline),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150, // Adjust the width as needed
                                      height: 15,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      width: 200, // Adjust the width as needed
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width: 100, // Adjust the width as needed
                                      height: 15,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : CarouselSlider.builder(
                      itemCount: state.events.length,
                      itemBuilder: (context, index, realIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(15),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenEventDetails(
                                        event: state.events[index]),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: Constants.height * 0.19,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            state.events[index].bannerUrl!,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 25,
                                      bottom: 62,
                                      child: Material(
                                        color: Colors.white,
                                        elevation: 2,
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          height: 40,
                                          width: 40,
                                          child: const Icon(Icons.star_outline),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      left: 10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.events[index].eventname!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Text(
                                            state.events[index].endTimeDisplay!,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            state.events[index].location!,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        aspectRatio: 14 / 9,
                        viewportFraction: 0.9,
                        enlargeFactor: 0.15,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayCurve: Curves.linear,
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }

  SliverList _buildExploreCategoriesSection() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Explore Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
              ],
            ),
          ),
          SizedBox(
            height: Constants.height * 0.13,
            width: Constants.width,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 10 : 0,
                          right: index == items.length - 1 ? 10 : 0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashFactory: NoSplash.splashFactory,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenEventCategories(
                                        category:
                                            state.categories[index].category!),
                                  ),
                                );
                              },
                              child: Container(
                                height: Constants.height * 0.1,
                                width: Constants.height * 0.1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        index <= state.categories.length
                                            ? items[index][1]
                                            : null),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: index != items.length - 1
                                    ? null
                                    : const Center(
                                        child: Text(
                                          "+22",
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            Text(index <= state.categories.length
                                ? state.categories[index].category!
                                : 'More'),
                          ],
                        ),
                      );
                    },
                    itemCount: state.categories.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyViewedEventsSection() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SizedBox(height: Constants.height * 0.02),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Recently Viewed Events",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: Constants.height * 0.02),
          BlocBuilder<EventsBloc, EventsState>(
            builder: (context, state) {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ScreenEventDetails(event: state.events[index]),
                          ),
                        );
                      },
                      child: state is EventLoadingState
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: SizedBox(
                                  height: Constants.height * 0.12,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: Constants.height * 0.12,
                                        width: Constants.width * 0.38,
                                        decoration: BoxDecoration(
                                          color: Colors
                                              .white, // Set a background color for the shimmer effect
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      SizedBox(width: Constants.width * 0.03),
                                      SizedBox(
                                        width: Constants.width * 0.5,
                                        height: Constants.height * 0.12,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width:
                                                  200, // Adjust the width as needed
                                              height: 20,
                                              color: Colors
                                                  .white, // Set a background color for the shimmer effect
                                            ),
                                            SizedBox(
                                                height:
                                                    Constants.height * 0.01),
                                            Container(
                                              width:
                                                  150, // Adjust the width as needed
                                              height: 15,
                                              color: Colors
                                                  .white, // Set a background color for the shimmer effect
                                            ),
                                            SizedBox(
                                                height:
                                                    Constants.height * 0.01),
                                            Container(
                                              width:
                                                  100, // Adjust the width as needed
                                              height: 15,
                                              color: Colors
                                                  .white, // Set a background color for the shimmer effect
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: SizedBox(
                                height: Constants.height * 0.12,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Container(
                                      height: Constants.height * 0.12,
                                      width: Constants.width * 0.38,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(index < 5
                                                ? state.events[index]
                                                    .thumbUrlLarge!
                                                : '')),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    SizedBox(width: Constants.width * 0.03),
                                    SizedBox(
                                      width: Constants.width * 0.5,
                                      height: Constants.height * 0.12,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            index < 5
                                                ? state.events[index].eventname!
                                                : '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              height: Constants.height * 0.01),
                                          Text(
                                            index < 5
                                                ? state.events[index].location!
                                                : '',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                              height: Constants.height * 0.01),
                                          Text(
                                            index < 5
                                                ? state.events[index]
                                                    .endTimeDisplay!
                                                : '',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                    );
                  },
                  itemCount: 5);
            },
          ),
        ],
      ),
    );
  }
}
