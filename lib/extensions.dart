import 'package:localized_rich_text/localized_rich_text.dart';

extension CustomListLocalizedRichTextKey on List<LocalizedRichTextKey> {
  ///This function return the [List<LocalizedRichTextKey>] ordered by the [text] to localize.
  ///
  ///The `keys` have to be translated in the same order like they are declared in the [text] to localize
  List<LocalizedRichTextKey> orderedByText(String text) {
    try {
      final _keys = map((i) => i.key).toList();

      final List<LocalizedRichTextKey> _listToReturn = [];

      final textSplitted = text.split(' ').toList();

      if (textSplitted.isNotEmpty) {
        for (final word in textSplitted) {
          for (final _key in _keys) {
            if (word.contains(_key)) {
              final keyToAdd = firstWhere((element) => element.key == _key);
              _listToReturn.add(keyToAdd);
              break;
            }
          }
        }

        return _listToReturn;
      }
      return this;
    } catch (e) {
      return this;
    }
  }
}

extension CustomString on String {
  bool containsOtherKeys(List<String> _keys) {
    for (final _key in _keys) {
      if (contains(_key)) {
        return true;
      }
    }

    return false;
  }
}
