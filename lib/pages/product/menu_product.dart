import 'package:flutter/material.dart';
import 'package:simpel_apk/models/product_model.dart';
import 'package:simpel_apk/pages/product/item_product.dart';

class MenuProduct extends StatefulWidget {
  const MenuProduct({super.key});

  @override
  State<MenuProduct> createState() => _MenuProductState();
}

class _MenuProductState extends State<MenuProduct> {
  
  List products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  void setData() {
    products = [
      Product(
        nama: "Chocolatos",
        harga_beli: 1000,
        harga_jual: 2000,
        kode_barang: "KSR00001",
        stok: 10
      ),
      Product(
        nama: "Sari Roti Double Choco",
        harga_beli: 10000,
        harga_jual: 12000,
        kode_barang: "KSR00002",
        stok: 5,
      ),
      Product(
        nama: "Shelley Panggang",
        harga_beli: 3000,
        harga_jual: 3500,
        kode_barang: "KSR00003",
        stok: 1,
      ),
      Product(
        nama: "Shelley Panggang",
        harga_beli: 3000,
        harga_jual: 3500,
        kode_barang: "KSR00003",
        stok: 1,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: (){},
          child: Text("Add Product"),
        ),
      ),
      appBar: AppBar(
        title: Text("Produk"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ItemProduct(
            barang: products[index],
          );
        },
),
);
}
}