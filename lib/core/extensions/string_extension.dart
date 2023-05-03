
extension StringExtension on String {
  String? farsiNumber() {
    String? text = this;
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', "."];
    const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩', "٫"];
    for (int i = 0; i < english.length; i++) {
      text = text?.replaceAll(english[i], farsi[i]);
    }
    return text;
  }

  String? englishNumber() {
    String? text = this;
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', "."];
    const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩', "٫"];
    for (int i = 0; i < english.length; i++) {
      text = text?.replaceAll(farsi[i], english[i]);
    }
    return text;
  }
}
