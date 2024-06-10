import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shpoing_cart/core/color_constant/color_constant.dart';
import 'package:shpoing_cart/presentaion/home_screen/controller/home_screen_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartprovider = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("CART"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cartprovider.mybox.length,
          itemBuilder: (context, index) {
            var product = cartprovider.mybox.getAt(index);
            return ListTile(
              leading: ClipRRect(
                child: Image.network(product["image"] ?? ""),
              ),
              title: Text(product["title"]),
              subtitle: Text(
                product["price"],
                style: TextStyle(
                  color: ColorConstant.green,
                ),
              ),
              trailing: ElevatedButton(
                  onPressed: () {
                    cartprovider.delete(index);
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Item Removed"),
                        backgroundColor: ColorConstant.snackbar,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text("Remove")),
            );
          }),
    );
  }
}
