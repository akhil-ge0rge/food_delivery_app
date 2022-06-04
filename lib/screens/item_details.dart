import 'package:flutter/material.dart';
import 'package:food_delivery_app/util/data_list.dart';
import 'package:food_delivery_app/widgets/ingredients_widget.dart';

class ItemDetails extends StatefulWidget {
  var image;
  var rating;
  var title;
  var price;
  var desc;
  var ind;
  ItemDetails({
    Key? key,
    this.image,
    this.rating,
    this.title,
    this.desc,
    this.price,
    this.ind,
  }) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    // int s = 0;
    // for (int i = 0; i < dataList.length; i++) {
    //   s = s + 1;
    // }
    // print(dataList[1]['ingredients'].length);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      //   leading: Container(
      //     margin: EdgeInsets.only(left: 25),
      //     child: Icon(
      //       Icons.arrow_back_ios,
      //       size: 23,
      //     ),
      //   ),
      //   title: Text(
      //     "Details",
      //     style: TextStyle(
      //       fontSize: 24,
      //       fontFamily: 'Roboto',
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   actions: [
      //     Icon(
      //       Icons.favorite,
      //       size: 23,
      //     ),
      //     SizedBox(
      //       width: 25,
      //     ),
      //   ],
      // ),
      body: Container(
        //   color: Colors.amber,
        // ),
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // color: Colors.blue,
                  margin: EdgeInsets.only(right: 80),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 23,
                    ),
                  ),
                ),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  margin: EdgeInsets.only(left: 80),
                  child: Icon(
                    Icons.favorite,
                    size: 23,
                  ),
                ),
              ],
            ),
            Image(
              height: 300,
              width: 300,
              image: AssetImage(widget.image),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 70,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                        size: 20,
                      ),
                      // SizedBox(
                      //   width: 8,
                      // ),
                      Text(
                        widget.rating.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(.1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.remove,
                        color: Colors.grey,
                      ),
                      Text(
                        "1",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              // color: Colors.black,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: dataList[widget.ind]['ingredients'].length,
                itemBuilder: ((context, index) {
                  return IngreWidget(
                      ingImg: dataList[widget.ind]['ingredients'][index]
                          ['incImage'],
                      ingName: dataList[widget.ind]['ingredients'][index]
                          ['incName']);
                }),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 120,
              // color: Colors.blueAccent,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.transparent,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          child: Text(
                            widget.desc,
                            textAlign: TextAlign.justify,
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 1,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xfffffefe).withOpacity(.9),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-5, -20), // Shadow position
                          ),
                        ],
                      ),
                      height: 50,
                      width: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(children: [
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(0.0, -5.0),
                                    child: Container(
                                      margin: EdgeInsets.only(right: 3),
                                      child: Text(
                                        '\$',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(.8),
                                          fontSize: 15,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: widget.price.toString(),
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.8),
                                    fontSize: 25,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ]),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.2),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: Offset(0, 2), // Shadow position
                                  ),
                                ],
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
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
          ],
        ),
      ),
    );
  }
}
