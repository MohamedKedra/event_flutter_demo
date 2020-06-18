
import 'package:eventflutterdemo/data/event_response.dart';

getDate(EventResponse eventResponse){
  var date = eventResponse.date.split("T")[0];
  var time = eventResponse.date.split("T")[1].split(".")[0];
  var year = int.parse(date.split("-")[0]);
  var month = int.parse(date.split("-")[1]);
  var day = int.parse(date.split("-")[2]);
  var hour = int.parse(time.split(":")[0]);
  var minute = int.parse(time.split(":")[1]);

  var dateTime = DateTime(year,month,day,hour,minute);

  return "${intDayToArabic(dateTime.weekday)} , $day ${intMonthToArabic(month)} , ${intTimeToArabic(hour, minute)}";
}

String intDayToArabic(int day) {
  if (day % 7 == DateTime.monday % 7) return 'الأثنين';
  if (day % 7 == DateTime.tuesday % 7) return 'الثلاثاء';
  if (day % 7 == DateTime.wednesday % 7) return 'الأربعاء';
  if (day % 7 == DateTime.thursday % 7) return 'الخميس';
  if (day % 7 == DateTime.friday % 7) return 'الجمعة';
  if (day % 7 == DateTime.saturday % 7) return 'السبت';
  if (day % 7 == DateTime.sunday % 7) return 'الأحد';
  throw 'This should never have happened: $day';
}

String intMonthToArabic(int month){
  if(month % 12 == DateTime.january) return "يناير";
  if(month % 12 == DateTime.february) return "فبراير";
  if(month % 12 == DateTime.march) return "مارس";
  if(month % 12 == DateTime.april) return "ابريل";
  if(month % 12 == DateTime.may) return "مايو";
  if(month % 12 == DateTime.june) return "يونيو";
  if(month % 12 == DateTime.july) return "يوليو";
  if(month % 12 == DateTime.august) return "أغسطس";
  if(month % 12 == DateTime.september) return "سبتمبر";
  if(month % 12 == DateTime.october) return "أكتوبر";
  if(month % 12 == DateTime.november) return "نوفمبر";
  if(month % 12 == DateTime.december) return "ديسمبر";
  throw 'This should never have happened: $month';
}

String intTimeToArabic(int hour,int minute){
  String time = "";
  if(hour < 12){
    time = "مساءاً";
    hour = hour - 12;
  }else{
    time = "صباحاً";
    if(hour == 00){
      hour = 12;
    }
  }
  return "$hour:$minute $time";
}