// utils/app_localizations.dart
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'MiniBank',
      'dashboard': 'Dashboard',
      'balance': 'Balance',
      'transfer': 'Transfer',
      'deposit': 'Deposit',
      'withdraw': 'Withdraw',
      'history': 'History',
      'settings': 'Settings',
    },
    'fr': {
      'app_name': 'MiniBanque',
      'dashboard': 'Tableau de bord',
      'balance': 'Solde',
      'transfer': 'Transférer',
      'deposit': 'Dépôt',
      'withdraw': 'Retrait',
      'history': 'Historique',
      'settings': 'Paramètres',
    },
    'ar': {
      'app_name': 'ميني بنك',
      'dashboard': 'لوحة التحكم',
      'balance': 'الرصيد',
      'transfer': 'تحويل',
      'deposit': 'إيداع',
      'withdraw': 'سحب',
      'history': 'السجل',
      'settings': 'الإعدادات',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}