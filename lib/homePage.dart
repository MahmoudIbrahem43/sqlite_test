import 'package:flutter/material.dart';
import 'package:sqlite_app/sql.db.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqlite App'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: MaterialButton(
                color: Colors.red,
                onPressed: () async {
                  List<Map> response =
                      await sqlDb.readData("SELECT * FROM 'notes'");
                  print('$response');
                },
                child: const Text('Read'),
              ),
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: ()async {
                 int response = await sqlDb.updateData("UPDATE 'notes' SET 'note' = 'note four' WHERE ID = 4");
                print('$response');
              },
              child: const Text('update'),
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: ()async {
                int response = await sqlDb.deleteData("DELETE FROM 'notes' WHERE id = 3");
                print('$response');
              },
              child: Text('Delete'),
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () async {
                int response = await sqlDb.insertData(
                    "INSERT INTO 'notes' ('note') VALUES ('note two')");
                print('$response');
              },
              child: Text('insert'),
            ),
          ]),
    );
  }
}
