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
      home: MainMenu(),
    );
  }
}

class Sport {
  final String name;
  final String imageUrl;
  final String description;
  final String location;
  final double price;

  Sport({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.location,
    required this.price,
  });
}

// Main Menu (Menu Utama)
class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SportListPage()),
            );
          },
          child: Text('Daftar Tempat Olahraga'),
        ),
      ),
    );
  }
}

// Daftar Tempat Olahraga
class SportListPage extends StatelessWidget {
  final List<Sport> sports = [
    Sport(
      name: 'Gym',
      imageUrl: 'istockphoto-1391410249-612x612.jpg',
      description: 'Tempat terbaik untuk berolahraga dan menjaga kebugaran.',
      location: 'Jakarta',
      price: 50000,
    ),
    Sport(
      name: 'Lapangan Tenis',
      imageUrl: '16755829300.png',
      description: 'Lapangan tenis profesional untuk semua level.',
      location: 'Bandung',
      price: 75000,
    ),
    Sport(
      name: 'Futsal',
      imageUrl: 'images.jpeg',
      description: 'Lapangan futsal yang nyaman untuk bermain bersama teman.',
      location: 'Surabaya',
      price: 60000,
    ),
    Sport(
      name: 'Basket',
      imageUrl: '730-e1708318015613.jpg',
      description: 'Lapangan basket untuk menyalurkan hobi Anda.',
      location: 'Bali',
      price: 70000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Tempat Olahraga'),
      ),
      body: ListView.builder(
        itemCount: sports.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(sports[index].imageUrl, width: 50, height: 50),
            title: Text(sports[index].name),
            subtitle: Text('${sports[index].location} - Rp${sports[index].price}'),
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
    );
  }
}

// Lihat Tempat Olahraga
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
                MaterialPageRoute(builder: (context) => DateTimeSelectionPage(sport: sport)),
              );
            },
            child: Text('Pilih Tanggal dan Waktu'),
          ),
        ],
      ),
    );
  }
}

// Pilih Tanggal dan Waktu
class DateTimeSelectionPage extends StatelessWidget {
  final Sport sport;

  const DateTimeSelectionPage({required this.sport});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Tanggal dan Waktu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pilih tanggal dan waktu untuk ${sport.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Mock date and time selection (could be DatePicker in real app)
            TextField(
              decoration: InputDecoration(labelText: 'Tanggal (DD/MM/YYYY)'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Waktu (HH:MM)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // For demonstration, we’ll assume the slot is available
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(sport: sport),
                  ),
                );
              },
              child: Text('Cek Ketersediaan Slot'),
            ),
          ],
        ),
      ),
    );
  }
}

// Sewa (Booking)
class BookingPage extends StatelessWidget {
  final Sport sport;

  const BookingPage({required this.sport});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sewa ${sport.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pemesan untuk ${sport.name}',
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
                // Mock booking confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pemesanan berhasil!')),
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
