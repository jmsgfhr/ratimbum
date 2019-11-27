import 'dart:async';

import 'package:path/path.dart';
import 'package:ratimbum2/model/place.dart';
import 'package:sqflite/sqflite.dart';

class db{
  var database;

  db();

static Future<Database> newDb() async {
  return openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE places(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, local TEXT, observations TEXT, phone TEXT, imagepath TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
}

  Future<void> insertPlace(Place place) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'places',
      place.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("inseri :)");
  }

  Future<List<Place>> places() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('places');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Place(maps[i]['id'], maps[i]['name'], maps[i]['local'], maps[i]['observations'], maps[i]['imagepath'], maps[i]['phone']);
    });
  }

  Future<void> updatePlace(Place place) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'dogs',
      place.toJson(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [place.id],
    );
  }

  Future<void> deletePlace(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'places',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
