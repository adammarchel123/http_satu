import 'package:flutter/material.dart';
import 'package:http_empat/person.dart';
import 'package:http_empat/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> person = [];
  Repository repository = Repository();

  getData() async {
    person = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Http Request'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(person[index].name),
              subtitle: Text(
                person[index].message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(person[index].image),
                        fit: BoxFit.cover)),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: person.length),
    );
  }
}
