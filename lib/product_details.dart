import 'package:efg_task/shopping_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({this.model});

  final ShoppingModel model;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title:
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap:()=> Navigator.pop(context),child: Icon((Icons.arrow_back),color: Colors.black,)),
                Text(
                  "product details",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                Image.asset("assets/ic_shopping.png"),
              ],
            ),

        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Entry ${widget.model.category}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Text(
                      r'$' + widget.model.price.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              /* Text(
                                        'Entry ${snapshot.data[index].category}'),*/

              Center(
                child: Image.network(
                  widget.model.image,
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.model.description,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Container(
                child: Center(
                    child: Text(
                  "ADD TO CART",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                )),
                height: 50,
                width: MediaQuery.of(context).size.width/1.2,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Color(0xff6c6c93),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            ]),
          ),
        ));
  }
}
