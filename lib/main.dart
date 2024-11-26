import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(), // Wrap MyApp with MaterialApp
  ));
}

class MyApp extends StatefulWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Фустан',
      'image': 'assets/images/dress.jpg',
      'description': 'Црн краток фустан со долги ракави',
      'price': '1200 ден'
    },
    {
      'name': 'Панталони',
      'image': 'assets/images/pants.webp',
      'description': 'Кремасти широки панталони за секојдневна употреба',
      'price': '700 ден'
    },
    {
      'name': 'Јакна',
      'image': 'assets/images/jacket.jpg',
      'description': 'Зимска кожена јакна',
      'price': '2500 ден'
    },
    {
      'name': 'Блуза',
      'image': 'assets/images/blouse.webp',
      'description': 'Топла розева блуза',
      'price': '600 ден'
    },
    {
      'name': 'Фармерки',
      'image': 'assets/images/jeans.jpg',
      'description': 'Сини фармерки со широка ногавица',
      'price': '1000 ден'
    },
    {
      'name': 'Кратка маица',
      'image': 'assets/images/croptop.jpg',
      'description': 'Кратка crop top маица со врвки',
      'price': '400 ден'
    },
    {
      'name': 'Сукња',
      'image': 'assets/images/skirt.jpg',
      'description': 'Кратка црна тенисерска сукња',
      'price': '550 ден'
    },
    {
      'name': 'Кратки панталони',
      'image': 'assets/images/short_pants.webp',
      'description': 'Кратка зелени памучни панталони',
      'price': '750 ден'
    },
  ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('211055'),
          backgroundColor: Color.fromRGBO(255, 153, 153, 1),
        ),
        backgroundColor: Color.fromRGBO(255, 229, 204, 1),
        body: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            final product = widget.products[index];
            return Card(
              margin: const EdgeInsets.all(10),
              color: const Color.fromRGBO(255, 255 , 204, 1),
              child: ListTile(
                leading:
                  Image.asset(
                    product['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover, // Adjust how the image fits in the box
                  ),
                title: Text(product['name']!),
                subtitle: Text(product['price']!),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(product: product),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
        backgroundColor: Color.fromRGBO(255, 153, 153, 1),
      ),
      backgroundColor: Color.fromRGBO(255, 229, 204, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product['image']!,
              width: 200,
              height: 200,
              fit: BoxFit.cover, // Adjust how the image fits in the box
            ),
            SizedBox(height: 16),
            Text(
              product['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product['description']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Цена: ${product['price']}',
              style: TextStyle(fontSize: 18, color: Color.fromRGBO(0, 102, 0, 1)),
            ),
          ],
        ),
      ),
    );
  }
}

