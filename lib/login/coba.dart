import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  // Checkbox states
  bool showInTransaction = false;
  bool useStock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        actions: [
          TextButton(
            onPressed: () {
              // Tambah Instan logic
            },
            child: const Text(
              "Tambah Instan",
              style: TextStyle(color: Color.fromARGB(255, 19, 164, 34)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Name
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Product Type (diubah menjadi TextField)
              TextField(
                decoration: InputDecoration(
                  labelText: 'Product Type*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Checkbox: Show in Transaction
              CheckboxListTile(
                title: const Text("Show in Transaction"),
                value: showInTransaction,
                onChanged: (bool? value) {
                  setState(() {
                    showInTransaction = value ?? false;
                  });
                },
              ),

              // Checkbox: Use Stock
              CheckboxListTile(
                title: const Text("Use Stock"),
                value: useStock,
                onChanged: (bool? value) {
                  setState(() {
                    useStock = value ?? false;
                  });
                },
              ),

              const SizedBox(height: 16.0),

              // Stock & Code
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Stock*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Code*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      // Logic untuk generate kode baru
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Basic Price & Selling Price
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Basic Price*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Selling Price*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Category (diubah menjadi TextField)
              TextField(
                decoration: InputDecoration(
                  labelText: 'Category*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Simpan button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Simpan logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
