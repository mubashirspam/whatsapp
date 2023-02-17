import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/presentation/call/call_home_page.dart';
import 'package:whatsapp/presentation/chat/chat_home_page.dart';
import 'package:whatsapp/presentation/status/status_home_page.dart';
import 'package:whatsapp/presentation/widgets/custom_icon_button.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // late Timer timer;

  // updateUserPresence() {
  //   ref.read(authControllerProvider).updateUserPresence();
  // }

  // @override
  // void initState() {
  //   updateUserPresence();
  //   timer = Timer.periodic(
  //     const Duration(minutes: 1),
  //     (timer) => setState(() {}),
  //   );
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'WhatsApp',
            style: TextStyle(letterSpacing: 1),
          ),
          elevation: 1,
          actions: [
            CustomIconButton(onPressed: () {}, icon: Icons.search),
            CustomIconButton(onPressed: () {}, icon: Icons.more_vert),
          ],
          bottom: const TabBar(
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body:
         const TabBarView(
          children: [
            ChatHomePage(),
            
            StatusHomePage(),
            CallHomePage(),
          ],
        ),
      ),
    );
  }
}