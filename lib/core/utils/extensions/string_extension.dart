extension StringExtensionHelper on String? {
  String get toParagraph {
    if (this == null || this!.isEmpty) return '';
    final text = this!.toLowerCase();
    return text[0].toUpperCase() + text.substring(1);
  }

  String get toLowerToCapitalize => (this?.toLowerCase()).capitalizeFirstLetter;
  String get capitalizeFirstLetter {
    var string = this ?? '';
    if (string.isEmpty) {
      return string;
    }
    final brokenString = string.split(" ");
    var finalString = "";
    for (int i = 0; i < brokenString.length; i++) {
      var e = brokenString[i];
      if (e.trim().isNotEmpty) {
        e = e.substring(0, 1).toUpperCase() + e.substring(1).toLowerCase();
      }
      if (i == 0) {
        finalString = e;
      } else {
        finalString = "$finalString $e";
      }
    }
    return finalString;
  }
}
