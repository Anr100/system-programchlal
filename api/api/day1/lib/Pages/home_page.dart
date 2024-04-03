import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int done = 0;
  List<Todo>myTodos = []
  bool isLoading = true;

  void fetchData() {
    try{
      http.Response response =
           await http.get(Uri.parse('http://127.0.0.1:8001/api'));
      var data = jsonDecode(response.body);
      data.forEach((todo){
        Todo t =Todo(
          id: todo['id'],
          title: todo['title'],
          desc: todo ['desc'],
          date: todo['date'],
          isDone: todo['isDone'],
        )
      });
      if (todo['isDone']){
        done +=1;
      }
      myTodos.add(t);
    }catch (e) {
      print('aldaa garlaa $e');
    }
  }
  @override
  void initState(){
    super.initState()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(,)),
    );
  }
}