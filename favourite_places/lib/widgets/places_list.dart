import 'package:favourite_places/models/favourite_pace.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class PlacesList extends StatelessWidget {
  const PlacesList(
      {super.key,
      required this.favouritePlacesList,
      required this.onDelete,
      required this.onNavigateToDescription});

  final List<FavouritePlace> favouritePlacesList;
  final void Function(FavouritePlace place) onDelete;
  final void Function(FavouritePlace place) onNavigateToDescription;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: favouritePlacesList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(favouritePlacesList[index]),
        onDismissed: (direction) {
          onDelete(favouritePlacesList[index]);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              onNavigateToDescription(favouritePlacesList[index]);
            },
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.file(
                        favouritePlacesList[index].image,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            favouritePlacesList[index].name,
                            style: normalTextStyle,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.more_vert,
                            color: primaryTextColor,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(thickness: 0.2),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: secondaryTextColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Location : Myplace, My city',
                            style: textFieldTextStyle,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}


// Container(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//               decoration: const BoxDecoration(
//                   color: cardColor,
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               child: Row(
//                 children: [
//                   Text(
//                     favouritePlacesList[index].name,
//                     style: smallTextStyle,
//                   )
//                 ],
//               ),
//             ),