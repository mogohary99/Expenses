

extension FormateNum on double{
  String get toFormat{
    String formattedNumber = toStringAsFixed(2).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]},',
    );
    return formattedNumber;
  }
}