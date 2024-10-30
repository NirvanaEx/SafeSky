import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class AddRequestViewModel extends ChangeNotifier {
  // Текстовые контроллеры для полей ввода
  final TextEditingController requesterNameController = TextEditingController();
  final TextEditingController operatorNameController = TextEditingController(text: "Закиров Аслиддин Темурович");
  final TextEditingController operatorPhoneController = TextEditingController(text: "+998 ");
  final TextEditingController emailController = TextEditingController(text: "sample@gmail.com");
  final TextEditingController permitNumberController = TextEditingController();
  final TextEditingController contractNumberController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController latLngController = TextEditingController();
  final TextEditingController radiusController = TextEditingController();
  final TextEditingController flightHeightController = TextEditingController(); // Контроллер для высоты полета
  final TextEditingController startDateController = TextEditingController(); // Контроллер для даты начала
  final TextEditingController flightStartDateControllerTime = TextEditingController(); // Контроллер для времени начала полета
  final TextEditingController flightEndDateTimeController = TextEditingController(); // Контроллер для времени окончания полета
  final TextEditingController permitDateController = TextEditingController(); // Контроллер для даты разрешения
  final TextEditingController contractDateController = TextEditingController(); // Контроллер для даты контракта

  // Списки для выпадающих полей
  final List<String> models = ["Модель 1", "Модель 2", "Модель 3"];
  final List<String> regions = ["Ташкент", "Самарканд", "Бухара"];
  final List<String> purposes = ["Туризм", "Научные исследования", "Грузоперевозки"];
  final List<String> flightSigns = ["Знак 1", "Знак 2", "Знак 3"];


  // Переменные для работы с датами
  DateTime? startDate;
  DateTime? endDate;
  DateTime? flightStartDateTime;
  DateTime? flightEndDateTime;
  DateTime? permitDate;
  DateTime? contractDate;

  // Поля для выпадающих списков
  String? selectedModel;
  String? selectedRegion;
  String? selectedPurpose;

  String selectedCountryCode = "+998";

  // Доступные страны
  final List<Map<String, String>> countries = [
    {"code": "+998", "flag": "🇺🇿"},
    {"code": "+1", "flag": "🇺🇸"},
    {"code": "+44", "flag": "🇬🇧"},
    {"code": "+7", "flag": "🇷🇺"},
    {"code": "+997", "flag": "🇰🇿"},
  ];

  AddRequestViewModel() {
    phoneController.text = formatPhoneNumber("+998 99 333 11 22");
  }

  String formatPhoneNumber(String phoneNumber) {
    final countryCode = '+998';
    if (phoneNumber.startsWith(countryCode)) {
      return phoneNumber.replaceFirst(countryCode, '').trim();
    }
    return phoneNumber;
  }

  void updateCountryCode(String code) {
    selectedCountryCode = code;
    phoneController.clear();
    notifyListeners();
  }

  void updateDateField(DateTime date, TextEditingController controller) {
    // Устанавливаем отформатированную дату в контроллер
    controller.text = DateFormat('dd.MM.yyyy').format(date);
    notifyListeners(); // Обновляем интерфейс
  }


  void updateCoordinatesAndRadius(LatLng coordinates, double? radius) {
    latLngController.text = '${coordinates.latitude.toStringAsFixed(5)} ${coordinates.longitude.toStringAsFixed(5)}';
    radiusController.text = radius != null ? radius.toStringAsFixed(0) : '';
    notifyListeners();
  }

  // Методы обновления даты
  void updateStartDate(DateTime date) {
    startDate = date;
    startDateController.text = DateFormat('dd.MM.yyyy').format(date);
    notifyListeners();
  }

  void updateFlightStartDateTime(DateTime date) {
    flightStartDateTime = date;
    flightStartDateControllerTime.text = DateFormat('dd.MM.yyyy HH:mm').format(date);
    notifyListeners();
  }

  void updateFlightEndDateTime(DateTime date) {
    flightEndDateTime = date;
    flightEndDateTimeController.text = DateFormat('dd.MM.yyyy HH:mm').format(date);
    notifyListeners();
  }

  void updatePermitDate(DateTime date) {
    permitDate = date;
    permitDateController.text = DateFormat('dd.MM.yyyy').format(date);
    notifyListeners();
  }

  void updateContractDate(DateTime date) {
    contractDate = date;
    contractDateController.text = DateFormat('dd.MM.yyyy').format(date);
    notifyListeners();
  }

  void setModel(String model) {
    selectedModel = model;
    notifyListeners();
  }

  void setRegion(String region) {
    selectedRegion = region;
    notifyListeners();
  }

  void setPurpose(String purpose) {
    selectedPurpose = purpose;
    notifyListeners();
  }

  void submitRequest() {
    // Логика для отправки данных
    print("Submitting request");
    // После успешной отправки можно очистить поля
    clearFields();
  }

  void clearFields() {
    requesterNameController.clear();
    operatorNameController.clear();
    operatorPhoneController.clear();
    emailController.clear();
    permitNumberController.clear();
    contractNumberController.clear();
    noteController.clear();
    phoneController.clear();
    latLngController.clear();
    radiusController.clear();
    flightHeightController.clear();
    startDateController.clear();
    flightStartDateControllerTime.clear();
    flightEndDateTimeController.clear();
    permitDateController.clear();
    contractDateController.clear();

    startDate = null;
    endDate = null;
    flightStartDateTime = null;
    flightEndDateTime = null;
    permitDate = null;
    contractDate = null;
    selectedModel = null;
    selectedRegion = null;
    selectedPurpose = null;
    notifyListeners();
  }

  @override
  void dispose() {
    requesterNameController.dispose();
    operatorNameController.dispose();
    operatorPhoneController.dispose();
    emailController.dispose();
    permitNumberController.dispose();
    contractNumberController.dispose();
    noteController.dispose();
    phoneController.dispose();
    latLngController.dispose();
    radiusController.dispose();
    flightHeightController.dispose();
    startDateController.dispose();
    flightStartDateControllerTime.dispose();
    flightEndDateTimeController.dispose();
    permitDateController.dispose();
    contractDateController.dispose();
    super.dispose();
  }
}
