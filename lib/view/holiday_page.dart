import 'package:flutter/material.dart';
import 'package:meuapp/controller/holiday_controller.dart';
import 'package:meuapp/model/holiday_model.dart';
//import 'package:meuapp/view/drawer.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({Key? key}) : super(key: key);

  @override
  _HolidayScreenState createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  late Future<List<HolidayEntity>> holidaysFuture;
  HolidayController controller = HolidayController();

  Future<List<HolidayEntity>> getHolidays() async {
    return await controller.getHolidaysList();
  }

  @override
  void initState() {
    super.initState();
    holidaysFuture = getHolidays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feriados Nacionais"),
        
      ),
      body: FutureBuilder(
        future: holidaysFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(snapshot.data![index].name ?? ''),
                    subtitle: Text(snapshot.data![index].date ?? ''),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
