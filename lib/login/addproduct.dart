import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class AddProdukPage extends StatefulWidget {
  const AddProdukPage({super.key});

  @override
  _AddProdukState createState() => _AddProdukState();
}

class _AddProdukState extends State<AddProdukPage> {
  bool showInTransaction = false;
  bool useStock = false;

  final TextEditingController nameController = TextEditingController(); 
  final TextEditingController productTypeController = TextEditingController(); 
  final TextEditingController codeController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController basicPriceController = TextEditingController();
  final TextEditingController sellingPriceController = TextEditingController();
 
  final _formKey = GlobalKey<FormState>();

  // Fungsi generate kode acak
  String generateRandomCode() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return List.generate(7, (index) => characters[random.nextInt(characters.length)]).join();
  }

  // Fungsi untuk mengisi field dengan data acak
  void isiDataInstan() {
    setState(() {
      nameController.text = "Produk ${Random().nextInt(1000)}";
      productTypeController.text = "Tipe ${Random().nextInt(100)}";
      stockController.text = (Random().nextInt(100) + 1).toString(); // antara 1 hingga 100
      basicPriceController.text = (Random().nextInt(50000) + 10000).toString(); // harga antara 10,000 dan 50,000
      sellingPriceController.text = (Random().nextInt(100000) + 50000).toString(); // harga jual antara 50,000 dan 100,000
      codeController.text = generateRandomCode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Produk",
          style: TextStyle(color: Color.fromARGB(255, 51, 130, 55)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                isiDataInstan(); // Panggil fungsi isiDataInstan
              },
              child: Text(
                "Tambah Instan",
                style: TextStyle(color: Colors.green.shade700, fontSize: 16),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama produk
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Product Type
              TextFormField(
                controller: productTypeController,
                decoration: InputDecoration(
                  labelText: 'Product Type*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product Type harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Checkbox Show in Transaction
              Row(
                children: [
                  Checkbox(
                    value: showInTransaction,
                    onChanged: (bool? value) {
                      setState(() {
                        showInTransaction = value!;
                      });
                    },
                  ),
                  const Text("Show in Transaction"),
                ],
              ),

              // Checkbox Use Stock
              Row(
                children: [
                  Checkbox(
                    value: useStock,
                    onChanged: (bool? value) {
                      setState(() {
                        useStock = value!;
                      });
                    },
                  ),
                  const Text("Use Stock"),
                ],
              ),
              const SizedBox(height: 16),

              // Stock dan Code
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: stockController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Stock*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Stock harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: codeController,
                      decoration: InputDecoration(
                        labelText: 'Code*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Code harus diisi';
                        } else if (value.length != 7) {
                          return 'Code harus terdiri dari 7 karakter';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      String newCode = generateRandomCode();
                      codeController.text = newCode;
                      print("Kode di-refresh: $newCode");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Basic Price dan Selling Price
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: basicPriceController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Basic Price*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Basic price harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: sellingPriceController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Selling Price*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Selling price harus diisi';
                        }
                        if (int.parse(value) < int.parse(basicPriceController.text)) {
                          return 'Selling price tidak boleh lebih kecil dari Basic price';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Margin keuntungan
              const Text(
                "Margin keuntungan 50.0%",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),

              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double basicPriceValue = double.tryParse(basicPriceController.text) ?? 0;
                      double sellingPriceValue = double.tryParse(sellingPriceController.text) ?? 0;
                      
                      double marginKeuntungan = ((sellingPriceValue - basicPriceValue) / sellingPriceValue) * 100;
                      print('Data valid dan disimpan');
                      print('Nama: ${nameController.text}'); 
                      print('Tipe Produk: ${productTypeController.text}');
                      print('Stock: ${stockController.text}'); 
                      print('Code: ${codeController.text}'); 
                      print('Basic Price: ${basicPriceController.text}'); 
                      print('Selling Price: ${sellingPriceController.text}'); 
                      print('Margin Keuntungan: ${marginKeuntungan.toStringAsFixed(2)}%'); 
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Simpan", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
