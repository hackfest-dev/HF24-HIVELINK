import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'kn'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? knText = '',
  }) =>
      [enText, hiText, knText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'bo2jhe31': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
    },
    'sghz8lkq': {
      'en': 'Email Address',
      'hi': 'मेल पता',
      'kn': 'ಇಮೇಲ್ ವಿಳಾಸ',
    },
    't62an6gd': {
      'en': 'Enter your email address',
      'hi': 'अपना ईमेल पता दर्ज करें',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್ ವಿಳಾಸವನ್ನು ನಮೂದಿಸಿ',
    },
    'tmhf74zm': {
      'en': 'Password',
      'hi': '\nपासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
    },
    '7m5mls9v': {
      'en': 'Enter your password...',
      'hi': 'अपना कूटशब्द भरें...',
      'kn': 'ನಿಮ್ಮ ಗುಪ್ತಪದವನ್ನು ನಮೂದಿಸಿ...',
    },
    'a79u0pi0': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
    },
    'dj49ywca': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ',
    },
    'jizjdkcf': {
      'en': 'Create an Account',
      'hi': 'खाता बनाएं',
      'kn': 'ಖಾತೆಯನ್ನು ತೆರೆಯಿರಿ',
    },
    'f3iee787': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // forgotPassword
  {
    '4goo62a5': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ',
    },
    '78csgkvp': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'hi':
          'अपने खाते से संबद्ध ईमेल दर्ज करें और हम आपको एक सत्यापन कोड भेजेंगे।',
      'kn':
          'ನಿಮ್ಮ ಖಾತೆಯೊಂದಿಗೆ ಸಂಯೋಜಿತವಾಗಿರುವ ಇಮೇಲ್ ಅನ್ನು ನಮೂದಿಸಿ ಮತ್ತು ನಾವು ನಿಮಗೆ ಪರಿಶೀಲನಾ ಕೋಡ್ ಅನ್ನು ಕಳುಹಿಸುತ್ತೇವೆ.',
    },
    'bv5hzqov': {
      'en': 'Email Address',
      'hi': 'मेल पता',
      'kn': 'ಇಮೇಲ್ ವಿಳಾಸ',
    },
    'ljvbkgbl': {
      'en': 'Enter your email...',
      'hi': 'अपना ईमेल पता दर्ज करें',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್ ನಮೂದಿಸಿ...',
    },
    'yevbh93y': {
      'en': 'Send Reset Link',
      'hi': 'रीसेट लिंक भेजें',
      'kn': 'ಮರುಹೊಂದಿಸುವ ಲಿಂಕ್ ಕಳುಹಿಸಿ',
    },
    'ulw4vj2k': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // homePage
  {
    '9tse9nlr': {
      'en': 'Google Maps',
      'hi': 'गूगल मानचित्र',
      'kn': 'ಗೂಗಲ್ ನಕ್ಷೆಗಳು',
    },
    'pycf13yz': {
      'en': 'View Your Beehives Here ',
      'hi': 'अपने मधुमक्खी के छत्ते यहां देखें',
      'kn': 'ನಿಮ್ಮ ಜೇನುಗೂಡುಗಳನ್ನು ಇಲ್ಲಿ ವೀಕ್ಷಿಸಿ',
    },
    'dm1z5h7b': {
      'en': 'My Hives',
      'hi': 'मेरे पित्ती',
      'kn': 'ನನ್ನ ಜೇನುಗೂಡುಗಳು',
    },
    '35j0p7kq': {
      'en': 'See how your beehives are doing ',
      'hi': 'देखें कि आपके छत्ते कैसे काम कर रहे हैं',
      'kn': 'ನಿಮ್ಮ ಜೇನುಗೂಡುಗಳು ಹೇಗೆ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿವೆ ಎಂಬುದನ್ನು ನೋಡಿ',
    },
    'qata6n8i': {
      'en': 'Feeding Schedule',
      'hi': 'भोजन अनुसूची',
      'kn': 'ಆಹಾರ ವೇಳಾಪಟ್ಟಿ',
    },
    '52y35hd1': {
      'en': 'Check when to feed your bees.',
      'hi': 'जांचें कि अपनी मधुमक्खियों को कब खिलाना है',
      'kn': 'ನಿಮ್ಮ ಜೇನುನೊಣಗಳಿಗೆ ಯಾವಾಗ ಆಹಾರವನ್ನು ನೀಡಬೇಕೆಂದು ಪರಿಶೀಲಿಸಿ.',
    },
    '23wdt85c': {
      'en': 'Community Hub',
      'hi': 'समुदाय हब',
      'kn': 'ಸಮುದಾಯ ಕೇಂದ್ರ',
    },
    'nkuguhu8': {
      'en': 'Check in with the community ',
      'hi': 'समुदाय के साथ जाँच करें',
      'kn': 'ಸಮುದಾಯದೊಂದಿಗೆ ಪರಿಶೀಲಿಸಿ',
    },
    'w3jwvm2s': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // myHives
  {
    '4a7ltj4t': {
      'en': 'My Hives',
      'hi': 'मेरे पित्ती',
      'kn': 'ನನ್ನ ಜೇನುಗೂಡುಗಳು',
    },
    'y78smh6b': {
      'en': 'Check in on your Beehives',
      'hi': 'अपने छत्तों की जाँच करें',
      'kn': 'ನಿಮ್ಮ ಜೇನುಗೂಡುಗಳನ್ನು ಪರಿಶೀಲಿಸಿ',
    },
    'tnj08h1h': {
      'en': 'Hives',
      'hi': 'हीव्स',
      'kn': 'ಜೇನುಗೂಡುಗಳು',
    },
  },
  // registrationPage
  {
    'b2uorw2x': {
      'en': 'Registration Page',
      'hi': 'पंजीकरण पृष्ठ',
      'kn': 'ನೋಂದಣಿ ಪುಟ',
    },
    '6egcjhs0': {
      'en': 'Email',
      'hi': 'मेल पता',
      'kn': 'ಇಮೇಲ್',
    },
    '4p98o9qk': {
      'en': 'Enter your Email',
      'hi': 'अपना ईमेल पता दर्ज करें',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್ ನಮೂದಿಸಿ',
    },
    'wea60myg': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'kn': 'ಗುಪ್ತಪದ',
    },
    'rst09r6i': {
      'en': 'Enter your Password',
      'hi': 'अपना कूटशब्द भरें',
      'kn': 'ನಿಮ್ಮ ಗುಪ್ತಪದವನ್ನು ನಮೂದಿಸಿ',
    },
    'r0atog4q': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ದೃಢೀಕರಿಸಿ',
    },
    '7qj1t7pn': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ದೃಢೀಕರಿಸಿ',
    },
    '38z1ooty': {
      'en': 'Aadhar Card Number',
      'hi': 'आधार कार्ड नंबर',
      'kn': 'ಆಧಾರ್ ಕಾರ್ಡ್ ಸಂಖ್ಯೆ',
    },
    'eso1jveb': {
      'en': 'Enter your Aadhar Card Number',
      'hi': 'अपना आधार कार्ड नंबर दर्ज करें',
      'kn': 'ನಿಮ್ಮ ಆಧಾರ್ ಕಾರ್ಡ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ',
    },
    'z4s2hjoq': {
      'en': 'Enter your date of birth',
      'hi': 'आपका जन्म तारीख प्रवेश करे',
      'kn': 'ನಿಮ್ಮ ಜನ್ಮ ದಿನಾಂಕವನ್ನು ನಮೂದಿಸಿ',
    },
    'qz76qlwd': {
      'en': 'Male',
      'hi': 'पुरुष',
      'kn': 'ಪುರುಷ',
    },
    'tpgxpd8g': {
      'en': 'Female',
      'hi': 'महिला',
      'kn': 'ಹೆಣ್ಣು',
    },
    'clev92rl': {
      'en': 'Address',
      'hi': 'पता',
      'kn': 'ವಿಳಾಸ',
    },
    'y3bzjej3': {
      'en': 'Enter your address',
      'hi': 'अपना पता दर्ज करें',
      'kn': 'ನಿಮ್ಮ ವಿಳಾಸವನ್ನು ನಮೂದಿಸಿ',
    },
    'cwkj1wl3': {
      'en': 'Postal code',
      'hi': 'डाक कोड',
      'kn': 'ಅಂಚೆ ಕೋಡ್',
    },
    'tvtd22uf': {
      'en': 'Enter your postal code',
      'hi': 'अपना डाक कोड दर्ज करें',
      'kn': 'ನಿಮ್ಮ ಪೋಸ್ಟಲ್ ಕೋಡ್ ನಮೂದಿಸಿ',
    },
    'xpcc8svp': {
      'en': 'Submit',
      'hi': 'जमा करना',
      'kn': 'ಸಲ್ಲಿಸು',
    },
    '4l2kvti3': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'yklhlak3': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    'm5nyh8na': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'leb8kmno': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    'y10brz2a': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'lks4o03u': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    'l30wxyc4': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'wcirdqj8': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    '11iz2wqo': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'jurk4gqt': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    '4tems3mq': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'ht1s8uhu': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
  },
  // hiveDetailsPage
  {
    '17wlebl5': {
      'en': 'Hive Details',
      'hi': 'छत्ता विवरण',
      'kn': 'ಗೂಡಿನ  ವಿವರಗಳು',
    },
    '5jpt2ir8': {
      'en': 'Location',
      'hi': 'जगह',
      'kn': 'ಸ್ಥಳ',
    },
    '5ow6l01d': {
      'en': 'Humidity',
      'hi': 'नमी',
      'kn': 'ಆರ್ದ್ರತೆ',
    },
    'hjw459vm': {
      'en': 'Temperature',
      'hi': 'तापमान',
      'kn': 'ತಾಪಮಾನ',
    },
    '65hnw832': {
      'en': 'Supplement Quantity',
      'hi': 'अनुपूरक स्तर',
      'kn': 'ಪೂರಕ ಮಟ್ಟ',
    },
    'cjz7cdhf': {
      'en': 'Weight',
      'hi': 'अनुपूरक स्तर',
      'kn': 'ತೂಕ',
    },
    't2c8e8ca': {
      'en': 'Status',
      'hi': 'स्थिति',
      'kn': 'ಸ್ಥಿತಿ',
    },
    'c7feqxj2': {
      'en': 'Swarming',
      'hi': 'स्थिति',
      'kn': 'ಸ್ಥಿತಿ',
    },
    'x6133rp6': {
      'en': 'Absconding',
      'hi': 'स्थिति',
      'kn': 'ಸ್ಥಿತಿ',
    },
  },
  // chatPage
  {
    'xv47fn1f': {
      'en': 'Label here...',
      'hi': '',
      'kn': '',
    },
    'sb79c6an': {
      'en': 'Chat',
      'hi': 'समुदाय',
      'kn': 'ಸಮುದಾಯ',
    },
  },
  // GoogleMapsPage
  {
    '1wdr6hkt': {
      'en': 'Google Maps',
      'hi': 'गूगल मानचित्र',
      'kn': 'ಗೂಗಲ್ ನಕ್ಷೆಗಳು',
    },
    '7ctjqhrw': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
    },
  },
  // FeedingShedule
  {
    'rw44volf': {
      'en': 'Feeding Shedule',
      'hi': 'मेरे पित्ती',
      'kn': 'ನನ್ನ ಜೇನುಗೂಡುಗಳು',
    },
    'jy21a222': {
      'en': 'Check in on your Beehives',
      'hi': 'अपने छत्तों की जाँच करें',
      'kn': 'ನಿಮ್ಮ ಜೇನುಗೂಡುಗಳಲ್ಲಿ ಪರಿಶೀಲಿಸಿ',
    },
    '54q6d4o1': {
      'en': 'Shedule',
      'hi': 'हीव्स',
      'kn': 'ಜೇನುಗೂಡುಗಳು',
    },
  },
  // DataSimulationPage
  {
    'qzj2hd6e': {
      'en': 'Simulation Demo\nSwarming/Absconding',
      'hi': 'पंजीकरण पृष्ठ',
      'kn': 'ನೋಂದಣಿ ಪುಟ',
    },
    'i5v32d0h': {
      'en': 'Humidity',
      'hi': 'मेल पता',
      'kn': 'ಇಮೇಲ್',
    },
    '02r8efsc': {
      'en': 'Enter Hive Humidity',
      'hi': 'अपना ईमेल पता दर्ज करें',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್ ನಮೂದಿಸಿ',
    },
    '1n9f0o19': {
      'en': 'Hive Temperature',
      'hi': 'आधार कार्ड नंबर',
      'kn': 'ಆಧಾರ್ ಕಾರ್ಡ್ ಸಂಖ್ಯೆ',
    },
    'zawsr9xv': {
      'en': 'Enter Hive Temperature',
      'hi': 'अपना आधार कार्ड नंबर दर्ज करें',
      'kn': 'ನಿಮ್ಮ ಆಧಾರ್ ಕಾರ್ಡ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ',
    },
    'zbjq7lo2': {
      'en': 'Hive Audio',
      'hi': 'जमा करना',
      'kn': 'ಸಲ್ಲಿಸು',
    },
    'y7hmsw50': {
      'en': 'Submit',
      'hi': 'जमा करना',
      'kn': 'ಸಲ್ಲಿಸು',
    },
    'qhjtq7i0': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    '2nbqeeol': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    'ttie1jnj': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'o48pxigo': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    'cwy14gtd': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'l37wtpz2': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    'p71fpoyd': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    '7ra05zc5': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    'm6yy9toq': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'tau9mw6g': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    'o1sdw53e': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'qq2rd6w4': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
    '8fl12isi': {
      'en': 'Testing',
      'hi': '',
      'kn': '',
    },
  },
  // GraphPage
  {
    'u3jqyg4h': {
      'en': 'Advanced Details',
      'hi': '',
      'kn': '',
    },
    'kns7i841': {
      'en': 'Humidity',
      'hi': '',
      'kn': '',
    },
    'm93y8qhf': {
      'en': 'TIme',
      'hi': '',
      'kn': '',
    },
    'zlnzkzyy': {
      'en': 'Temperature',
      'hi': '',
      'kn': '',
    },
    'ltw0bci4': {
      'en': 'Temperature',
      'hi': '',
      'kn': '',
    },
    'h0i6ohd7': {
      'en': 'TIme',
      'hi': '',
      'kn': '',
    },
    'y6mgzj3i': {
      'en': 'Temperature',
      'hi': '',
      'kn': '',
    },
    'rjipk2o7': {
      'en': 'Test Input',
      'hi': '',
      'kn': '',
    },
    '64zk1eug': {
      'en': 'Home',
      'hi': '',
      'kn': '',
    },
  },
  // main_Logo
  {
    'kyjbzipl': {
      'en': 'HiveLink',
      'hi': 'हाइवलिंक',
      'kn': 'ಹೈವ್ ಲಿಂಕ್',
    },
  },
  // logout
  {
    'egaoau3h': {
      'en': 'Logout',
      'hi': 'लॉग आउट',
      'kn': 'ಲಾಗ್ ಔಟ್',
    },
  },
  // AddHive
  {
    'ru7q1xbz': {
      'en': 'Add Hive',
      'hi': 'छत्ता जोड़ें',
      'kn': 'ಜೇನು ಗೂಡನ್ನು  ಸೇರಿಸಿ',
    },
    'hcsjl29c': {
      'en': 'Please enter the information below to add a Hive.',
      'hi': 'हाइव जोड़ने के लिए कृपया नीचे दी गई जानकारी दर्ज करें।',
      'kn': 'ಜೇನುಗೂಡು ಸೇರಿಸಲು ದಯವಿಟ್ಟು ಕೆಳಗಿನ ಮಾಹಿತಿಯನ್ನು ನಮೂದಿಸಿ.',
    },
    '8s720b37': {
      'en': 'Hive Name',
      'hi': 'छत्ता का नाम',
      'kn': 'ಜೇನುಗೂಡಿನ ಹೆಸರು',
    },
    'xn48r0sr': {
      'en': 'Select Location',
      'hi': 'स्थान चुनें',
      'kn': 'ಸ್ಥಳವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
    },
    'ue3qrksf': {
      'en': 'Enter Code',
      'hi': 'कोड दर्ज करें',
      'kn': 'ಕೋಡ್ ನಮೂದಿಸಿ',
    },
    '3l0suwya': {
      'en': 'Add Hive',
      'hi': 'शोकेस बनाएं',
      'kn': 'ಸೇರಿಸಿ',
    },
    'iq57n3jb': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
    },
    'qdca1hx6': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से एक विकल्प चुनें',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
    },
  },
  // formEntry
  {
    'oosacwf4': {
      'en': 'Hive Weight',
      'hi': 'पता',
      'kn': 'ವಿಳಾಸ',
    },
    'x5mzjdqp': {
      'en': 'Enter Hive Weight',
      'hi': 'अपना पता दर्ज करें',
      'kn': 'ನಿಮ್ಮ ವಿಳಾಸವನ್ನು ನಮೂದಿಸಿ',
    },
  },
  // Miscellaneous
  {
    'm4ut5lz4': {
      'en': 'Bee Blogs',
      'hi': '',
      'kn': '',
    },
    'oyhj19ta': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '8fams4eh': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '27spuo46': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'vmbhukvi': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '9r0aavfq': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '9ww1ejyj': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '50u4c6bx': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'eq4zgzuh': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'i5s3wu3e': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'w5hwgcgi': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'kt9acnu7': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '4k6pdhkz': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'blkujvsa': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'pr249z6j': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '8z0gxbwk': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'zn0dtz3q': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'zdnh3uoz': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'efdn5jk3': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'g1kiflj2': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'qfpaipaw': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'hsfswpzf': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'ciitsmdc': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'cq8opzhp': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'l81ioqdc': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'kzdx2x5b': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'k3akbwnf': {
      'en': '',
      'hi': '',
      'kn': '',
    },
  },
].reduce((a, b) => a..addAll(b));
