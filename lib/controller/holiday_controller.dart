import 'package:meuapp/model/holiday_model.dart';
import 'package:meuapp/model/holiday_repository.dart';

class HolidayController {
  HolidayRepository repository = HolidayRepository();

  Future<List<HolidayEntity>> getHolidaysList() async {
    List<HolidayEntity> holidaysList = await repository.getHolidays();
    return holidaysList;
  }
}
