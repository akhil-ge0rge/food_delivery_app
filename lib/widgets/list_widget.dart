import 'package:flutter/material.dart';
import 'package:food_delivery_app/util/data_list.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../util/favList.dart';

class ListWid extends StatefulWidget {
  final String image;

  final String title;
  var rating;
  var km;
  var price;
  var isFav;
  var indexL;
  ListWid({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
    required this.km,
    required this.price,
    required this.isFav,
    required this.indexL,
  }) : super(key: key);

  @override
  State<ListWid> createState() => _ListWidState();
}

class _ListWidState extends State<ListWid> {
  // bool isFav = false;
  // var favListIndex;

  @override
  Widget build(BuildContext context) {
    // for (int i = 0; i < favList.length; i++) {
    //   if (favList[i]['title'] == widget.title) {
    //     isFav = true;
    //     favListIndex = i;
    //     setState(() {});
    //     break;
    //   }
    // }
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      height: 30,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            spreadRadius: .1,
            blurRadius: 6,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
        color: const Color(0xfffffefe),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15, top: 10),
            alignment: Alignment.topRight,
            child: Container(
              alignment: Alignment.center,
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 254, 219, 228).withOpacity(.6),
              ),
              child: GestureDetector(
                onTap: () {
                  if (widget.isFav == true) {
                    favList.removeAt(widget.indexL);
                    widget.isFav = false;
                  } else {
                    favList.add({
                      'title': widget.title,
                      'img': widget.image,
                      'price': widget.price,
                    });
                    widget.isFav = true;
                  }
                  setState(() {});
                },
                child: widget.isFav == true
                    ? Icon(
                        Icons.favorite,
                        size: 25,
                        color: Colors.redAccent.withOpacity(.9),
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.grey[50],
                        size: 25,
                      ),
              ),
            ),
          ),
          Image(
            height: 120,
            width: 120,
            image: AssetImage(widget.image),
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.orangeAccent,
                size: 20,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                widget.rating.toString(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${widget.km.toString()} km",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(children: [
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(0.0, -7.0),
                  child: Container(
                    margin: EdgeInsets.only(right: 3),
                    child: Text(
                      '\$',
                      style: TextStyle(
                        color: Colors.orangeAccent.withOpacity(.8),
                        fontSize: 11,
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
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
