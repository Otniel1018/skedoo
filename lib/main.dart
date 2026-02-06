import 'package:flutter/material.dart';
import 'models/jadwal.dart';
import 'screens/tambah_jadwal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skedoo - Jadwal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const JadwalListPage(),
    );
  }
}

class JadwalListPage extends StatefulWidget {
  const JadwalListPage({super.key});

  @override
  State<JadwalListPage> createState() => _JadwalListPageState();
}

class _JadwalListPageState extends State<JadwalListPage> {
  // Dummy data jadwal
  final List<Jadwal> daftarJadwal = [
    Jadwal('Belajar Flutter', '2026-02-06', 'Belajar', 5, false),
    Jadwal('Rapat Proyek', '2026-02-06', 'Kerja', 4, false),
    Jadwal('Olahraga', '2026-02-07', 'Kesehatan', 3, false),
    Jadwal('Belanja Bulanan', '2026-02-08', 'Pribadi', 2, false),
    Jadwal('Ngoding', '2026-02-09', 'Hobi', 5, false),
    Jadwal('Bakar - bakar', '2026-02-06', 'Healing', 5, false),
    Jadwal('Shooting CB', '2026-02-05', 'Kerja', 5, false),
    Jadwal('Nonton Film', '2026-02-10', 'Hiburan', 1, false),
  ];

  @override
  void initState() {
    super.initState();

    daftarJadwal.sort((a, b) {
      if (a.priority != b.priority) {
        return (a.priority == b.priority)
            ? a.date.compareTo(b.date)
            : b.priority.compareTo(a.priority);
      } else {
        return a.date.compareTo(b.date);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Saya'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: daftarJadwal.length,
        itemBuilder: (context, index) {
          final jadwal = daftarJadwal[index];
          return ListTile(
            title: Text(
              jadwal.title,
              style: TextStyle(
                decoration: jadwal.isDone ? TextDecoration.lineThrough : null,
                color: jadwal.isDone ? Colors.grey : Colors.black,
              ),
            ),
            subtitle: Text('${jadwal.date} - ${jadwal.category}'),
            trailing: Text(jadwal.getPriorityLabel()),
            leading: Checkbox(
              value: jadwal.isDone,
              onChanged: (bool? value) {
                setState(() {
                  jadwal.markAsDone(value ?? false);
                });
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahJadwalPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
