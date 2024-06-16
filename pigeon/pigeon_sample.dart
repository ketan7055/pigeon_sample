import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
    dartOut: 'lib/pigeon_sample.dart',
    javaOut:
    'android/app/src/main/kotlin/com/pigeonsample/pigeon_sample/PigeonSample.java',
    javaOptions: JavaOptions(package: 'com.pigeonsample.pigeon_sample'),
    objcHeaderOut: 'ios/Runner/PigeonSample.h',
    objcSourceOut: 'ios/Runner/PigeonSample.m'))

class Book {
  String? title;
  String? author;
}

@HostApi()
abstract class BookApi {
  List<Book?> search(String keyword);
}