import 'package:flutter/material.dart';

void main() {
  runApp(ClothingApp());
}

class ClothingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClothingListScreen(),
    );
  }
}

class ClothingListScreen extends StatelessWidget {
  final List<ClothingItem> items = [
    ClothingItem(
      name: 'Between-Season Jacket Tanja in Black',
      imageUrl: 'https://media.istockphoto.com/id/505623612/photo/leather-jacket.jpg?s=2048x2048&w=is&k=20&c=qrJtiMK4D7nmQRTOgzdVZvzUzMzAr_LsDv0aYthY4Lg=',
      description: 'An exclusive leather jacket, labeled as Tanja.',
      price: '\$130',
    ),
    ClothingItem(
      name: 'DIESEL Wide leg Jeans D-AKII in Black',
      imageUrl: 'https://media.istockphoto.com/id/679327830/photo/womens-jeans-pants-in-black-isolated-on-white-background.jpg?s=2048x2048&w=is&k=20&c=UPTxxVtFhXqLVVqn8TZjdqR8a29FoxBmvUC5xd_BUXg=',
      description: 'Stylish black jeans, with a wide style.',
      price: '\$40',
    ),
    ClothingItem(
      name: 'ABOUT YOU Dress Silvana in Black',
      imageUrl: 'https://media.istockphoto.com/id/185074737/photo/woman-dress.jpg?s=2048x2048&w=is&k=20&c=swO1Y9jYxCKgzK5wolKZvL_lFJ0dJU-KRtXlDUtnYto=',
      description: 'The beautiful, elegant Silvana dress.',
      price: '\$60',
    ),
    ClothingItem(
      name: 'CMP Boots ROHENN in Light Brown',
      imageUrl: 'https://cdn.pixabay.com/photo/2017/07/31/15/06/boot-2558324_1280.jpg',
      description: 'The tall and comfortable ROHENN boots',
      price: '\$139',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('213031'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClothingDetailScreen(item: items[index]),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                        child: Image.network(
                          items[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            items[index].price,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ClothingDetailScreen extends StatelessWidget {
  final ClothingItem item;

  ClothingDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                item.price,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 16),
              Text(
                item.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Implement purchase functionality
                },
                child: Text('Buy Now'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClothingItem {
  final String name;
  final String imageUrl;
  final String description;
  final String price;

  ClothingItem({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}
