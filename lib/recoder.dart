import 'package:flutter/material.dart';

class RecorderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Genre'),
        backgroundColor: Colors.blue, // Change to the color you desire
        automaticallyImplyLeading: false, // Menghapus tombol kembali
      ),
      body: Container(
        decoration: BoxDecoration(   
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.white], // Yellow to white gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.mic,
                  size: 100,
                ),
                onPressed: () {
                  // Tambahkan logika yang diperlukan ketika tombol di tekan di sini
                },
                color: Colors.blue, // Warna latar belakang tombol
                iconSize: 150, // Ukuran ikon
                splashRadius: 75, // Radius sentuhan pada saat tombol ditekan
                padding: EdgeInsets.all(30), // Padding ikon
                tooltip: 'Record', // Tooltip untuk tombol
              ),
              SizedBox(
                  height: 20), // Spasi antara tombol rekaman dan tombol upload
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika yang diperlukan ketika tombol upload ditekan di sini
                },
                child: Text('Upload File'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
