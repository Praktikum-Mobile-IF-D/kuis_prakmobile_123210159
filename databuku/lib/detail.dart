import 'package:flutter/material.dart';
import 'package:databuku/data_buku.dart';

class DetailPage extends StatefulWidget {
  final DataBuku listBuku;

  DetailPage({Key? key, required this.listBuku});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listBuku.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.listBuku.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Image.network(
                widget.listBuku.imageLink,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Country:"),
                    Text(widget.listBuku.country),
                  ],
                ),
                Column(
                  children: [
                    Text("Language:"),
                    Text(widget.listBuku.language),
                  ],
                ),
                Column(
                  children: [
                    Text("Author:"),
                    Text(widget.listBuku.author),
                  ],
                ),
                Column(
                  children: [
                    Text("Pages:"),
                    Text(widget.listBuku.pages.toString()),
                  ],
                ),
                Column(
                  children: [
                    Text("Year:"),
                    Text(widget.listBuku.year.toString()),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Link: ${widget.listBuku.link}",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isAvailable ? () => _pinjamBuku() : null,
              child: Text("Pinjam"),
            ),
          ],
        ),
      ),
    );
  }

  void _pinjamBuku() {
    // Lakukan perubahan status buku dan tindakan lain yang diperlukan
    setState(() {
      isAvailable = false;
    });
  }
}
