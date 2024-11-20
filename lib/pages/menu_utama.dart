import 'package:flutter/material.dart';
import 'sample.dart';

class MenuUtama extends StatelessWidget {
  const MenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Management",
          style: TextStyle(
            color: Color.fromARGB(255, 10, 99, 56),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            customMenuWidget(
              text_menu: 'Barang dan Jasa',
              path_image: "assets/images/box.png",
              tujuanNavigasi: const SamplePage(),
            ),
            customMenuWidget(
              text_menu: 'Kategori Barang',
              path_image: "assets/images/kategori.png",
              tujuanNavigasi: const SamplePage(),
            ),
            customMenuWidget(
              text_menu: 'Manajemen Stok',
              path_image: "assets/images/troller.png",
              tujuanNavigasi: const SamplePage(),
            ),
            customMenuWidget(
              text_menu: 'Pelanggan',
              path_image: "assets/images/id.png",
              tujuanNavigasi: const SamplePage(),
            ),
            customMenuWidget(
              text_menu: 'Kasbon',
              path_image: "assets/images/note.png",
              tujuanNavigasi: const SamplePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class customMenuWidget extends StatelessWidget {
  final Widget tujuanNavigasi;
  final String path_image;
  final String text_menu;

  const customMenuWidget({
    super.key,
    required this.tujuanNavigasi,
    required this.path_image,
    required this.text_menu,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => tujuanNavigasi),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              path_image,
              width: 25,
              height: 25,
            ),
            title: Text(
              text_menu,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
