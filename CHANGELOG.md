## 0.0.7

- Requires Dart `3.0` or later.
- Requires Flutter `3.10.0` or later.
- Updated `ext.kotlin_version` to `1.5.31` ([Bug fix](https://github.com/LaTrita97/localized_rich_text/issues/5)).

## 0.0.6

- Added `TextSpanProperties` to `LocalizedRichTextKey`.

  This allows you to add `GestureRecognizer`, `MouseCursor`, `Function(PointerEnterEvent)? onEnter`, `Function(PointerExitEvent)? onExit`, `semanticsLabel`, `Locale` and `spellOut` to your custom `keys`.

## 0.0.5

- Added web support 🎉

## 0.0.4

- Fixed an issue on getting all the Keys, now you don't have to put a space between two keys within the text that you have to translate.

## 0.0.3

- Fixed an issue on incorrectly removing spaces ([issue link](https://github.com/LaTrita97/localized_rich_text/issues/2)).

## 0.0.2

- Regardless of the way how you declare the `Keys` inside the `keys array`, they will be showed by the order in which they are declared inside the `String` to localize.

## 0.0.1

- Initial version.
