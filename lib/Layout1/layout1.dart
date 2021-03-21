import 'dart:convert';

import 'package:breakq_assignment/Layout2/layout2.dart';
import 'package:breakq_assignment/handleClickFunc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Layout1 extends StatefulWidget {
  @override
  _Layout1State createState() => _Layout1State();
}

class _Layout1State extends State<Layout1> {
  Future fetchingItems() async {
    final resp = await http.get("<LINK-FOR-THE-API-WITHOUT-PRODUCTID>");
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      throw Exception("Api fetching failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Products"),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            // Adding the default drawer provided by flutter
            DrawerHeader(
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                'Item 1',
              ),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: fetchingItems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Container(
                          child: Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Get.to(
                                Layout2(
                                  snapshot.data[index],
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 6, bottom: 6.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        height: 128,
                                        width: 128,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      imageUrl:
                                          "${snapshot.data[index]['productImage']}",
                                      placeholder: (context, url) => Container(
                                        child: Center(
                                          child: new Icon(
                                            Icons.image,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                    ),
                                  ),
                                  Container(
                                    child: Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${snapshot.data[index]['productName']}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                                letterSpacing: 1.2,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Text(
                                                "${snapshot.data[index]['productBrand']}",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.4,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Text(
                                                "₹" +
                                                    "${snapshot.data[index]['productCost']}",
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey[600],
                                                  letterSpacing: 1.2,
                                                  height: 1.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Text(
                                                "${snapshot.data[index]['productSummary']}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  height: 1.5,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 1.1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 5,
                          )
                        ],
                      )),
                    );
                  },
                  itemCount: snapshot.data.length,
                ),
              );
            } else if (snapshot.hasError) {
              return Text("Some unexpected error occured");
            }
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
