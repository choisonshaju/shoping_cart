import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shpoing_cart/core/color_constant/color_constant.dart';
import 'package:shpoing_cart/presentaion/cart_screen/view/cart_screen.dart';
import 'package:shpoing_cart/presentaion/details_screen/view/details_screen.dart';
import 'package:shpoing_cart/presentaion/home_screen/controller/home_screen_controller.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    await Provider.of<HomeController>(context, listen: false).fetchdata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var shopapi = Provider.of<HomeController>(context);
    return Scaffold(
      backgroundColor: ColorConstant.bgcolor,
      appBar: AppBar(
        title: Text("SHOP"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CartScreen(),
            )),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: shopapi.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: shopapi.productlist?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Details_screen(
                              title: shopapi.productlist?[index].title ?? "",
                              description:
                                  shopapi.productlist?[index].description ?? "",
                              image: shopapi.productlist?[index].image ?? "",
                              rating: shopapi.productlist?[index].rating?.rate
                                      .toString() ??
                                  "",
                              price: shopapi.productlist?[index].price
                                      .toString() ??
                                  "",
                              category:
                                  shopapi.productlist?[index].category ?? "",
                              count: shopapi.productlist?[index].rating?.count
                                      .toString() ??
                                  "",
                            ),
                          ),
                        ),
                        child: Container(
                          color: ColorConstant.white,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Center(
                                      child: Image.network(
                                        shopapi.productlist?[index].image ?? "",
                                        fit: BoxFit.contain,
                                        height: 200,
                                        width: 200,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.favorite_border),
                                        iconSize: 30,
                                      ),
                                      Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Text(
                                            shopapi.productlist?[index].rating
                                                    ?.rate
                                                    .toString() ??
                                                "",
                                            style: TextStyle(
                                                color: ColorConstant.green),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                shopapi.productlist?[index].title.toString() ??
                                    "",
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "\$${shopapi.productlist?[index].price.toString() ?? ""}",
                                style: TextStyle(color: ColorConstant.green),
                                textAlign: TextAlign.center,
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
    );
  }
}
