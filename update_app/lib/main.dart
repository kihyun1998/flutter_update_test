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
          backgroundColor: const Color.fromARGB(255, 197, 164, 164),
          appBar: AppBar(
            title: const Text("App Update Test"),
            backgroundColor: const Color.fromARGB(255, 197, 164, 164),
          ),
          body: Center(
            child: Column(
              children: [
                const Text(
                  "Before Update",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String feedURL = 'http://127.0.0.1:8000/dist/appcast.xml';

                    // 로그 남겨야할 부분이다.
                    await autoUpdater.setFeedURL(feedURL);
                    await autoUpdater.checkForUpdates(inBackground: false);
                    await autoUpdater.setScheduledCheckInterval(1);
                  },
                  child: const Text("Is update?"),
                ),
              ],
            ),
          ),
        ));
  }
}
