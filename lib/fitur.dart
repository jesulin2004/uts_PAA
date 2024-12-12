import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FiturScreen(),
  ));
}

class FiturScreen extends StatefulWidget {
  const FiturScreen({super.key});

  @override
  State<FiturScreen> createState() => _FiturScreenState();
}

class _FiturScreenState extends State<FiturScreen> {
  void _navigateToDetail(String title, String ingredients, String tools,
      String steps, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          title: title,
          ingredients: ingredients,
          tools: tools,
          steps: steps,
          imagePath: imagePath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 56, 76),
        title: const Text(
          'Resep Masakan',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/latarr.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildCard(
                'Ramen',
                'Mie, Kaldu, Topping (telur, daging, sayuran)',
                'Panci, Mangkuk',
                '1. Rebus mie\n2. Tambahkan kaldu\n3. Masukkan topping',
                'assets/ramen.jpeg'),
            _buildCard(
                'Ice Cream',
                'Susu, Gula, Cokelat',
                'Mangkuk, Freezer',
                '1. Campurkan susu, gula, dan cokelat\n2. Bekukan di freezer\n3. Sajikan',
                'assets/eskrim.jpeg'),
            _buildCard(
                'Cake',
                'Tepung, Telur, Gula',
                'Mixer, Oven',
                '1. Kocok telur dan gula\n2. Tambahkan tepung\n3. Panggang di oven',
                'assets/cake.jpeg'),
            _buildCard(
                'Pizza',
                'Tepung, Saus, Topping',
                'Oven, Loyang',
                '1. Buat adonan\n2. Tambahkan topping\n3. Panggang di oven',
                'assets/pizza.jpeg'),
            _buildCard(
                'Burger',
                'Daging, Sayuran, Roti',
                'Grill, Pisau',
                '1. Panggang patty\n2. Susun dengan sayuran\n3. Sajikan dengan roti',
                'assets/burger.jpeg'),
            _buildCard(
                'Sushi',
                'Nasi, Nori, Ikan',
                'Makisu (alat penggulung), Pisau',
                '1. Siapkan nasi dan nori\n2. Tambahkan ikan\n3. Gulung dan potong',
                'assets/sushi.jpeg'),
            _buildCard(
                'Steak',
                'Daging, Bumbu, Saus',
                'Grill, Pisau',
                '1. Bumbui daging\n2. Panggang hingga matang\n3. Sajikan dengan saus',
                'assets/steak.jpeg'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String ingredients, String tools,
      String steps, String imagePath) {
    return SizedBox(
      height: 120,
      child: Card(
        elevation: 3,
        color: Colors.white.withOpacity(0.9),
        child: ListTile(
          leading: _getIconByTitle(title),
          title: Text(title),
          subtitle: const Text('Klik untuk melihat langkah-langkah.'),
          onTap: () =>
              _navigateToDetail(title, ingredients, tools, steps, imagePath),
        ),
      ),
    );
  }

  Icon _getIconByTitle(String title) {
    switch (title) {
      case 'Ramen':
        return const Icon(Icons.ramen_dining, color: Colors.blue);
      case 'Ice Cream':
        return const Icon(Icons.icecream, color: Colors.green);
      case 'Cake':
        return const Icon(Icons.cake, color: Colors.orange);
      case 'Pizza':
        return const Icon(Icons.local_pizza, color: Colors.red);
      case 'Burger':
        return const Icon(Icons.fastfood, color: Colors.purple);
      case 'Sushi':
        return const Icon(Icons.set_meal, color: Colors.teal);
      case 'Steak':
        return const Icon(Icons.dinner_dining, color: Colors.brown);
      default:
        return const Icon(Icons.restaurant, color: Colors.grey);
    }
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String ingredients;
  final String tools;
  final String steps;
  final String imagePath;

  const DetailScreen({
    super.key,
    required this.title,
    required this.ingredients,
    required this.tools,
    required this.steps,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 56, 76),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/latarr.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imagePath,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildSection('Bahan-Bahan:', ingredients),
                const SizedBox(height: 20),
                _buildSection('Alat-Alat:', tools),
                const SizedBox(height: 20),
                _buildSection('Langkah-Langkah:', steps),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
