// import 'package:flutter/material.dart';

class EventModel {
  int id;
  String title;
  String description;
  String bannerImage;
  String dateTime;
  String organiserName;
  String organiserIcon;
  String venueName;
  String venueCity;
  String venueCountry;

  EventModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.bannerImage,
      required this.dateTime,
      required this.organiserIcon,
      required this.organiserName,
      required this.venueName,
      required this.venueCity,
      required this.venueCountry});

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      bannerImage: json["banner_image"],
      dateTime: json["date_time"],
      organiserIcon: json["organiser_icon"],
      organiserName: json["organiser_name"],
      venueName: json["venue_name"],
      venueCity: json["venue_city"],
      venueCountry: json["venue_country"]);
}
