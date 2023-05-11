import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localized_rich_text/localized_rich_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textToLocalize = "Hi #name, how are you? I'm #myName!";
  final name = "Jhon";
  final myName = "Simon";

  final textSpanProperties = TextSpanProperties(
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        //Do something
      },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localized RichText'),
      ),
      body: Center(
        child: LocalizedRichText(
          text: textToLocalize,
          defaultTextStyle: Theme.of(context).textTheme.bodyLarge!,
          keys: [
            LocalizedRichTextKey(
              key: '#name',
              value: name,
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
              textSpanProperties: textSpanProperties,
            ),
            LocalizedRichTextKey(
              key: '#myName',
              value: myName,
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
