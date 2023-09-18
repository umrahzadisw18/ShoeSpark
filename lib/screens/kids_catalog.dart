import 'package:flutter/material.dart';
import 'package:shopping_cart/widget/kids_product.dart';

class KidsCatalogScreen extends StatefulWidget {
  const KidsCatalogScreen({super.key});

  @override
  State<KidsCatalogScreen> createState() => _KidsCatalogScreenState();
}

class _KidsCatalogScreenState extends State<KidsCatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Column(
        children: [
        SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: 35,
              child: TextField(
                //     onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //     "search",
            //       style: TextStyle(color: Colors.grey),
            //     ),
            //     Icon(
            //       Icons.search,
            //       color: Colors.grey,
            //     ),
            //   ],
            // ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot Picks 🔥",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        KidsProducts(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Divider(
              color: Colors.white,
            ),
          ),
           SizedBox(height: 70,),
        ],
      )),
    );
  }
}