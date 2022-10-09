import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key ? key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key ? key }): super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _copyTextEditingController = TextEditingController();

  final TextEditingController _pasteTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff535FF7),
          title: const Text('FLUTTER GUYS'),
            centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         _copyField(),
         _pasteField()
        ],
      )
    );
  }

  Widget _copyField() {
    return Container(
      margin: const EdgeInsets.all(15),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _copyTextEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: const Color(0xffEEF2F7),
              hintText: 'Copy',
              filled: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.copy),
                  onPressed: () {
                    FlutterClipboard.copy(_copyTextEditingController.text);
                  },
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff535FF7), width: 2),
                  borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink[400] !, width: 2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
          ),
        ),
    );
  }

  Widget _pasteField() {
    return Container(
      margin: const EdgeInsets.all(15),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _pasteTextEditingController..text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: const Color(0xffEEF2F7),
              hintText: 'Paste',
              filled: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.paste),
                  onPressed: () {
                    FlutterClipboard.paste().then((value) {
                      setState(() {
                        _pasteTextEditingController.text = value;
                      });
                    });
                  },
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff535FF7), width: 2),
                  borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink[400] !, width: 2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
          ),
        ),
    );
  }
}
