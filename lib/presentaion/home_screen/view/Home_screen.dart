import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    await Provider.of<Api>(context, listen: false).fetchdata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var shopapi = Provider.of<Api>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("SHOP"),
        centerTitle: true,
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: shopapi.apilist?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Details_screen(
                        title: shopapi.apilist?[index].title ?? "",
                        description: shopapi.apilist?[index].description ?? "",
                        image: shopapi.apilist?[index].image ?? "",
                        rating:
                            shopapi.apilist?[index].rating?.rate.toString() ??
                                "",
                        price: shopapi.apilist?[index].price.toString() ?? "",
                        category: shopapi.apilist?[index].category ?? "",
                        count:
                            shopapi.apilist?[index].rating?.count.toString() ??
                                "",
                      ),
                    ),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                child: Image.network(
                                  shopapi.apilist?[index].image ?? "",
                                  fit: BoxFit.contain,
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border),
                                  iconSize: 30,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text(
                                      shopapi.apilist?[index].rating?.rate
                                              .toString() ??
                                          "",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          shopapi.apilist?[index].title.toString() ?? "",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "\$${shopapi.apilist?[index].price.toString() ?? ""}",
                          style: TextStyle(color: Colors.green),
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
