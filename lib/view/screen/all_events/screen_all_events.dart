import 'package:all_events/controller/blocs/events/events_bloc.dart';
import 'package:all_events/controller/blocs/grid_view/grid_view_bloc.dart';
import 'package:all_events/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAllEvents extends StatelessWidget {
  ScreenAllEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Events'),
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
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
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
                                            image: NetworkImage(state
                                                .events[index].thumbUrlLarge!)),
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
                                            state.events[index].eventname!,
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
                                            state.events[index].location!,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                              height: Constants.height * 0.01),
                                          Text(
                                            state.events[index].endTimeDisplay!,
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
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 5,
                              child: Container(
                                // margin: const EdgeInsets.all(8),
                                height: Constants.height * .2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: Constants.height * .125,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              state.events[index].thumbUrl!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 8),
                                      child: Text(
                                          state.events[index].eventname!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    kHight5,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        state.events[index].location!,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    kHight5,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                          state.events[index].endTimeDisplay!,
                                          style: TextStyle(fontSize: 12)),
                                    ),
                                  ],
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
