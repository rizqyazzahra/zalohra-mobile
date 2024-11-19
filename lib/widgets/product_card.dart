import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:zalohra_mobile/screens/login.dart';
import 'package:zalohra_mobile/screens/list_productentry.dart';
import 'package:zalohra_mobile/screens/productentry_form.dart';

class ItemHomePage {
  final String name;
  final IconData icon;

  ItemHomePage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomePage item;

  const ItemCard(this.item, {super.key});

  Color? _getBackgroundColor(String name) {
    switch (name) {
      case "Lihat Daftar Produk":
        return Colors.blue[400];
      case "Tambah Item":
        return Colors.green[400];
      case "Logout":
        return Colors.red[400];
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Material(
      color: _getBackgroundColor(item.name),
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}"))
            );
            if (item.name == "Tambah Item") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductEntryFormPage(),
                ));
            }
            else if (item.name == "Lihat Daftar Produk") {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const ProductEntryPage()
                  ),
              );
            }
            else if (item.name == "Logout") {
              final response = await request.logout(
                "http://127.0.0.1:8000/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message Sampai jumpa, $uname."),
                  ));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(message),
                      ),
                  );
                }
              }
            }
        },

        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}