import 'package:flutter/material.dart';
import 'package:simpel_apk/models/product_model.dart';

class ItemProduct extends StatelessWidget {
  ItemProduct({
  super.key,
  required this.barang,
  });
  
  Product barang;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(barang.nama!.substring(0,2).toUpperCase()),
          ),
          SizedBox(
            width: 10
            ),
          Expanded(
            child: Column(
              children: [
                Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${barang.nama}"),
                    Expanded(
                      child: Align(
                      alignment:Alignment.centerRight,
                      child: Text("Jumlah 10")),
                    ),
                  ],
                ),
                Row(
                  
                  children: [
                   Text("Kd Barang ${barang.kode_barang}"),
                   Expanded(
                    child:Align(
                      alignment: Alignment.centerRight,
                    child: Text("Rp. ${barang.harga_jual}")),
                   ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Rp. ${barang.harga_beli}")),
            
              ],
            ),
          ),
        ],
      ),
    );
  }
}
