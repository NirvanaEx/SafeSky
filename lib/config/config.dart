import 'dart:convert';

class Config {
  static const String apiUrl = 'http://91.213.31.234:8898/bpla_mobile_service/api/v1/';

  // Выделяем username и password отдельно
  static const String username = 'my_username';
  static const String password = 'my_password';

  // Создаем basicAuth, используя username и password
  static final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
}
