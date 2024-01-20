import 'package:all_events/controller/blocs/category/category_bloc.dart';
import 'package:all_events/controller/blocs/events/events_bloc.dart';
import 'package:all_events/utils/constants.dart';
import 'package:all_events/utils/text_styles.dart';
import 'package:all_events/view/screen/event_details/screen_event_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ScreenSearchFilter extends StatelessWidget {
  const ScreenSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(GetAllCategoriesEvent());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Constants.imageUrl), fit: BoxFit.cover),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'What do you feel like doing?...',
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: const BorderSide(
                              width: .5, color: Colors.purple))),
                ),
                kHight10,
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.purple, width: .5),
                  ),
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Select category', style: boldBlack),
                          kHight10,
                          state is CategoryLoadingState
                              ? Shimmer.fromColors(
                                  baseColor: Colors.white70,
                                  highlightColor: Colors.grey[300]!,
                                  child: Container(
                                    height: Constants.height * .08,
                                    width: Constants.width,
                                    color: Colors.white,
                                  ),
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.categories.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 1 / .30,
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          // categoryItems(categoriesList[index]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            backgroundColor:
                                                // categories.contains(categoriesList[index])
                                                //     ? AppColors.primary :
                                                Colors.white,
                                            side: const BorderSide(
                                                color:
                                                    // categories.contains(categoriesList[index])
                                                    //     ? Colors.white :
                                                    Colors.purple,
                                                width: .5)),
                                        child: Text(
                                          state.categories[index].category!
                                              .toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color:
                                                  // categories.contains(categoriesList[index])
                                                  //     ? Colors.white :
                                                  Colors.purple),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ],
                      );
                    },
                  ),
                ),
                kHight10,
                BlocBuilder<EventsBloc, EventsState>(
                  builder: (context, state) {
                    return state is EventLoadingState
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: SizedBox(
                                  height: Constants.height * 0.12,
                                  width: Constants.width,
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
                              );
                            },
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
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
                                    width: Constants.width - 50,
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
                                                  height:
                                                      Constants.height * 0.01),
                                              Text(
                                                state.events[index].location!,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                      Constants.height * 0.01),
                                              Text(
                                                state.events[index]
                                                    .endTimeDisplay!,
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
                            itemCount: state.events.length);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
