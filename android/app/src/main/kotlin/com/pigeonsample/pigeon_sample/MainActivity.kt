package com.pigeonsample.pigeon_sample

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.*

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        super.configureFlutterEngine(flutterEngine)
        PigeonSample.BookApi.setup(flutterEngine.dartExecutor.binaryMessenger, MyBookApi())
    }
}

class MyBookApi : PigeonSample.BookApi {
    override fun search(keyword: String): MutableList<PigeonSample.Book> {
        val book = PigeonSample.Book()
        book.author =" Melanie Mitchell";
        book.title ="Artificial Intelligence: A Guide for Thinking Humans"
        return  Collections.singletonList(book);
    }
}
