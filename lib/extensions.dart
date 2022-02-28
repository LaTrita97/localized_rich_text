//import 'package:characters/src/extensions.dart';
import 'package:localized_rich_text/localized_rich_text.dart';

extension CustomListLocalizedRichTextKey on List<LocalizedRichTextKey> {
  ///This function return the [List<LocalizedRichTextKey>] ordered by the [text] to localize.
  ///
  ///The `keys` have to be translated in the same order like they are declared in the [text] to localize
  List<LocalizedRichTextKey> orderedByText(List<String> textSplitted) {
    try {
      final _keys = map((i) => i.key).toList();

      final List<LocalizedRichTextKey> _listToReturn = [];

      if (textSplitted.isNotEmpty) {
        for (final _key in _keys) {
          String keyFounded = '';

          for (final _ in textSplitted) {
            keyFounded += _;

            if (keyFounded.contains(_key)) {
              final keyToAdd = firstWhere((element) => element.key == _key);

              if (!_listToReturn.contains(keyToAdd)) {
                _listToReturn.add(keyToAdd);
              }
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
