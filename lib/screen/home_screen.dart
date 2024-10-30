import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quran_app/repository/quran_page_repo.dart';
import 'package:quran_app/utils/defs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Ayah>? page;
  Qpage? page;

  void getPage() async {
    page = await QuranPageRepo.getPage(1);
    setState(() {});
  }

  @override
  void initState(){
    super.initState();
    getPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quran App'),
        ),
        body: page == null
            ? Center(child: CircularProgressIndicator())
            : Center(
              child: Wrap(
                textDirection: TextDirection.rtl,
                  children: page!.map((ayah) => Text(ayah.text??"")).toList()
                ),
            )

        // SurahsRepo surahsRepo = SurahsRepo();
        //
        // Future<List> getData() async {
        //   List<Surahs> surahs = await surahsRepo.getSurahs();
        //   return surahs;
        // }
        //
        // @override
        // Widget build(BuildContext context) {
        //   return Scaffold(
        //     appBar: AppBar(
        //       title: Text('Quran App'),
        //     ),
        //
        //     body: FutureBuilder(
        //       future: SurahsRepo().getSurahs(),
        //       builder: (context, snapshot) {
        //             if (snapshot.connectionState == ConnectionState.waiting) {
        //               return const Center(
        //                 child: CircularProgressIndicator(),
        //               );
        //             } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        //               return ListView.builder(
        //                 itemCount: snapshot.data!.length,
        //                 itemBuilder: (context, index) {
        //                   return ListTile(
        //                     title: Text(snapshot.data![index].surahName.toString()),
        //                   );
        //                 },
        //               );
        //             }else{
        //               return const Center(child: Text("No Data"));
        //             }
        //       },
        //     ),

        // body: FutureBuilder<List<Surahs>>(
        //   future: SurahsRepo().getSurahs(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        //       return ListView.builder(
        //         itemCount: snapshot.data!.length,
        //         itemBuilder: (context, index) {
        //           return ListTile(
        //             title: Text(snapshot.data![index].surahName.toString()),
        //           );
        //         },
        //       );
        //     }else {
        //       return Center(child: Text('No Data'),);
        //     };
        //   },
        // ),
        );
  }
}
