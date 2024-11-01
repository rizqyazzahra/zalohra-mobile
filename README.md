# Zalohra (Mobile)

Proyek flutter sebagai tugas mata kuliah Pemrograman Berbasis Platform (PBP) Ganjil 2024/2025 oleh Rizqya Az Zahra Putri - 2306244936.

### Daftar Isi
* [Tugas 7: Elemen Dasar Flutter](#tugas-7-elemen-dasar-flutter)

---
## Tugas 7: Elemen Dasar Flutter
### 1. Jelaskan apa yang dimaksud dengan _stateless widget_ dan _stateful widget_, dan jelaskan perbedaan dari keduanya.

### 2. Sebutkan _widget_ apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

### 3. Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

### 4. Jelaskan perbedaan antara `const` dengan `final`.

### 5. Langkah Implementasi _Checklist_
#### Membuat sebuah program Flutter baru dengan tema _E-Commerce_
1. Untuk membuat proyek Flutter baru, saya menjalankan perintah berikut pada terminal.
   ```flutter create zalohra_mobile```
2. Membuat berkas baru bernama `menu.dart` pada direktori `zalohra_mobile/lib` dan menambahkan kode berikut.
   ```import 'package:flutter/material.dart';```
3. Dari berkas `main.dart` yang ada pada `zalohra_mobile/lib`, saya memindahkan dua kode class berikut ke berkas `menu.dart`.
   ```
   class MyHomePage ... {
    ...
    }
    Selain itu, saya menghapus class berikut yang ada pada main.dart.
    class _MyHomePageState ... {
    ...
    }
   ```
4. Menambahkan baris berikut di bagian atas.
   ```import 'package:zalohra_mobile/menu.dart';```
5. Masih di berkas `main.dart`, saya menentukan tema warna aplikasi menjadi abu-abu.
   ```
   colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
          ).copyWith(secondary: Colors.grey[850]),
   ```
6. Kemudian mengubah potongan kode `const MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`.
7. Untuk mengubah sifat _widget_ dari _stateful_ menjadi _stateless_, saya memodifikasi berkas `menu.dart` dengan beberapa hal. Pertama, menghapus seluruh class `_MyHomePageState extends State<MyHomePage>`. Selain itu, menghapus semua isi dari `class MyHomePage ...` hingga menjadi kosong. Lalu, saya mengubah `... extends StatefulWidget` menjadi `... extends StatelessWidget` pada `class MyHomePage` dan menambahkan `MyHomePage({super.key});` sebagai constructor dari class `MyHomePage`. Kemudian, menambahkan Widget build sehingga kode class `MyHomePage` pada `menu.dart` menjadi seperti berikut ini.
   ```
    class MyHomePage extends StatelessWidget {
        MyHomePage({super.key});
    
        @override
        Widget build(BuildContext context) {
            return Scaffold();
        }
    }
   ```
8. Kemudian saya membuat info card yang berisi NPM, Nama, dan Kelas dengan mendeklarasikan tiga variabel bertipe string pada class `MyHomePage` di berkas `menu.dart`.
   ```
    class MyHomePage extends StatelessWidget {
        MyHomePage({super.key});
        final String npm = '2306244936';
        final String name = 'Rizqya Az Zahra Putri';
        final String className = 'PBP F';
        ...
    }
   ```
9. Pada berkas `menu.dart`, saya membuat class baru bernama `InfoCard` untuk menampilkan informasi NPM, nama, dan kelas saya, seperti berikut ini
    ```
    class InfoCard extends StatelessWidget {
        final String title;
        final String content;
      
        const InfoCard({super.key, required this.title, required this.content});
      
        @override
        Widget build(BuildContext context) {
          return Card(
            elevation: 2.0,
            child: Container(
              width: MediaQuery.of(context).size.width / 3.5,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height:  8.0),
                  Text(content),
                ],
              ),
            ),
          );
        }
      }
    ```
    
#### Membuat tiga tombol sederhana dengan ikon dan teks
1. Untuk membuat button card, saya membuat class baru bernama `ItemHomepage` pada berkas `menu.dart`
   ```
   class ItemHomepage {
       final String name;
       final IconData icon;
  
       ItemHomepage(this.name, this.icon);
   }
   ```
2. Membuat _list of_ `ItemHomepage` yang berisi tombol-tombol yang ingin saya tambahkan pada class `MyHomePage`
   ```
   class MyHomePage extends StatelessWidget {
       ...
       final List<ItemHomePage> items = [
          ItemHomePage("Lihat Daftar Produk", Icons.shopping_cart),
          ItemHomePage("Tambah Produk", Icons.add),
          ItemHomePage("Logout", Icons.logout),
        ];
       ...
   ```
3. Kemudian saya membuat class `ItemCard` untuk menampilkan tombol-tombol yang sudah saya definisikan
   ```
   class ItemCard extends StatelessWidget {
      final ItemHomePage item;
    
      const ItemCard(this.item, {super.key});
    
      Color? _getBackgroundColor(String name) {
        switch (name) {
          case "Lihat Daftar Produk":
            return Colors.blue[400];
          case "Tambah Produk":
            return Colors.green[400];
          case "Logout":
            return Colors.red[400];
          default:
            return Colors.grey;
        }
      }
      @override
      Widget build(BuildContext context) {
        return Material(
          color: _getBackgroundColor(item.name),
          borderRadius: BorderRadius.circular(12),
    
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text("Kamu telah menekan tombol ${item.name}"))
                );
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
   ```
4. Untuk mengintegrasikan dan menampilkan `InfoCard` dan `ItemCard` di MyHomePage, saya menambahkan kode berikut pada bagian `Widget build()` pada class `MyHomePage` di berkas `menu.dart`.
   ```
   ...
    class MyHomePage extends StatelessWidget {
      ...  
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Zalohra',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoCard(title: 'NPM', content: npm),
                    InfoCard(title: 'Name', content: name),
                    InfoCard(title: 'Class', content: className),
                  ],
                ),
    
                const SizedBox(height: 16.0),
    
                Center(
                  child: Column(    
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Welcome to Zalohra!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
    
                      GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
    
                        children: items.map((ItemHomepage item) {
                          return ItemCard(item);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
    ...
   ```

#### Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
Untuk memberikan warna berbeda untuk setiap tombol yang ada, pada berkas `menu.dart`, saya menambahkan metode yang akan memilih warna berdasarkan warna tombol dan menerapkan warna latar belakang tersebut ke masing-masing tombol, seperti ini:
```
class ItemCard extends StatelessWidget {
  ...
  Color? _getBackgroundColor(String name) {
    switch (name) {
      case "Lihat Daftar Produk":
        return Colors.blue[400];
      case "Tambah Produk":
        return Colors.green[400];
      case "Logout":
        return Colors.red[400];
      default:
        return Colors.grey;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getBackgroundColor(item.name),
      ...
```
#### Memunculkan Snackbar ketika tombol ditekan
Implementasi ini didefinisikan pada widget `ItemCard` yang menampilkan tombol-tombol pada aplikasi.
```
class ItemCard extends StatelessWidget {
    ...
    @override
    Widget build(BuildContext context) {
        return Material(
            ...
            child: InkWell(
                onTap: () {
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                        );
                },
                ...
            )
        )
    }
}
```
