# Zalohra (Mobile)

Proyek flutter sebagai tugas mata kuliah Pemrograman Berbasis Platform (PBP) Ganjil 2024/2025 oleh Rizqya Az Zahra Putri - 2306244936.

### Daftar Isi
* [Tugas 7: Elemen Dasar Flutter](#tugas-7-elemen-dasar-flutter)

---
## Tugas 7: Elemen Dasar Flutter
### 1. Jelaskan apa yang dimaksud dengan _stateless widget_ dan _stateful widget_, dan jelaskan perbedaan dari keduanya.
* _Stateless widget_ adalah _widget_ yang tidak menyimpan keadaan internal atau data yang dapat berubah (statis). Hal ini berarti sekali dibuat, tampilan dari _widget_ tersebut tidak akan berubah sepanjang siklus hidupnya. Contoh dari _stateless widget_ seperti icon dan image.
* _Stateful widget_ adalah _widget_ yang menyimpan keadaan internal atau data yang dapat berubah (dinamis). Hal ini berarti setelah dibuat, tampilan dari _widget_ tersebut dapat berubah sepanjang siklus hidupnya. Contoh dari _stateful widget_ adalah InkWell dan Checkbox.

### 2. Sebutkan _widget_ apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
* MyApp - `StatelessWidget` sebagai root dari aplikasi Zalohra. _Widget_ ini menyimpan keseluruhan tema dan warna dari proyek ini.
* MaterialApp - _Widget_ uatama yang mengelola pengaturan tema dan navigasi. `MaterialApp` menyediakan tema warna aplikasi dari Zalohra dan halaman `MyHomePage` sebagai halaman utama.
* Scaffold - Menyediakan struktur dasar sebuah halaman. Hal ini memungkinkan untuk menentukan `AppBar`, `body`, dan berbagai bagian dari tata letak halaman.
* AppBar - Menampilkan header atau judul halaman pada aplikasi.
* Padding - Memberikan jarak di sekitar _child widget_.
* Column - Menyusun widget secara vertikal, sehingga elemen-elemen yang diletakkan di dalamnya akan ditampilkan dari atas ke bawah.
* Row - Menyusun widget secara horizontal. Di dalam `Row`, tiga `InfoCard` ditempatkan berdampingan untuk menampilkan informasi pengguna seperti NPM, nama, dan kelas saya.
* SizedBox - Memberikan ruang kosong vertikal dengan tinggi 16 piksel untuk jarak antar widget dalam `Column`.
* GridView.count - Menyusun widget dalam bentuk grid. Diatur dalam tiga kolom untuk menampilkan daftar `ItemCard` sesuai item dalam list `items`.
* Card (di `InfoCard`) - Menyediakan kartu untuk menampilkan informasi pengguna.
* InkWell - Membuat area yang dapat ditekan di `ItemCard`. Ketika ditekan, `InkWell` memunculkan snackbar dengan pesan berhasil.
* SnackBar - Menampilkan notifikasi sementara di bagian bawah layar untuk memberikan umpan balik. Muncul saat `ItemCard` ditekan.


### 3. Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` merupakan suatu _stateful widget_ yang digunakan untuk memberitahu Flutter bahwa ada perubahan _state_ pada _widget_ dan kemudian melakukan _rebuild_ untuk memperbarui tampilan _widget_ tersebut sesuai dengan _state_ yang baru. Variabel yang terdampak dari fungsi `setState()` adalah variabel yang dideklarasikan atau dengan kata lain berada di dalam kelas _state_. Variabel tersebut bisa berupa:
- Tipe data sederhana seperti `int`, `String`, `bool`
- List atau Map yang berisi data dinamis
- Objek kustom yang mungkin menyimpan data yang dipengaruhi oleh interaksi pengguna atau data eksternal, seperti teks dari `TextField` dan status `Checkbox`.

### 4. Jelaskan perbedaan antara `const` dengan `final`.
* `const` digunakan untuk mendeklarasikan nilai konstan yang sudah ditentukan saat kompilasi (_compile-time constant_). Ini berarti nilainya harus bisa diketahui pada saat kode dikompilasi dan tidak bisa bergantung pada nilai atau variabel yang baru diketahui saat runtime.
* `final` digunakan untuk mendeklarasikan variabel yang hanya bisa diinisialisasi satu kali. Nilai dari variabel final ditentukan pada saat runtime (saat program berjalan), bukan di saat kompilasi. Ini berarti bahwa nilai final bisa bergantung pada kondisi atau nilai yang baru diketahui ketika program dijalankan.

### 5. Langkah Implementasi _Checklist_
#### Membuat sebuah program Flutter baru dengan tema _E-Commerce_
1. Untuk membuat proyek Flutter baru, saya menjalankan perintah berikut pada terminal.
   ```dart
   flutter create zalohra_mobile
   ```
3. Membuat berkas baru bernama `menu.dart` pada direktori `zalohra_mobile/lib` dan menambahkan kode berikut.
   ```dart
   import 'package:flutter/material.dart';
   ```
5. Dari berkas `main.dart` yang ada pada `zalohra_mobile/lib`, saya memindahkan dua kode class berikut ke berkas `menu.dart`.
   ```dart
   class MyHomePage ... {
    ...
    }
    Selain itu, saya menghapus class berikut yang ada pada main.dart.
    class _MyHomePageState ... {
    ...
    }
   ```
6. Menambahkan baris berikut di bagian atas.
   ```dart
   import 'package:zalohra_mobile/menu.dart';
   ```
8. Masih di berkas `main.dart`, saya menentukan tema warna aplikasi menjadi abu-abu.
   ```dart
   colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
          ).copyWith(secondary: Colors.grey[850]),
   ```
9. Kemudian mengubah potongan kode `const MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`.
10. Untuk mengubah sifat _widget_ dari _stateful_ menjadi _stateless_, saya memodifikasi berkas `menu.dart` dengan beberapa hal. Pertama, menghapus seluruh class `_MyHomePageState extends State<MyHomePage>`. Selain itu, menghapus semua isi dari `class MyHomePage ...` hingga menjadi kosong. Lalu, saya mengubah `... extends StatefulWidget` menjadi `... extends StatelessWidget` pada `class MyHomePage` dan menambahkan `MyHomePage({super.key});` sebagai constructor dari class `MyHomePage`. Kemudian, menambahkan Widget build sehingga kode class `MyHomePage` pada `menu.dart` menjadi seperti berikut ini.
   ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({super.key});
    
        @override
        Widget build(BuildContext context) {
            return Scaffold();
        }
    }
   ```
11. Kemudian saya membuat info card yang berisi NPM, Nama, dan Kelas dengan mendeklarasikan tiga variabel bertipe string pada class `MyHomePage` di berkas `menu.dart`.
   ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({super.key});
        final String npm = '2306244936';
        final String name = 'Rizqya Az Zahra Putri';
        final String className = 'PBP F';
        ...
    }
   ```
11. Pada berkas `menu.dart`, saya membuat class baru bernama `InfoCard` untuk menampilkan informasi NPM, nama, dan kelas saya, seperti berikut ini
    ```dart
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
   ```dart
   class ItemHomepage {
       final String name;
       final IconData icon;
  
       ItemHomepage(this.name, this.icon);
   }
   ```
2. Membuat _list of_ `ItemHomepage` yang berisi tombol-tombol yang ingin saya tambahkan pada class `MyHomePage`
   ```dart
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
   ```dart
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
   ```dart
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
```dart
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
```dart
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
