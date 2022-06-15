import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/cart_screen.dart';
import 'package:food_delivery_app/util/data_list.dart';
import 'package:food_delivery_app/widgets/ingredients_widget.dart';

import '../util/favList.dart';
import '../widgets/list_widget.dart';

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
  var count = 1;
  var newPrice;
  bool isCart = false;
  var CartListIndex;
  bool itemIsFav = false;
  var itemFavIndex;
  @override
  Widget build(BuildContext context) {
    if (newPrice == null) {
      setState(() {
        newPrice = widget.price;
      });
    }
    var totalPrice = widget.price;

    for (int i = 0; i < CartList.length; i++) {
      if (CartList[i]['title'] == widget.title) {
        isCart = true;
        CartListIndex = i;
        setState(() {});
        break;
      }
    }

    for (int i = 0; i < favList.length; i++) {
      if (favList[i]['title'] == widget.title) {
        itemIsFav = true;
        itemFavIndex = i;
        setState(() {});
        break;
      }
    }

    return Scaffold(
      body: Container(
        //   color: Colors.amber,
        // ),
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
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
                  child: GestureDetector(
                    onTap: () {
                      if (itemIsFav == true) {
                        favList.removeAt(itemFavIndex);
                        itemIsFav = false;
                      } else {
                        favList.add({
                          'title': widget.title,
                          'img': widget.image,
                          'price': widget.price,
                        });

                        itemIsFav = true;
                      }
                      setState(() {});
                    },
                    child: itemIsFav == true
                        ? Icon(Icons.favorite,
                            size: 25, color: Colors.redAccent.withOpacity(.9))
                        : Icon(
                            Icons.favorite_border_outlined,
                            size: 25,
                          ),
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (count > 1) {
                              count--;
                            }
                            newPrice = totalPrice * count;
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        count.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            count++;
                            newPrice = totalPrice * count;
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
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
                                  text: newPrice.toString(),
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
                          GestureDetector(
                            onTap: () {
                              if (isCart == true) {
                                CartList[CartListIndex]['count'] = count;

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 20, bottom: 100, right: 20),
                                        dismissDirection:
                                            DismissDirection.horizontal,
                                        content: Text("Cart List Updated"),
                                        duration: Duration(seconds: 1)));
                              } else {
                                CartList.add({
                                  'image': widget.image,
                                  "title": widget.title,
                                  "price": totalPrice,
                                  "count": count
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 20, bottom: 100, right: 20),
                                        dismissDirection:
                                            DismissDirection.horizontal,
                                        content: Text("Cart List Updated"),
                                        duration: Duration(seconds: 1)));
                              }
                              setState(() {});
                            },
                            child: Container(
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
                                isCart == true ? "Update Cart" : "Add to cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
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
          ],
        ),
      ),
    );
  }
}
