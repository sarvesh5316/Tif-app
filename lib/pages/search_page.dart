// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tif/model/model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.find});
  final List<EventModel> find;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Search",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 67),
            child: Container(
              height: 69,
              margin: EdgeInsets.only(left: 15, right: 15),
              // width: 320,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      Text(" | "),
                      SizedBox(
                        height: 67,
                        width: MediaQuery.of(context).size.width - 68,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Search Anything",
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: widget.find.length,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // Get.to(() => DescriptionPage(desc: widget.find));
                  },
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.find[i].bannerImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat("E, MMM yy • hh:mm a")
                              .format(DateTime.parse(widget.find[i].dateTime)),
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                        Text(
                          widget.find[i].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Expanded(
                          child: Text(
                            "${widget.find[i].venueName} ${widget.find[i].venueCity} ${widget.find[i].venueCountry}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
