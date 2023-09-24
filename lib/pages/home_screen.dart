// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tif/model/model.dart';
import 'package:tif/pages/description_page.dart';
import 'dart:convert';

import 'package:tif/pages/search_page.dart';

String stringResponse = "";
Map<dynamic, dynamic> mapResponse = [] as Map;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EventModel> list = [];
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://sde-007.api.assignment.theinternetfolks.works/v1/event"));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        // print(mapResponse);
        list = List<EventModel>.from(mapResponse["content"]["data"]
            .map((ele) => EventModel.fromJson(ele))
            .toList());
        print(list[0].description);
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Events",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SearchScreen(find: list));
            },
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          // Icon(
          //   Icons.search,
          //   size: 30,
          // ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.more_vert_rounded,
            size: 30,
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => DescriptionPage(desc: list[index]));
                },
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      list[index].bannerImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat("E, MMM yy • hh:mm a")
                            .format(DateTime.parse(list[index].dateTime)),
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                      Text(
                        list[index].title,
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
                          "${list[index].venueName} ${list[index].venueCity} ${list[index].venueCountry}",
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
          }),
    );
  }
}
