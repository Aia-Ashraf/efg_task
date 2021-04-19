import 'package:efg_task/product_details.dart';
import 'package:efg_task/shopping_model.dart';
import 'package:efg_task/shopping_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(title: 'All Products'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ShoppingRepository _repository = ShoppingRepository();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            Image.asset("assets/ic_shopping.png")
          ],
        ),
      ),
      body: FutureBuilder<List<ShoppingModel>>(
          future: _repository.getShoppingList(),
          builder: (context, snapshot) {
            return Center(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(model: snapshot.data[index]),
                          ),
                        ),
                        child: Card(
                          child: Row(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Text(
                                      'Entry ${snapshot.data[index].category}',
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  /* Text(
                                      'Entry ${snapshot.data[index].category}'),*/
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.7,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 70.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [
                                                  Colors.blue,
                                                  Color(0xff6c6c93),
                                                ],
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.favorite_border,color: Colors.white,),
                                                  SizedBox(width: 5,),
                                                  Icon(Icons.upload_outlined,color: Colors.white),
                                                  SizedBox(width: 5,),

                                                  Icon(Icons.more_vert,color: Colors.white),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(r'$' +
                                              snapshot.data[index].price
                                                  .toString(),    style: TextStyle(
                                              fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // shadow direction: bottom right
                                  )
                                ],
                              ),
                              child: Image.network(
                                snapshot.data[index].image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ]),
                        ),
                      );
                    }));
          }),
    );
  }
}
