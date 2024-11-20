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
#### Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
_Deployment_ web Zalohra sudah dilakukan melalui PWS dan dapat diakses melalui [link berikut](http://rizqya-az-zalohra.pbp.cs.ui.ac.id/).

####  Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
1. Pada proyek Django, saya membuat Django app baru bernama `authentication`.
2. Kemudian menambahkan `django-cors-headers` di `requirements.txt` dan melakukan instalasi library menggunakan perintah `pip install django-cors-headers`.
3. Pada berkas `settings.py` yang ada di main project, saya menambahkan `authentication` dan `corsheaders` di bagian `INSTALLED_APPS` serta menambahkan `corsheaders.middleware.CorsMiddleware` di MIDDLEWARE. Selain itu, saya juga menambahkan beberapa variabel berikut:
   ```dart
   ...
   CORS_ALLOW_ALL_ORIGINS = True
   CORS_ALLOW_CREDENTIALS = True
   CSRF_COOKIE_SECURE = True
   SESSION_COOKIE_SECURE = True
   CSRF_COOKIE_SAMESITE = 'None'
   SESSION_COOKIE_SAMESITE = 'None'
   ...
   ```
4. Di aplikasi `authentication`, saya membuat berkas `views.py` dan `urls.py` untuk proses registrasi, login, dan logout.
5. Menambahkan path berikut di zalohra_mobile/urls.py:
   ```dart
   path('auth/', include('authentication.urls')),
   ```
6. Pada direktori root proyek Flutter saya menjalankan perintah berikut di terminal `flutter pub add provider` dan `flutter pub add pbp_django_auth`
7. Pada berkas `main.dart`, saya memodifikasi _root widget_ untuk menyediakan `CookieRequest` library ke semua _child widgets_ dan menambhakna import yang sesuai.
   ```dart
   class MyApp extends StatelessWidget {
        ...
      
        @override
        Widget build(BuildContext context) {
          return Provider(
            create: (_) {
              CookieRequest request = CookieRequest();
              return request;
            },
            ...
              home: MyHomePage(),
            ),
          );
        }
      }
   ```
   
#### Membuat halaman login pada proyek tugas Flutter.
1. Pada `lib/screens`, saya membuat berkas baru dengan nama `login.dart` dan menambahkan kode untuk menampilkan halaman login.
2. Pada berkas `main.dart`, pada Widget `MaterialApp(...)`, saya mengubah `home: MyHomePage()` menjadi `home: const LoginPage()`.
3. Saya menambahkan view di Django untuk halaman login di `views.py` yang ada di direktori `authentication` dengan kode berikut:
   ```python
   from django.contrib.auth import authenticate, login as auth_login
   from django.http import JsonResponse
   from django.views.decorators.csrf import csrf_exempt
   
   @csrf_exempt
   def login(request):
       username = request.POST['username']
       password = request.POST['password']
       user = authenticate(username=username, password=password)
       if user is not None:
           if user.is_active:
               auth_login(request, user)
               return JsonResponse({
                   "username": user.username,
                   "status": True,
                   "message": "Login sukses!"
               }, status=200)
           else:
               return JsonResponse({
                   "status": False,
                   "message": "Login gagal, akun dinonaktifkan."
               }, status=401)
   
       else:
           return JsonResponse({
               "status": False,
               "message": "Login gagal, periksa kembali email atau kata sandi."
           }, status=401)
   ```
4. Menambahkan path untuk login pada `authentication/urls.py`
   ```python
   path('login/', login, name='login'),
   ```

#### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
1. Pada `lib/screens`, saya membuat berkas baru dengan nama `register.dart` dan menambahkan kode untuk menampilkan halaman register.
2. Saya menambahkan view di Django untuk halaman register di `views.py` yang ada di direktori `authentication` dengan kode berikut:
   ```python
   from django.contrib.auth.models import User
   import json
   
   ...
   
   @csrf_exempt
   def register(request):
       if request.method == 'POST':
           data = json.loads(request.body)
           username = data['username']
           password1 = data['password1']
           password2 = data['password2']
   
           if password1 != password2:
               return JsonResponse({
                   "status": False,
                   "message": "Passwords do not match."
               }, status=400)
           
           if User.objects.filter(username=username).exists():
               return JsonResponse({
                   "status": False,
                   "message": "Username already exists."
               }, status=400)
           
           user = User.objects.create_user(username=username, password=password1)
           user.save()
           
           return JsonResponse({
               "username": user.username,
               "status": 'success',
               "message": "User created successfully!"
           }, status=200)
       
       else:
           return JsonResponse({
               "status": False,
               "message": "Invalid request method."
           }, status=400)
   ```
3. Menambahkan URL routing terhadap fungsi register
   ```python
   path('register/', register, name='register'),
   ```

#### Membuat model kustom sesuai dengan proyek aplikasi Django.
1. Dari data endpoint JSON yang sudah didapatkan melalui Django, saya menggunakan Quicktype untuk mendapatkan model yang sesuai dengan data-data yang sudah dimiliki sebelumnya.
   ```dart
   import 'dart:convert';

   List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
   
   String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
   
   class Product {
       String model;
       String pk;
       Fields fields;
   
       Product({
           required this.model,
           required this.pk,
           required this.fields,
       });
   
       factory Product.fromJson(Map<String, dynamic> json) => Product(
           model: json["model"],
           pk: json["pk"],
           fields: Fields.fromJson(json["fields"]),
       );
   
       Map<String, dynamic> toJson() => {
           "model": model,
           "pk": pk,
           "fields": fields.toJson(),
       };
   }
   
   class Fields {
       int user;
       String name;
       int price;
       String description;
       String image;
   
       Fields({
           required this.user,
           required this.name,
           required this.price,
           required this.description,
           required this.image,
       });
   
       factory Fields.fromJson(Map<String, dynamic> json) => Fields(
           user: json["user"],
           name: json["name"],
           price: json["price"],
           description: json["description"],
           image: json["image"],
       );
   
       Map<String, dynamic> toJson() => {
           "user": user,
           "name": name,
           "price": price,
           "description": description,
           "image": image,
       };
   }
   ```
2. Lalu saya memindahkan kode tersebut ke proyek Flutter saya ke berkas baru `product_entry.dart` pada direktori baru `lib/models/`.
 
#### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
#####  Tampilkan name, price, dan description dari masing-masing item pada halaman ini.
1. Saya membuat file baru bernama `list_productentry.dart` pada direktori `lib/screens/` untuk menampilkan halaman yang berisi semua produk yang dimiliki seorang pengguna. Data yang ditampilkan berupa name, price, dan description, dan tombol untuk membuka halaman berisi data produk yang lebih lengkap.
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:zalohra_mobile/widgets/left_drawer.dart';
import 'package:zalohra_mobile/models/product_entry.dart';
import 'package:zalohra_mobile/screens/detail_product.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object ProductEntry
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data produk pada Zalohra.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  var product = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            child: Image.network(
                              product.fields.image,
                              height: 100,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.fields.name,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Rp${product.fields.price}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  // const SizedBox(height: 5),
                                  // Text(
                                  //   'Jumlah Produk: ${product.fields.amount}',
                                  //   style: const TextStyle(
                                  //     fontSize: 12.0,
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                  const SizedBox(height: 5),
                                  Text(
                                    product.fields.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductDetailPage(
                                              product: product,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text('Lihat Detail'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
```

#### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
Saya membuat berkas baru bernama `detail_product.dart` yang berisi data lengkap dari suatu produk, seperti nama, deskripsi, harga, dan jumlah.

##### Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
Pada berkas `list_productentry.dart` yang menampilkan semua daftar item, saya membuat tombol "Lihat Detail" yang jika ditekan akan mengarah ke berkas `detail_product.dart`
```dart
child: ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(
          product: product,
        ),
      ),
    );
  },
  child: const Text('Lihat Detail'),
),
```
##### Tampilkan seluruh atribut pada model item kamu pada halaman ini.
Pada berkas `detail_product.dart`, saya menambahkan informasi mengenai produk untuk ditampilkan
```dart
import 'package:flutter/material.dart';
import 'package:zalohra_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          product.fields.name,
          style: TextStyle(color: colorScheme.onPrimary),
        ),
        backgroundColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.secondary.withOpacity(0.1),
              colorScheme.primary.withOpacity(0.05),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: 1.0,
              child: Card(
                elevation: 12,
                shadowColor: colorScheme.primary.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(product, colorScheme),
                      const SizedBox(height: 24),
                      _buildDetails(product, colorScheme),
                      const SizedBox(height: 24),
                      _buildActionButtons(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Product product, ColorScheme colorScheme) {
    return Column(
      children: [
        // Menampilkan gambar produk
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product.fields.image,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          product.fields.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Rp ${product.fields.price}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 3,
          width: 100,
          decoration: BoxDecoration(
            color: colorScheme.secondary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(Product product, ColorScheme colorScheme) {
    return Column(
      children: [
        // _buildDetailRow(
        //   icon: Icons.production_quantity_limits,
        //   label: "Jumlah Produk",
        //   value: "${product.fields.amount}",
        //   color: colorScheme.secondary,
        //   colorScheme: colorScheme,
        // ),
        _buildDetailRow(
          icon: Icons.description_outlined,
          label: "Deskripsi Produk",
          value: product.fields.description,
          color: colorScheme.secondary,
          colorScheme: colorScheme,
        ),
        const SizedBox(height: 20),
        _buildDetailRow(
          icon: Icons.link_outlined,
          label: "Gambar Produk",
          value: product.fields.image,
          color: colorScheme.secondary,
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
          onPressed: () {
          },
          icon: const Icon(Icons.favorite_border),
          label: const Text("Favorit"),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        ElevatedButton(
          onPressed: () {
          },
          child: const Text("Beli Sekarang"),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}
```
##### Tambahkan tombol untuk kembali ke halaman daftar item.
Karena pada halaman daftar item saya menggunakan perintah Navigator.push() untuk mengarahkan ke halaman detail produk dan di halaman detail produk menggunakan AppBar, maka terdapat tombol kembali(`<`) otomatis yang sudah terdapat di AppBar.

#### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
Item yang ditampilkan hanya item yang terasosiasikan dengan pengguna yang login dapat diakses dengan menggunakan `CookieRequest` saat akan melakukan `request.get()`. Sehingga, produk yang diambil dari database hanya produk yang sesuai dengan sesi yang dimiliki oleh pengguna.
```dart
Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
  final response = await request.get('http://127.0.0.1:8000/json/');
}
```
