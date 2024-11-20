import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ini Halaman Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "DAFTAR AKUN",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),

            // Nama
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Email
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Password
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: Icon(Icons.visibility),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),

            // Nomor Telepon
            Row(
              children: [
                Container(
                  width: 70,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: '+62',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    enabled: false, // Disabled field for country code
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Nomor Telepon',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Kode Referral (Optional)
            TextField(
              decoration: const InputDecoration(
                labelText: 'Kode Referral (jika ada)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // Syarat Ketentuan
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Dengan mendaftar, Anda telah menyetujui Syarat Ketentuan & Kebijakan Privasi",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Tombol Daftar
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "DAFTAR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 16.0),

            // Teks "Atau buat akun menggunakan Google"
            const Text(
              "Atau buat akun menggunakan Google",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 8.0),

            // Menampilkan Gambar Google Sign-In
            Image.asset(
              'assets/images/google_logo.png', // Pastikan gambar ada di folder assets
              height: 50, // Sesuaikan tinggi gambar
            ),

            const SizedBox(height: 16.0),

            // Sudah punya akun?
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman login
              },
              child: Text(
                "Sudah punya akun Kasir Pintar? Masuk di sini",
                style: TextStyle(
                  color: Colors.green.shade700,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
