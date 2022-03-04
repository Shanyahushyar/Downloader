import 'package:flutter/material.dart';

class Downloading extends StatelessWidget {
  const Downloading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('downloading'),
        centerTitle: true,
      ),
      body: const Center(child: Text('loading')
      
      ),
      
    );
  }
  
}
