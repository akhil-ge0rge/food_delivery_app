import 'package:flutter/material.dart';
import 'package:food_delivery_app/util/data_list.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListWid extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String km;
  final String price;
  ListWid({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
    required this.km,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                color: Color(0xfffef2f5).withOpacity(.6),
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.redAccent.withOpacity(.9),
              ),
            ),
          ),
          Image(
            height: 120,
            width: 120,
            image: AssetImage(image),
          ),
          Text(
            title,
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
                rating.toString(),
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
                "${km} km",
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
                text: price,
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
