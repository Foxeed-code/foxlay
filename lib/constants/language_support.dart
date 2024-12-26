import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'home_title1': 'Quick Links',
          'search_customer': 'Search Customer',
          'expenses': 'Expenses',
          'report': 'Report',
          'settings': 'Settings',
          'date': 'Date',
          'add_expense': 'Add Expense',
          'transaction': 'Transaction',
          'Delete': 'Delete',
          'delete_title': 'Confirmation',
          'yes': 'Yes',
          'no': 'No',
        },
        'ta_IN': {
          'home_title1': 'இணைப்புகள்',
          'search_customer': 'வாடிக்கையாளரைத் தேடுங்கள்',
          'expenses': 'செலவுகள்',
          'report': 'அறிக்கை',
          'settings': 'அமைப்பு',
          'submit': 'சமர்ப்பிக்கவும்',
          'date': 'தேதி',
          'add_expense': 'செலவுகள் சேர்க்க',
          'month': 'மாதம்',
          'Delete': 'நீக்கவும்',
          'yes': 'ஆம்',
          'no': 'இல்லை',
        }
      };
}
