
class TimeUtil{
  static String dateToHM(String date){
    try{
      DateTime dateTime = DateTime.parse(date);
      return "${checkZero(dateTime.hour)}:${checkZero(dateTime.minute)}";
    }catch (e){
      return "";
    }
  }

  static String dateToYMD(String date,{String year ="年",String month ="月",String day ="日"}){
    try{
      if(date.length==10)date = date+'000';
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(date));
      return "${dateTime.year}$year${checkZero(dateTime.month)}$month${checkZero(dateTime.day)}$day";
    }catch (e){
      return "";
    }
  }

  static String dateToYMDHM(String date,{String year ="年",String month ="月",String day ="日"}) {
    try{
      DateTime dateTime = DateTime.parse(date);
      return "${dateTime.year}$year${checkZero(dateTime.month)}$month${checkZero(dateTime.day)}$day ${checkZero(dateTime.hour)}:${checkZero(dateTime.minute)}";
    }catch (e){
      return "";
    }
  }

  //分钟 小时 秒 不足10之前补0
  static String checkZero(int num){
    if(num<10) return "0$num";
    return "$num";
  }

  static bool TimeIsNextDay(String date){
    try {
      DateTime dateTime = DateTime.parse(date);
      if (dateTime.hour < 6 && dateTime.hour >= 0) {
        return true;
      }
    }catch (e){
    }

    return false;
  }


  static String getYMDAfterNow(int index){
    DateTime dateTime =DateTime.now().add(new Duration(days: index));
    return "${dateTime.year}-${checkZero(dateTime.month)}-${checkZero(dateTime.day)}";
  }



  static String getWMDAfterNow(int index){
    DateTime dateTime =DateTime.now().add(new Duration(days: index));
    String week = "";
    switch(dateTime.weekday){
      case 1:
        week = "周一";
        break;
      case 2:
        week = "周二";
        break;
      case 3:
        week = "周三";
        break;
      case 4:
        week = "周四";
        break;
      case 5:
        week = "周五";
        break;
      case 6:
        week = "周六";
        break;
      case 7:
        week = "周日";
        break;
    }
    if(index==0) week="今天";
    return "$week${dateTime.month}月${dateTime.day}日";
  }


  //把秒数转化成mm:ss
  static String disTransMS(int date){
    String res = '${date~/60}';
    if(date%60>9){
      res += ':${date%60}';
    }else{
      res += ':0${date%60}';
    }
    return res;
  }
}
