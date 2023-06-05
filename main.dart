import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pertemuan10Screen extends StatefulWidget {
  const Pertemuan10Screen({super.key});

  @override
  State<Pertemuan10Screen> createState() => _Pertemuan10ScreenState();
}

class _Pertemuan10ScreenState extends State<Pertemuan10Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 16),
        MaterialBanner(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Banner',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('text.')
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => ScaffoldMessenger.of(context)
                    ..removeCurrentMaterialBanner()
                    ..showMaterialBanner(ShowBanner(context)),
                  child: const Text('show banner'))
            ],),
            Materialbanner(
              content : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'dialog',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),Text('Text')
              ],
            ),
            Actions: [
              TextButton(
                onPressed: () => showDialog(
                  context: context, 
                  builder: (context) => showsimpledialog(context)), child: const Text('alert dialog')),
              TextButton(
                onPressed: () => showDialog(
                  context: context, 
                  builder: (context) => showsimpledialog(context)), child: const Text('simple dialog')),
              TextButton(
                onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: ((context) => FullscreenDialog())
                ),
              ), child: const Text('Fullscreen dialog'))
            ]
      ]),
    );
  }

  ShowBanner(BuildContext context) {
    return MaterialBanner(
      content: const Text('Welcome to baneer Info'),
      leading: const Icon(
        Icons.info,
        color: Colors.orange,
      ),
      actions: [
        TextButton(onPressed: () {}, child: const Text('agree')),
        TextButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            child: const Text('dismiss'))
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('reset setting?'),
      content: const Text(
          'they will reset your device to its default factory settings.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('cancle'),
        ),
        TextButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          child: Text('accept'),
        )
      ],
    );
  }

  showsimpledialog(BuildContext context) {
    return SimpleDialog(
      title: const Text('Set backup account'),
      children: List.generate(4, ((index) {
        return SimpleDialogOption(
          onPressed: () => Navigator.pop(context, 'mail$index@mail.com'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.abc, size: 36.0, color: Colors.amber),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16.0),
                child: Text('Username$index'),
              )
            ],
          ),
        );
      })),
    );
  }
}
