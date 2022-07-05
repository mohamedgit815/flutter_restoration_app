import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> with RestorationMixin{

  final RestorableTextEditingController _controller = RestorableTextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NextPage"),centerTitle: true,),

      body: Column(
        children: [
          TextField(
            controller: _controller.value,
            decoration: const InputDecoration(hintText: 'Next Name'),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => "next_page_restorationId";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
    registerForRestoration(_controller, "home_next_name");
  }
}
