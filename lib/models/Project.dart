import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  final String? title, description, link;

  Project({this.title, this.description, this.link});


  factory Project.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) => Project(
    title: json["title"],
    description: json["description"],
    link: json["link"]
  );

  Map<String, dynamic> toJson(){
    return {
      "title": title,
      "description": description,
      "link": link
    };
  }
}
