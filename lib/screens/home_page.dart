import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/cart_screen.dart';
import 'package:shopping_cart/screens/catalog_screen.dart';
import 'package:shopping_cart/screens/kids_catalog.dart';
import 'package:shopping_cart/screens/menCatalog.dart';
import 'package:shopping_cart/screens/signin_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  //  final CartController controller = Get.find();
  // int _Selectedindex = 0;
  // void navigateBottombar(int index) {
  //   setState(() {
  //     _Selectedindex = index;
  //   });
  // }
  // final List<Widget> _pages = [
  //   CatalogScreen(),
  //   CartScreen(),
  // ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: 
          [
            Tab(text: "Women",),
            Tab(text: "Men",),
            Tab(text: "Kids",)
          ]),
          title: Center(child: Text("Shoe Spark",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          )),
          
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions:[ Builder(builder: (context) {
            return IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Badge(
                  label: Text('2'),
                  //'$controller.products.length'),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder:((context) => CartScreen())));
              },
            );
          }),
          ] 
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                      child: Image.network(
                    "https://th.bing.com/th/id/R.b9bd98e0d6dba728c675a276f0ede1af?rik=4ECPGMPXui7g5A&riu=http%3a%2f%2f1000marcas.net%2fwp-content%2fuploads%2f2021%2f06%2fFoot-Shop-logo.png&ehk=ih8XSqPmXMNutNZ22kZli1tla3OEewFC5qsPCEcER3c%3d&risl=&pid=ImgRaw&r=0",
                    color: Colors.white,
                  )),
                  Text(
                    user.email!,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: Colors.grey[800],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      onTap: () => CatalogScreen(),
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        "About",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom: 25),
                child: ListTile(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    });
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.grey[300],
        floatingActionButton:  Container(
          height: 70,
          width: 80,
          child: FloatingActionButton(
            tooltip: 'Check your Cart',
          shape: CircleBorder(),
            elevation: 0.0,
            child: new Icon(Icons.shopping_bag, color: Colors.grey[700],size: 40,),
            backgroundColor:Colors.grey.shade100,
              onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder:((context) => CartScreen())));
              } ), ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  
        // bottomNavigationBar: BottomNavbar(
        //   onTabChange: (index) => _Selectedindex,
        //   //navigateBottombar(index),
        // ),
        body:TabBarView(
          children: [
            CatalogScreen(),
            MenCatalogScreen(),
            KidsCatalogScreen(),
        ],),
        
        //  _pages[_Selectedindex],
      ),
    );
  }
}
