

class Product {
  final String name;
  final String price;
  final String imagepath, description;
  final String category;

  Product(
      {required this.name,
      required this.price,
      required this.imagepath,
      required this.description,
      required this.category
      });

  // static List<Product> products = [
  //   Product(
  //       name: "RhineStone",
  //       price: 15.0,
  //       imagepath: //"https: //th.bing.com/th/id/R.24063c5f2c10405713d22f0514724ae9?rik=AoGOrs5Fj57JyA&pid=ImgRaw&r=0",
  //           "images/Rhine.png",
  //       description: "The Forward-thinking design Shoe"),
  //   Product(
  //       name: "Gym shoe",
  //       price: 10.0,
  //       imagepath: //"https: //www.pngarts.com/files/3/Women-Running-Shoes-PNG-Image.png",
  //           "images/gym.png",
  //       description: "Release your stress"),
  //   Product(
  //       name: "Attire",
  //       price: 18.0,
  //       imagepath: //"https: //pngimg.com/uploads/women_shoes/women_shoes_PNG7438.png",
  //           "images/party.png",
  //       description: "Style it with Confidence"),
  //   Product(
  //       name: "Nike Shoe",
  //       price: 15.0,
  //       imagepath: //"https: //www.depthlog.com/images/large/nike%20female%20shoes-393xtz.jpg",
  //           "images/Shoe1.jpg",
  //       description: "The Forward-thinking design Shoe"),
  //   Product(
  //       name: "Office shoe",
  //       price: 12.0,
  //       imagepath: //"https: //th.bing.com/th/id/R.9bdf9cebc278caba632af7e5df172783?rik=Rot8d0S21L9eTQ&riu=http%3a%2f%2fpngimg.com%2fuploads%2fwomen_shoes%2fwomen_shoes_PNG7442.png&ehk=kMXd%2bfJ%2fcxITIRc1zOwvux7Ib9Ohvr9rHAHwncy8IF8%3d&risl=&pid=ImgRaw&r=0",
  //           "images/office.png",
  //       description: "The Forward-thinking design Shoe"),
  // ];
  // static Product fromSnapshot(DocumentSnapshot snap){
  //   Product product= Product(
  //     name: snap['name'], 
  //     price: snap['price'], 
  //     imagepath: snap['imagepath'], 
  //     description: snap['description'],
  //     category: snap['category']
  //    );
  //     return product;
  // }
   factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      name: data['name'] ?? '',
      price: data['price'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? '', 
      imagepath: data['imagepath'] ?? '',
    );
  }
}

