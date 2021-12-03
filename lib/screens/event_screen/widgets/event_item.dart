import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_app/icons/my_flutter_app_icons.dart';
import 'package:dsc_app/models/event/event_model.dart';
import 'package:dsc_app/providers/events_provider.dart';
import 'package:dsc_app/screens/event_screen/event_detail_screen.dart';
import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatefulWidget {
  EventModel _event;

  EventItem(this._event);

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  Widget _subText(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: SECONDARY_DECENT,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: SECONDARY_DECENT),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<EventsProvider>(context);
    var savedEvents = eventsProvider.savedEvents;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(EventDetailScreen.tag, arguments: widget._event);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff005c7e).withOpacity(0.05),
                      offset: Offset(0, 10),
                      blurRadius: 5)
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget._event.imageUrl,
                        placeholder: (_, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget._event.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.black)),
                        SizedBox(
                          height: 10,
                        ),
                        _subText(FontAwesomeIcons.clock,
                            '${DateFormat('E, d/M/y').add_jm().format(DateTime.parse(widget._event.time))}'),
                        SizedBox(
                          height: 10,
                        ),
                        if (widget._event.location.address != '')
                          _subText(Icons.add_location,
                              widget._event.location.address),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xE5FFADAD),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    DateFormat.d().format(DateTime.parse(widget._event.time)),
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    DateFormat.MMM().format(DateTime.parse(widget._event.time)),
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xE5FFADAD),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () {
                  savedEvents.any((element) => element.id == widget._event.id)
                      ? eventsProvider.removeEventFromList(widget._event)
                      : eventsProvider.addEventToSaveList(widget._event);
                },
                icon: Icon(
                  savedEvents.any((element) => element.id == widget._event.id)
                      ? FontAwesomeIcons.solidBookmark
                      : FontAwesomeIcons.bookmark,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
