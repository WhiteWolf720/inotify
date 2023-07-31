import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inotifyExe();
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controlNotificacion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "SNKRS",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/nike.png'),
            const Text(
              "Inserte el nombre del par que quisiera ganar en SNKRS",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: controlNotificacion,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  gotEm(controlNotificacion.text);
                  controlNotificacion.text = '';
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.redAccent;
                    }
                    return null;
                  }),
                ),
                child: const Text("Presiona para cumplir tu sueño"))
          ],
        ),
      ),
    );
  }
}

final FlutterLocalNotificationsPlugin notificationPlugin=FlutterLocalNotificationsPlugin();
Future<void> inotifyExe() async{
  const AndroidInitializationSettings initialConfig=AndroidInitializationSettings('app_icon');
  const InitializationSettings initializationSettings=InitializationSettings(android: initialConfig);
  await notificationPlugin.initialize(initializationSettings);
}
Future<void> gotEm(mensaje) async{
  const AndroidNotificationDetails androidDetails=AndroidNotificationDetails('channel_id', 'channel_name');
  const NotificationDetails notificationDetails=NotificationDetails(android: androidDetails);
  await notificationPlugin.show(1, "Got 'Em", "Los '$mensaje' son tuyos", notificationDetails);
}