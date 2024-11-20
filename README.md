# Zalohra (Mobile)

Proyek flutter sebagai tugas mata kuliah Pemrograman Berbasis Platform (PBP) Ganjil 2024/2025 oleh Rizqya Az Zahra Putri - 2306244936.

### Daftar Isi
* [Tugas 7: Elemen Dasar Flutter](#tugas-7-elemen-dasar-flutter)
* [Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements](#tugas-8-flutter-navigation-layouts-forms-and-input-elements)
* [Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter](#tugas-9-integrasi-layanan-web-django-dengan-aplikasi-flutter)

---
## Tugas 7: Elemen Dasar Flutter
### 1. Jelaskan apa yang dimaksud dengan _stateless widget_ dan _stateful widget_, dan jelaskan perbedaan dari keduanya.
* _Stateless widget_ adalah _widget_ yang tidak menyimpan keadaan internal atau data yang dapat berubah (statis). Hal ini berarti sekali dibuat, tampilan dari _widget_ tersebut tidak akan berubah sepanjang siklus hidupnya. Contoh dari _stateless widget_ seperti icon dan image.
* _Stateful widget_ adalah _widget_ yang menyimpan keadaan internal atau data yang dapat berubah (dinamis). Hal ini berarti setelah dibuat, tampilan dari _widget_ tersebut dapat berubah sepanjang siklus hidupnya. Contoh dari _stateful widget_ adalah InkWell dan Checkbox.

### 2. Sebutkan _widget_ apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
* MyApp - `StatelessWidget` sebagai root dari aplikasi Zalohra. _Widget_ ini menyimpan keseluruhan tema dan warna dari proyek ini.
* MaterialApp - _Widget_ utama yang mengelola pengaturan tema dan navigasi. `MaterialApp` menyediakan tema warna aplikasi dari Zalohra dan halaman `MyHomePage` sebagai halaman utama.
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

---
## Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements
### 1. Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
`const` di Flutter digunakan untuk membuat nilai atau _widget_ yang bersifat konstan dan tidak dapat berubah selama aplikasi berjalan, yang membuatnya hanya diinisialisasi sekali selama kompilasi. Hal ini berguna untuk meningkatkan performa aplikasi dengan menghemat memori dan mencegah _rebuild widget_ yang tidak perlu karena _widget_ bertanda `const` tidak akan di-_render_ ulang saat terjadi perubahan pada bagian lain dari _interface_. `const` cocok digunakan pada _widget_ statis, seperti teks atau ikon, yang tidak dipengaruhi oleh interaksi pengguna atau perubahan _state_. Dan tidak cocok digunakan untuk _widget_ yang dinamis atau dipengaruhi oleh variabel yang bisa berubah, seperti dalam `StatefulWidget`, karena _widget_ perlu diperbarui sesuai dengan perubahan data atau state yang terjadi.

### 2. Jelaskan dan bandingkan penggunaan _Column_ dan _Row_ pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
_Column_ adalah _widget_ yang digunakan untuk mengatur widget anak-anaknya secara vertikal, dari atas ke bawah. Cocok digunakan saat ingin menampilkan elemen-elemen dalam bentuk daftar ke bawah, sedangkan _Row_ digunakan untuk mengatur widget anak-anaknya secara horizontal, dari kiri ke kanan. Cocok digunakan ketika ingin menampilkan elemen-elemen secara berjajar, seperti ikon atau tombol.
```dart
child: Column(
   crossAxisAlignment: CrossAxisAlignment.start,
   children: [
      Text('Product Name: $_productName'),
      Text('Description: $_description'),
      Text('Price: $_price'),
      Text('Amount: $_amount'),
      Text('Image URL: $_imageUrl')
    ],
),
```
```dart
Row(
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   children: [
      InfoCard(title: 'NPM', content: npm),
      InfoCard(title: 'Name', content: name),
      InfoCard(title: 'Class', content: className),
  ],
),
```

### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman _form_ yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Elemen input yang saya gunakan di halaman _form_, yaitu `TextFormField` yang digunakan sebagai input teks atribut produk (nama produk, deskripsi, harga, jumlah, URL gambar) dan `ElevatedButton` yang digunakan untuk tombol menyimpan data.

Ada beberapa elemen input Flutter yang tidak saya gunakan, beberapa diantaranya adalah `Checkbox` untuk memilih atau tidak memilih suatu opsi, `Radio` untuk memilih satu opsi dari beberapa pilihan, `DropdownButtonFormField` untuk menampilkan pilihan dalam bentuk _dropdown_, `Switch` input untuk pilihan on/off, dan `Slider` untuk memilih nilai dalam rentang tertentu seperti ukuran.

### 4. Bagaimana cara kamu mengatur tema (_theme_) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Saya mengatur tema aplikasi saya menggunakan `ThemeData` di root _widget_ `MaterialApp` pada berkas `main.dart`. Di bagian ini, saya menggunakan `colorScheme` untuk menentukan skema warna utama, dengan `primarySwatch` berwarna abu-abu dan warna sekunder yang lebih gelap (abu-abu tua).

### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Pada aplikasi ini, navigasi diatur menggunakan `Navigator` dengan metode `push`, `pushReplacement`, dan `pop`. `Navigator.push()` digunakan untuk menambah halaman baru di atas halaman yang ada pada stack navigasi. `Navigator.pushReplacement()` digunakan untuk menggantikan halaman saat ini dengan halaman lain, dan menghapus halaman sebelumnya dari stack, sehingga pengguna tidak bisa kembali ke halaman sebelumnya. `Navigator.pop()` digunakan untuk menutup halaman yang sedang terbuka, mengembalikan pengguna ke halaman sebelumnya.

---
## Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter
### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi _error_ jika kita tidak membuat model terlebih dahulu?
Model diperlukan untuk pengambilan dan pengiriman data JSON karena memberikan representasi terstruktur dari data yang ada dan mempermudah validasi. Dengan model, data JSON dapat diterjemahkan menjadi objek yang sesuai dengan aturan, misalnya tipe data atau panjang maksimal. Model juga memungkinkan integrasi langsung dengan _framework_ seperti Django, sehingga memudahkan operasi database, query, dan penyimpanan data secara konsisten. Selain itu, model membantu menjaga validitas data dengan mekanisme bawaan, sehingga risiko kesalahan saat memproses data menjadi lebih kecil. Jika tidak membuat model, kita perlu memproses data JSON secara manual, yang mana meningkatkan risiko error, seperti kesalahan validasi, inkonsistensi data, atau operasi database yang tidak aman.

### 2. Jelaskan fungsi dari library _http_ yang sudah kamu implementasikan pada tugas ini.
Library `http` di Flutter digunakan untuk menangani HTTP requests dan menerima respons dari API atau layanan web. Fungsi utama library http pada Flutter:
* Melakukan HTTP request (dengan metode POST, GET, PUT, dan DELETE)
* Mengelola respons HTTP
* Mengirim data ke server
* Mengelola header HTTP
* Dapat diintegrasikan dengan pendekatan asinkron (menggunakan `Future` atau `async`/`await`) untuk memastikan aplikasi tetap responsif

### 3. Jelaskan fungsi dari `CookieRequest` dan jelaskan mengapa _instance_ `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah class yang biasanya digunakan untuk mengelola sesi pengguna dengan memanfaatkan cookie pada aplikasi. `CookieRequest` memungkinkan aplikasi menyimpan cookie yang diterima dari server setelah permintaan HTTP, seperti saat autentikasi berhasil. Fung dari `CookieRequest` ini dapat menjaga autentikasi dan sesi pengguna serta mengurangi kompleksitas penanganan autentikasi di seluruh aplikasi. Instance `CookieRequest` perlu dibagikan ke semua komponen aplikasi agar status sesi pengguna (melalui cookie) tetap konsisten di seluruh aplikasi. Hal ini memastikan semua komponen menggunakan cookie yang sama saat melakukan HTTP requests. Selain itu juga untuk mengurangi overhead aplikasi karena tidak perlu membuat dan mengelola banyak instance. Semua permintaan dapat menggunakan instance yang sama, yang sudah siap dengan cookie yang relevan.

### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. User memberikan data melalui widget input di Flutter, seperti `TextField`, `DropdownButton`, atau form lainnya. Data ini biasanya ditangkap melalui controller (misalnya `TextEditingController`) atau listener pada widget tersebut.
2. Setelah itu, aplikasi akan memvalidasi input dari user untuk memastikan input sesuai dengan format, seperti `Jumlah` berisi angka lebih dari 0 dan tidak ada karakter lain.
3. Setelah user mengisi data, divalidasi, dan mengirimkannya (misalnya dengan menekan tombol), data tersebut diproses dalam fungsi atau handler dan dikirimkan ke server menggunakan library HTTP. Data biasanya dikirim dalam format JSON.
4. Di sisi backend, server menerima data dari aplikasi Flutter, memprosesnya, dan memberikan respons. Pemrosesan ini bisa berupa penyimpanan data ke database, validasi, atau manipulasi data lainnya. Server kemudian mengirimkan respons dalam format JSON kembali ke aplikasi.
5. Setelah menerima respons dari server, aplikasi Flutter memproses respons tersebut. Data dapat diubah menjadi objek Dart dengan library seperti `dart:convert` untuk digunakan lebih lanjut.
6. Data yang diterima dari server lalu ditampilkan ke user menggunakan widget Flutter seperti `Text`, `ListView`, atau `DataTable`.

### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
* Register
  1. User memasukkan data akun, seperti _username_ dan _password_ melalui form input di Flutter.
  2. Data ini dikirim ke server Django menggunakan request HTTP POST.
  3. Django menerima data melalui endpoint `register`. Kemudian data diproses, seperti memvalidasi apakah _username_ sudah terdaftar atau _password_ yang diinput sesuai dengan ketentuan.
  4. Setelah divalidasi, Django menyimpan akun baru ke database, misal menggunakan model User dan Django mengirimkan respons sukses (status kode 201) atau pesan error (status kode 400 atau 409).
  5. Setelah sukses, Flutter menampilkan pesan sukses atau langsung mengarahkan user ke halaman login.

* Login
  1. Pada halaman atau form login aplikasi Flutter, user memasukkan  _username_ dan _password_.
  2. Data user dikirimkan ke server Django melalui request HTTP POST.
  3. Django menerima data login melalui endpoint `login`.
  4. Server memvalidasi _username_ dan _password_ dan mencari data di database menggunakan model autentikasi Django (`authenticate`)
  5. Jika valid, Django menghasilkan token autentikasi (misalnya, menggunakan JWT atau SessionMiddleware) dan mengirimkan token ke Flutter. Jika tidak valid, Django mengembalikan respons error.

* Logout
  1. User menekan tombol logout.
  2. Flutter menghapus token autentikasi dari penyimpanan lokal. Permintaan logout juga dapat dikirim ke Django untuk menghapus sesi di server.
  3. Setelah logout, Flutter mengarahkan pengguna kembali ke halaman login.

### 6. Langkah Implementasi _Checklist_
