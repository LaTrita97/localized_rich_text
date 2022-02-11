library localized_rich_text;

import 'package:flutter/material.dart';
import 'package:localized_rich_text/extensions.dart';

/// `RichText` for dynamic `String` to localize.
///
/// Ideally, the `RichText` `text` has to be composed of `dynamic` and `static` words.
///
///```dart
/// final textToLocalize = "Hi #name, how are you?";
/// //Static words: Hi, how are you?
/// //Dynamic words: #name
///```
///
///
/// ### Example:
///```dart
/// final textToLocalize = "Hi #name, how are you?";
/// final userName = "Jhon";
/// ...
///LocalizedRichText(
///  textToLocalize,
///  defaultTextStyle: Theme.of(context).textTheme.bodyText1!,
///  keys: [
///    LocalizedRichTextKey(
///      key: '#name',
///      value: userName,
///      textStyle: Theme.of(context).textTheme.subtitle1!,
///    ),
///  ],
///)
///
///```
class LocalizedRichText extends StatelessWidget {
  /// This must be the `String` to localize.
  ///
  /// The `dynamic` values inside the [text] have to be **unique**,
  /// you can mark them with a special character, or you can use a unique value.
  ///
  /// The string could be:
  ///```dart
  /// final textToLocalize = "Hi #name, how are you?";
  ///```
  /// or
  ///```dart
  /// AppLocalizations.of(context)!.title,
  ///```
  /// For more info about `internationalization` you can check the
  /// [flutter documentation](https://docs.flutter.dev/development/accessibility-and-localization/internationalization).
  final String text;

  /// This is the `TextStyle` used for the static words.
  final TextStyle defaultTextStyle;

  /// This is the `List` that has to contain the `dynamic` values.
  ///
  /// Each `dynamic` value has to be passed like an [LocalizedRichTextKey] object.
  /// This list cannot be `empty`.
  ///
  /// It could be:
  ///```dart
  ///LocalizedRichText(
  ///  ...,
  ///  keys: [
  ///    LocalizedRichTextKey(
  ///      key: '#name',
  ///      value: userName,
  ///      textStyle: Theme.of(context).textTheme.subtitle1!,
  ///    ),
  ///  ],
  ///)
  ///
  ///```
  final List<LocalizedRichTextKey> keys;

  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  LocalizedRichText({
    Key? key,
    required this.text,
    required this.defaultTextStyle,
    required this.keys,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor = 1.0,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
  })  : assert(
          text.isNotEmpty && keys.isNotEmpty,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      key: key,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      text: TextSpan(
        text: '',
        children: richTextChildren,
      ),
    );
  }

  List<TextSpan> get richTextChildren {
    List<TextSpan> textSpans = [];

    //Text to localize
    String localizedText = text;
    final _keys = keys.orderedByText(text);

    for (final localizedKey in _keys) {
      //Key dynamic value
      final _key = localizedKey.key;

      //Check if is present a String before the first localizedKey
      final textBeforeTheKey = localizedText.split(_key).first;

      //Add the textBeforeTheKey if present
      if (textBeforeTheKey.isNotEmpty) {
        _addTextSpan(
          textSpans,
          textBeforeTheKey,
          defaultTextStyle,
        );
      }

      //Add the custom TextSpan
      _addTextSpan(
        textSpans,
        localizedKey.value,
        localizedKey.textStyle,
      );

      final textAfterTheKey = localizedText.split(_key).last;

      //If is the last Key, we control if there is a String after her
      if (localizedKey == _keys.last) {
        //Add the textAfterTheKey if present
        if (textAfterTheKey.isNotEmpty) {
          _addTextSpan(
            textSpans,
            textAfterTheKey,
            defaultTextStyle,
          );
        }
      } else {
        localizedText = textAfterTheKey;
      }
    }

    return textSpans;
  }

  void _addTextSpan(
    List<TextSpan> list,
    String text,
    TextStyle textStyle,
  ) {
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    return list.add(textSpan);
  }
}

/// This class represents a single `dynamic` value inside the `String` that has to be localized.
class LocalizedRichTextKey {
  /// This `Key` must be equal to the `Key` used inside
  /// the [LocalizedRichText.text] for represent the `dynamic` value.
  String key;

  /// This must be the effective value of the `Key`, that has to be shown.
  String value;

  /// This is the `TextStyle` of the `Key`.
  TextStyle textStyle;

  LocalizedRichTextKey({
    required this.key,
    required this.value,
    required this.textStyle,
  });
}
