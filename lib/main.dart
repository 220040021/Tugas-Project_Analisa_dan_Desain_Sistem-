import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class Sport {
  final String name;
  final String imageUrl;
  final String description;

  Sport({required this.name, required this.imageUrl, required this.description});
}

class HomePage extends StatelessWidget {
  final List<Sport> sports = [
    Sport(
      name: 'Gym',
      imageUrl: 'istockphoto-1391410249-612x612.jpg',
      description: 'Tempat terbaik untuk berolahraga dan menjaga kebugaran.',
    ),
    Sport(
      name: 'Lapangan Tenis',
      imageUrl: '16755829300.png',
      description: 'Lapangan tenis profesional untuk semua level.',
    ),
    Sport(
      name: 'Futsal',
      imageUrl: 'images.jpeg',
      description: 'Lapangan futsal yang nyaman untuk bermain bersama teman.',
    ),
    Sport(
      name: 'Basket',
      imageUrl: '730-e1708318015613.jpg',
      description: 'Lapangan basket untuk menyalurkan hobi Anda.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistem Pemesanan Tempat Olahraga'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Temukan Tempat Olahraga Anda',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: sports.length,
              itemBuilder: (context, index) {
                return SportCard(
                  sport: sports[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SportDetailPage(sport: sports[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SportCard extends StatelessWidget {
  final Sport sport;
  final VoidCallback onTap;

  const SportCard({
    required this.sport,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Image.asset(sport.imageUrl, fit: BoxFit.cover, height: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                sport.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SportDetailPage extends StatelessWidget {
  final Sport sport;

  const SportDetailPage({required this.sport});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sport.name),
      ),
      body: Column(
        children: [
          Image.asset(sport.imageUrl, fit: BoxFit.cover, height: 250),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              sport.description,
              style: TextStyle(fontSize: 18),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingPage(sport: sport)),
              );
            },
            child: Text('Pesan Sekarang'),
          ),
        ],
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  final Sport sport;

  const BookingPage({required this.sport});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan ${sport.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pesanan untuk ${sport.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk melakukan pemesanan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pemesan berhasil dibuat!')),
                );
              },
              child: Text('Kirim Pemesanan'),
            ),
          ],
        ),
      ),
    );
  }
}
