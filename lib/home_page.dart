import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_restoration_app/next_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RestorationMixin{
  //final TextEditingController _controller = TextEditingController();
  final RestorableTextEditingController _controller = RestorableTextEditingController();
  final RestorableBool _isChecked = RestorableBool(false);
  //bool _isChecked = false;

  static Route<void> _secondScreenNavigation(context, arguments) =>
      CupertinoPageRoute(builder: (context) => const NextPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("State Restoration"),centerTitle: true),
      
      body: Column(
        children: [
           TextField(
            controller: _controller.value,
            decoration: const InputDecoration(hintText: 'First Name'),
          ),

          Checkbox(value: _isChecked.value, onChanged: (bool? e){
            setState(() {
              _isChecked.value = e ?? false;
            });
          }),
          
          MaterialButton(
            onPressed: () {

              //Navigator.restorablePushNamed(context, RouteGenerators.routeNextPage);

              Navigator.restorablePush(context, _secondScreenNavigation);
          } , child: const Text("NextScreen"),color: Colors.blue,textColor: Colors.white,)

        ],
      ),
    );
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => "home_page_restorationId";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
    registerForRestoration(_controller, "home_first_name");
    registerForRestoration(_isChecked, "home_check_box");
  }
}
