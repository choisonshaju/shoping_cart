import 'package:flutter/material.dart';
import 'package:shpoing_cart/presentaion/cart_screen/view/cart_screen.dart';

class Details_screen extends StatefulWidget {
  const Details_screen(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.rating,
      required this.price,
      required this.category,
      required this.count});
  final String title;
  final String description;
  final String image;
  final String rating;
  final String price;
  final String category;
  final String count;
  @override
  State<Details_screen> createState() => _Details_screenState();
}

class _Details_screenState extends State<Details_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAILS"),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CartScreen(),
            )),
            child: Text(
              "Add To Cart",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    child: Image.network(widget.image),
                  ),
                  Positioned(
                    right: 20,
                    child: Text(
                      widget.rating,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "\$${widget.price} /Price lncl. all Taxes",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "\Items : ${widget.count} \left",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
