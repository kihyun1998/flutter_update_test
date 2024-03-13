import 'package:auto_updater/auto_updater.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text("App Update Test")),
          body: Center(
            child: Column(
              children: [
                const Text("After Update"),
                ElevatedButton(
                    onPressed: () async {
                      String feedURL = 'http://127.0.0.1:8000/dist/appcast.xml';

                      // 로그 남겨야할 부분이다.
                      await autoUpdater.setFeedURL(feedURL);
                      await autoUpdater.checkForUpdates();
                      await autoUpdater.setScheduledCheckInterval(3600);
                    },
                    child: const Text("Is update?")),
              ],
            ),
          ),
        ));
  }
}
