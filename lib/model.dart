// インポート
import 'package:shared_preferences/shared_preferences.dart';

// 利用例
saveFlag(bool flag) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('FLAG', flag);
}
loadFlag() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('FLAG') ?? false;
}