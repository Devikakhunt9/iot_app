import 'package:iot_application1/core/mqtt/mqtt_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  MqttService mqttService = MqttService();
  @override
  void initState(){
    mqttService.connect();
  }
  static const String relaysKey = 'relays';
  static const String dimmersKey = 'dimmers';
  static String relayValue = '';
  static String emailValue = 'email';
  static String otpValue = "otp";

  static Future<void> saveRelays(List<int> relays) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(relaysKey, relays.map((e) => e.toString()).toList());
  }

  static Future<void> publishMsg(String msg) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(relayValue,msg);
  }

  static Future<void> saveDimmers(int dimmer) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(dimmersKey, dimmer);
  }

  static Future<void> saveEmail(String email)
  async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(emailValue, email);
  }

  static Future<void> saveOTP(String otp)
  async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(otpValue, otp);
  }

  static Future<List<int>> getRelays() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(relaysKey)?.map((e) => int.parse(e)).toList() ?? [];
  }

  static Future<int?> getDimmers() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(dimmersKey);
  }

  static Future<String?> getRelayValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(relayValue);
  }


  static Future<String?> getEmailValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailValue);
  }

  static Future<String?> getOtpValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(otpValue);
  }

  static Future<bool> clearData() async {
    final pref = await SharedPreferences.getInstance();
    return pref.clear();
  }
}
