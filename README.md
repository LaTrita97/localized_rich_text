<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A flutter plugin to facilitate the localization of a RichText.

## Getting started

Install the library in your `pubspec.yaml`.

```dart
dependencies:
  localized_rich_text: ^0.0.1
```

## Usage
```dart
final textToLocalize = "Hi #name, how are you?";
final userName = "Jhon";
...
LocalizedRichText(
  text: textToLocalize,
  defaultTextStyle: Theme.of(context).textTheme.bodyText1!,
  keys: [
    LocalizedRichTextKey(
      key: '#name',
      value: userName,
      textStyle: Theme.of(context).textTheme.subtitle1!,
    ),
  ],
)
```

## Parameters explanation

#### text </br>
This must be the `String` to localize.</br>
The `dynamic` values inside the <strong><em>text</em></strong> have to be **unique**,
you can mark them with a special character, or you can use a unique value.
</br>
</br>
The string could be:
```dart
final textToLocalize = "Hi #name, how are you?";
```
or
```dart
AppLocalizations.of(context)!.title,
```
For more info about `internationalization` you can check the
[flutter documentation](https://docs.flutter.dev/development/accessibility-and-localization/internationalization).

#### defaultTextStyle </br>
This is the `TextStyle` used for the static words.

#### keys </br>
This is the `List` that has to contain the `dynamic` values.
</br>
Each `dynamic` value has to be passed like an **LocalizedRichTextKey** object.
</br>
This list cannot be `empty`.
</br>
It could be:
```dart
LocalizedRichText(
  ...,
  keys: [
    LocalizedRichTextKey(
      key: '#name',
      value: userName,
      textStyle: Theme.of(context).textTheme.subtitle1!,
    ),
  ],
)
```
