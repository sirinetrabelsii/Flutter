import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class gallerieDetailsPage extends StatefulWidget {
  final String image;
  gallerieDetailsPage(this.image);

  @override
  _GallerieDetailsPageState createState() => _GallerieDetailsPageState();
}

class _GallerieDetailsPageState extends State<gallerieDetailsPage> {
  @override
  var gallerieData;
  int currentPage = 1;
  int size = 10;
  int totalPages = 0;
  List<dynamic> hits = [];
  void initState() {
    super.initState();
    getGallerieData(widget.image);
  }

  void getGallerieData(String image) {
    print("image " + image);
    String url =
        "https://pixabay.com/api/?key=40009359-89bd7d67403225d01ba33a825&q=$image&page=$currentPage&per_page=$size";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.gallerieData = json.decode(resp.body);
        hits = gallerieData['hits'];
        print(hits);
      });
      print(this.gallerieData);
    }).catchError((err) {
      print(err);
    });
  }

  ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                "Page Gallery ${widget.image} ${totalPages == 0 ? '0 Résultat' : 'Page $currentPage/$totalPages'}")),
        body: gallerieData == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                controller: _scrollController,
                itemCount: (hits.length),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(hits[index]['largeImageURL'],
                              fit: BoxFit.fitWidth),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(hits[index]['tags'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                  );
                }));
  }
}
