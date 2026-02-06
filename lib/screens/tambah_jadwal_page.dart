import 'package:flutter/material.dart';

class TambahJadwalPage extends StatefulWidget {
  const TambahJadwalPage({super.key});

  @override
  State<TambahJadwalPage> createState() => _TambahJadwalPageState();
}

class _TambahJadwalPageState extends State<TambahJadwalPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  int selectedPriority = 3;

  @override
  void dispose() {
    _judulController.dispose();
    _tanggalController.dispose();
    _categoryController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Jadwal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(
                  labelText: 'Judul Kegiatan',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Judul harus diIsi'
                      : null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _tanggalController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Kegiatan',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),

                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2030),
                  );

                  if (pickedDate != null) {
                    String formatTanggal = pickedDate.toString().split(' ')[0];
                    _tanggalController.text = formatTanggal;
                  }
                },

                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Tanggal harus diisi'
                      : null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Kategori',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Kategori harus diisi'
                      : null;
                },
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<int>(
                value: selectedPriority,
                decoration: const InputDecoration(
                  labelText: 'Priority',
                  border: OutlineInputBorder(),
                ),
                items: [1, 2, 3, 4, 5].map((int priority) {
                  return DropdownMenuItem<int>(
                    value: priority,
                    child: Text('Priority $priority'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPriority = value!;
                  });
                },
              ),

              ElevatedButton(
                onPressed: () {
                  // 4. CEK VALIDASI SAAT TOMBOL DITEKAN
                  if (_formKey.currentState!.validate()) {
                    // Jika validator return null semua (lolos), kode ini jalan:
                    print('Form Valid! Simpan Data...');
                    print('Judul: ${_judulController.text}');
                  } else {
                    // Jika ada error, Flutter otomatis memunculkan pesan error merah
                    print('Masih ada yang kosong/salah');
                  }
                },
                child: const Text('Simpan Jadwal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
