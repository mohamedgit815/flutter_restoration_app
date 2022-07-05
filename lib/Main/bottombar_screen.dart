import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_restoration_app/ViewModel/State/switch_state.dart';


class MainBottomBarScreen extends ConsumerStatefulWidget {
  static const String bottomBar = '/MainBottomBarScreen';
  const MainBottomBarScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainBottomBarScreen> createState() => _MainBottomBarScreenState();
}

class _MainBottomBarScreenState extends ConsumerState<MainBottomBarScreen> {
  final DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Directionality(
          textDirection: TextDirection.ltr,
          child: WillPopScope(
            onWillPop: () async {
              //return customExitApp(dateTime: _dateTime);
              return true;
            },
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const [
                  //BottomNavigationBarItem(icon: const Icon(Icons.home_outlined),label: '${context.translate!.translate(MainEnum.textHome.name)}') ,
                  //BottomNavigationBarItem(icon: const Icon(Icons.chat_bubble_outline),label: '${context.translate!.translate(MainEnum.textChat.name)}') ,
                ],
                currentIndex: ref.read(_bottomBar).count,
                onTap: (int v){
                  ref.read(_bottomBar).countState(v);
                },
              ),
              body: Stack(
                  children: ref.read(_bottomBar).pages.asMap()
                      .map((i, screen) => MapEntry(i,
                      Offstage(offstage: ref.watch(_bottomBar).count != i,child: screen,)))
                      .values.toList()

              ),
            ),
          ),
        ),

      ],
    );
  }
}

final  _bottomBar = ChangeNotifierProvider<SwitchState>((ref)=>SwitchState());