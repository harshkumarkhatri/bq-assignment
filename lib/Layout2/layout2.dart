import 'package:breakq_assignment/handleClickFunc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout2 extends StatefulWidget {
  Layout2(this.data);
  Map data;

  @override
  _Layout2State createState() => _Layout2State();
}

class _Layout2State extends State<Layout2> {
  bool inital = false;
  double _animatedHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              // This cart is not functional yet.
              // It will be displaying a cocnstant text string.
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15.0, top: 15.0),
              child: ListView(
                children: [
                  Container(
                    child: Text(
                      "${widget.data['productName']}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Brand: " + "${widget.data['productBrand']}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 256,
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.grey)],
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      imageUrl: "${widget.data['productImage']}",
                      placeholder: (context, url) => Container(
                          child: Center(child: new Icon(Icons.image))),
                      errorWidget: (context, url, error) => Container(
                          height: 256,
                          child: new Icon(
                            Icons.broken_image_outlined,
                            size: 256,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Text(
                      "₹" + "${widget.data['productCost']}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                          color: Colors.grey[600]),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Category: " +
                          "${widget.data['productCategory']}"
                              .substring(0, 1)
                              .toUpperCase() +
                          "${widget.data['productCategory']}"
                              .substring(1)
                              .toLowerCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Text(
                      "Available Colors",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "${widget.data['productColor']}"
                              .substring(0, 1)
                              .toUpperCase() +
                          "${widget.data['productColor']}"
                              .substring(1)
                              .toLowerCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Text("About the product",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(height: 1),
                  Container(
                      child: Text(
                    "${widget.data['productSummary']}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                  Divider(),
                  GestureDetector(
                    onTap: () => setState(() {
                      _animatedHeight == 0.0
                          ? _animatedHeight = 100.0
                          : _animatedHeight = 00.0;
                      inital == false ? inital = true : inital = false;
                    }),
                    child: Container(
                      child: Row(
                        children: [
                          Text("Additional Info.",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              )),
                          inital == true
                              ? Icon(Icons.keyboard_arrow_right)
                              : Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                    ),
                  ),
                  inital == true
                      ? Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          children: [
                            TableRow(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Material',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('${widget.data['productMaterial']}',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Availability',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          '${widget.data['productAvailability']}',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Launch date',
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          '${widget.data['productLaunchDate']}'
                                                  .substring(8, 10) +
                                              "/" +
                                              '${widget.data['productLaunchDate']}'
                                                  .substring(5, 7) +
                                              "/" +
                                              '${widget.data['productLaunchDate']}'
                                                  .substring(0, 4),
                                          style: TextStyle(fontSize: 20.0))
                                    ]),
                              ),
                            ]),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 60)
                ],
              ),
            ),
            Container(
              height: 50,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.snackbar(
                            "Redirecting", "Wait, you are being redirected.",
                            backgroundColor: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Colors.black);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0.5),
                        child: Container(
                          color: Colors.black,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2 - 0.5,
                          child: Text(
                            "Buy",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.snackbar("Added",
                            "This product has been added to your cart.",
                            backgroundColor: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Colors.black);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.50),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black,
                          width: MediaQuery.of(context).size.width / 2 - 0.5,
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
