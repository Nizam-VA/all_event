import 'package:all_events/controller/blocs/events/events_bloc.dart';
import 'package:all_events/controller/blocs/grid_view/grid_view_bloc.dart';
import 'package:all_events/utils/constants.dart';
import 'package:all_events/view/screen/event_details/screen_event_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ScreenEventCategories extends StatelessWidget {
  const ScreenEventCategories({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    context.read<EventsBloc>().add(
          GetEventsByCategoryEvent(category: category),
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        toolbarHeight: Constants.height * .08,
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Constants.imageUrl), fit: BoxFit.cover),
          ),
        ),
        actions: [
          BlocBuilder<GridViewBloc, GridViewState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  bool isGrid = state.isGrid;
                  context.read<GridViewBloc>().add(IsGridEvent(isGrid: isGrid));
                },
                icon: state.isGrid
                    ? Icon(Icons.list)
                    : Icon(Icons.grid_on_outlined),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<GridViewBloc, GridViewState>(
        builder: (context, state) {
          return !state.isGrid
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: BlocBuilder<EventsBloc, EventsState>(
                    builder: (context, state) {
                      return state is EventLoadingState
                          ? ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
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
                                            SizedBox(
                                                width: Constants.width * 0.03),
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
                                                      height: Constants.height *
                                                          0.01),
                                                  Container(
                                                    width:
                                                        150, // Adjust the width as needed
                                                    height: 15,
                                                    color: Colors
                                                        .white, // Set a background color for the shimmer effect
                                                  ),
                                                  SizedBox(
                                                      height: Constants.height *
                                                          0.01),
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
                                    ));
                              },
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ScreenEventDetails(
                                                  event: state.events[index]),
                                        ),
                                      );
                                    },
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
                                                  image: NetworkImage(state
                                                      .events[index]
                                                      .thumbUrlLarge!)),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          SizedBox(
                                              width: Constants.width * 0.03),
                                          SizedBox(
                                            width: Constants.width * 0.5,
                                            height: Constants.height * 0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state
                                                      .events[index].eventname!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: Constants.height *
                                                        0.01),
                                                Text(
                                                  state.events[index].location!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: Constants.height *
                                                        0.01),
                                                Text(
                                                  state.events[index]
                                                      .endTimeDisplay!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                              itemCount: state.events.length);
                    },
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: BlocBuilder<EventsBloc, EventsState>(
                    builder: (context, state) {
                      return state is EventLoadingState
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 5,
                                  child: Container(
                                    height: Constants.height * .2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors
                                          .white, // Set a background color for the shimmer effect
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: Constants.height * .125,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            color: Colors
                                                .white, // Set a background color for the shimmer effect
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8, top: 8),
                                          child: Container(
                                            width:
                                                120, // Adjust the width as needed
                                            height: 15,
                                            color: Colors
                                                .white, // Set a background color for the shimmer effect
                                          ),
                                        ),
                                        kHight5,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Container(
                                            width:
                                                80, // Adjust the width as needed
                                            height: 15,
                                            color: Colors
                                                .white, // Set a background color for the shimmer effect
                                          ),
                                        ),
                                        kHight5,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Container(
                                            width:
                                                100, // Adjust the width as needed
                                            height: 12,
                                            color: Colors
                                                .white, // Set a background color for the shimmer effect
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20),
                                    elevation: 5,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ScreenEventDetails(
                                                    event: state.events[index]),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        // margin: const EdgeInsets.all(8),
                                        height: Constants.height * .2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: Constants.height * .125,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                                image: DecorationImage(
                                                  image: NetworkImage(state
                                                      .events[index].thumbUrl!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8, top: 8),
                                              child: Text(
                                                  state
                                                      .events[index].eventname!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            kHight5,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                state.events[index].location!,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            kHight5,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                  state.events[index]
                                                      .endTimeDisplay!,
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: state.events.length,
                            );
                    },
                  ),
                );
        },
      ),
    );
  }
}
