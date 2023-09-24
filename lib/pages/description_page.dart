// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tif/model/model.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key, required this.desc});

  final EventModel desc;

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: 280,
          height: 50, // Adjust the height to your desired size
          child: FloatingActionButton(
            onPressed: () {
              // Handle the 'Book Now' action
              // print('Book Now button pressed.');
            },
            // tooltip: 'Book Now',
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                // boxShadow: Shadow(blurRadius:BorderSide.strokeAlignOutside ),
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Book Now",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(width: 100),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_circle_right_outlined))
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 375,
                height: 244,
                color: Colors.blue,
                child: Stack(
                  children: [
                    Center(
                      child: Image.network(
                        widget.desc.bannerImage,
                        fit: BoxFit.fill,
                        width: 375,
                        height: 244,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 35,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 35,
                      child: IconButton(
                        icon: Icon(
                          Icons.bookmark,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          // Handle bookmark button press
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.desc.title,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 35),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                height: 250,
                width: 300,
                child: Column(
                  children: [
                    ListTile(
                      // leading: Icon(Image(image:Image.network(widget.desc.organiserIcon) )),
                      leading: Image.network(
                        widget.desc.organiserIcon,
                        height: 35,
                      ),
                      title: Text(widget.desc.organiserName),
                      subtitle: Text("Organiser"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.blue,
                      ),
                      title: Text(DateFormat("dd MMMM, yyyy ")
                          .format(DateTime.parse(widget.desc.dateTime))
                          .toString()),
                      subtitle: Text(DateFormat("E • hh:mm a")
                          .format(DateTime.parse(widget.desc.dateTime))
                          .toString()),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      title: Text(widget.desc.venueName),
                      subtitle: Text(
                          "${widget.desc.venueCity}, ${widget.desc.venueCountry}"),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "About Event",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.desc.description,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
