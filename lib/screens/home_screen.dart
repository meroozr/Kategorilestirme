import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yeni_projem/models/urunler_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenSatate();
}

class _HomeScreenSatate extends State<HomeScreen> {
  UrunlerModels? _veriler;
  List<Urunler> _urunler = [];

  void _loadData() async {
    final dataString = await rootBundle.loadString('assets/files/data.json');
    final dataJson = jsonDecode(dataString);

    _veriler = UrunlerModels.fromJson(dataJson);
    _urunler = _veriler!.urunler;
    setState(() {});
  }

  void _filterData(int id) {
    _urunler =
        _veriler!.urunler
            .where((verilerEleman) => verilerEleman.kategori == id)
            .toList();
    setState(() {});
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _veriler == null
                ? const Text('yükleniyor')
                : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: _resetFilter,
                      child: Text("tüm ürünler"),
                    ),
                    _kategorilerView(),
                    _urunlerView(),
                  ],
                ),
      ),
    );
  }

  void _resetFilter() {
    _urunler = _veriler!.urunler;
    setState(() {});
  }

  ListView _urunlerView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _urunler.length,
      itemBuilder: (context, index) {
        final Urunler urunler = _urunler[index];
        return ListTile(
          leading: Image.network(
            urunler.resim,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          title: Text(urunler.isim),
        );
      },
      //  separatorBuilder: (context, index) => const Divider(),
    );
  }

  Row _kategorilerView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_veriler!.kategoriler.length, (index) {
        final kategori = _veriler!.kategoriler[index];
        return GestureDetector(
          onTap: () => _filterData(kategori.id),
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(_veriler!.kategoriler[index].isim),
          ),
        );
      }),
    );
  }
}
