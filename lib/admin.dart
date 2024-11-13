import 'package:flutter/material.dart';

void main() {
  runApp(AdminApp());
}

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

// Login Page for Admin
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainMenuPage()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// Main Menu for Admin
class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Main Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Informasi Booking Sewa'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingInfoPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Pembayaran'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Mengubah Data'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateDataPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.cancel),
            title: Text('Informasi Pembatalan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CancellationInfoPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Booking Information Page
class BookingInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Booking Sewa'),
      ),
      body: Center(
        child: Text(
          'Detail informasi booking sewa akan ditampilkan di sini.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Payment Page
class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),
      body: Center(
        child: Text(
          'Informasi pembayaran akan ditampilkan di sini.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Update Data Page
class UpdateDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mengubah Data'),
      ),
      body: Center(
        child: Text(
          'Form untuk mengubah data akan ditampilkan di sini.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Cancellation Information Page
class CancellationInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Pembatalan'),
      ),
      body: Center(
        child: Text(
          'Detail informasi pembatalan akan ditampilkan di sini.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
