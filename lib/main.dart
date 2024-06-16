import 'package:flutter/material.dart';
import 'package:pigeon_sample/pigeon_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Book> books = [];
  Book? book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Click for book details'),
                onPressed: getBook,
              ),
              const SizedBox(height: 20),

              if(book != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Book Name:',
                          style: TextStyle(fontSize: 20),

                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            book?.title ?? '',
                            maxLines: 2,
                            style: const TextStyle(color: Colors.green, fontSize: 20),

                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Author Name:',
                          style: TextStyle(fontSize: 20),

                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            book?.author ?? '',
                            maxLines: 2,
                            style: const TextStyle(color: Colors.orange, fontSize: 20),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future getBook() async {
    final number = this.books.length - 1;
    final List<Book?> books = await BookApi().search('Book $number');
    final newBooks = List<Book>.from(books);
    setState(() {
      this.books.addAll(newBooks);
      book = this.books.first;
    });
  }
}
