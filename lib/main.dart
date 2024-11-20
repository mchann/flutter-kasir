import 'package:flutter/material.dart';
import 'package:simpel_apk/login/login.dart';
import 'package:simpel_apk/login/register.dart';
import 'package:simpel_apk/login/coba.dart';      
import 'package:simpel_apk/my_page.dart';
import 'package:simpel_apk/login/addproduct.dart';
import 'package:simpel_apk/pages/product/menu_product.dart';

// Remove this unused import since it's not being used in the code
void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage ({super.key});

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    home: tampilankamera(),

    );
  }
}


class HalamanPertama extends StatelessWidget {
  const HalamanPertama ({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Haii This my First Page? "),
      backgroundColor: const Color.fromARGB(255, 236, 165, 189),
      ),
      body: const Row(
        children: [
          Text("hehehe"),
          Text("hihihi"),
          Text("huhuhu"),
        ],
      ),
    );
  }
}


class login extends StatelessWidget {
 const login ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halaman Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
             
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Selamat Datang'),
                  TextButton(
                    onPressed: () {
                       
                    },
                    child: Text('Butuh batnuan?'),
                  ),
                ],
              ),
            
              Image.asset(
                '/assets/images/miles.jpeg', 
                width: 100.0, 
                height: 100.0,
      ),
      
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email atau Username',
                ),
              ),
             
              
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),

              TextButton(
                    onPressed: () {
                      
                    },
                    child: Text('Lupa password?'),
                  ),
            
             
              ElevatedButton(
                onPressed: () {
                  
                },
                child: Text('Login'),
              ),
              
             
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('bisa loginn pakai'),
                  TextButton(
                    onPressed: () {
                      
                    },
                    child: Text('Google'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class tampilanLogin extends StatelessWidget {
 const tampilanLogin ({super.key});
 
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
      home: LoginPage(),
    );
  }


}

class tampilanRegister extends StatelessWidget {
 const tampilanRegister ({super.key});
 
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
      home: RegisterPage(),
    );
  }


}

class tampilanProduct extends StatelessWidget {
 const tampilanProduct ({super.key});
 
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
      home: AddProductPage(),
    );
  }


}

class tampilanProduk extends StatelessWidget {
 const tampilanProduk ({super.key});
 
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
      home: AddProdukPage(),
    );
  }


}


class tampilanMenuProduct extends StatelessWidget {
 const tampilanMenuProduct ({super.key});
 
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
      home: MenuProduct(),
    );
  }


}

class tampilankamera extends StatelessWidget {
 const tampilankamera ({super.key});
 
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
      home: MyPage(),
    );
  }


}