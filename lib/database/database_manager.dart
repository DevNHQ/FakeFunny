

import 'package:fake_funny/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseManager {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'fake_funny.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
  late String name;
  late String avatarFile;
  late int followed;
  late int following;
  late int countPost;
  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE IF NOT EXISTS user ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT,"
        "idName TEXT,"
        "avatarFile BLOB,"
        "follower INTEGER,"
        "following INTEGER,"
        "totalLike INTEGER"
        ")");

  }
  Future<MUser> addUser(MUser user) async {
    var dbClient = await db;
    if(dbClient != null) {
      user.id = await dbClient.insert('user', user.toMap());
    }
    return user;
  }

  Future<List<MUser?>> getUser() async {
    Database? dbClient = await db;
    List<MUser?> user = <MUser>[];
    if(dbClient != null) {
      List<Map<String, dynamic>> maps = await dbClient.query('user', columns: [
        'id',
        'name',
        'idName',
        'avatarFile',
        'follower',
        'following',
        'totalLike'
      ]);
      if (maps.isNotEmpty) {
        user.addAll(maps.map((data) => MUser.fromMap(data)).toList());
      }
    }
    print(user);
    return user;
  }
  Future<int?> removeUser({id}) async {
    var dbClient = await db;
    return await dbClient?.delete('user', where: 'id = $id');
  }
  Future<int?> updateUser({required MUser user, required int id}) async {
    var dbClient = await db;
    return await dbClient?.update(
      'user',
      user.toMap(),
      where: 'id = $id',
    );
  }
  // Future<Car> addCar(Car car) async {
  //   var dbClient = await db;
  //   car.id = await dbClient.insert('car', car.toMap());
  //   return car;
  // }
  // Future<Car> addCarFavoriteByRecommend(Car car) async {
  //   var dbClient = await db;
  //   await dbClient.delete('carFavorite');
  //   car.id = await dbClient.insert('carFavorite', car.toMap());
  //   return car;
  // }
  // Future<Car> addCarToType(Car car,type) async {
  //   var dbClient = await db;
  //   switch(type){
  //     case 0:
  //       var prId = await dbClient.query('carPresent', columns: ['id', 'car_index','maker_id','name','makerName'],where: 'id = ${car.id}');
  //       if(prId.length < 1) {
  //         car.id = await dbClient.insert('carPresent', car.toMap());
  //       }
  //       break;
  //     case 1:
  //       var oldId = await dbClient.query('carOld', columns: ['id', 'car_index','maker_id','name','makerName'],where: 'id = ${car.id}');
  //       if(oldId.length < 1) {
  //         car.id = await dbClient.insert('carOld', car.toMap());
  //       }
  //       break;
  //     case 2:
  //       var frId = await dbClient.query('carFavorite', columns: ['id', 'car_index','maker_id','name','makerName'],where: 'id = ${car.id}');
  //       if(frId.length < 1) {
  //         car.id = await dbClient.insert('carFavorite', car.toMap());
  //       }
  //       break;
  //     case 3 :
  //       var frId = await dbClient.query('carSearch', columns: ['id', 'car_index','maker_id','name','makerName'],where: 'id = ${car.id}');
  //       if(frId.length < 1) {
  //         car.id = await dbClient.insert('carSearch', car.toMap());
  //       }
  //       break;
  //   }
  //   return car;
  // }
  // Future<List<Car>> getCarsbyType(type) async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query(type == 0 ?'carPresent': type == 1 ? 'carOld' : type == 2 ? 'carFavorite' : 'carSearch', columns: ['id', 'car_index','maker_id','name','makerName']);
  //   List<Car> cars = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       cars.add(Car.fromMap(maps[i]));
  //     }
  //   }
  //   return cars;
  // }
  // Future<List<Car>> getCars(int makerId) async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query('car', columns: ['id', 'car_index','maker_id','name','makerName'],where: 'maker_id = $makerId');
  //   List<Car> cars = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       cars.add(Car.fromMap(maps[i]));
  //     }
  //   }
  //   return cars;
  // }
  // Future<List<Car>> getAllCar() async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query('car', columns: ['id', 'car_index','maker_id','name','makerName']);
  //   List<Car> cars = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       cars.add(Car.fromMap(maps[i]));
  //     }
  //   }
  //   return cars;
  // }
  // Future<List<Car>> getMaker() async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.query('maker', columns: ['id','name']);
  //   List<Car> maker = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       maker.add(Car.fromMap(maps[i]));
  //     }
  //   }
  //   return maker;
  // }
  // Future<int> deleteCarSearch(int id) async {
  //   var dbClient = await db;
  //   return await dbClient.delete(
  //     'carSearch',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
  // Future<int> delete(int id) async {
  //   var dbClient = await db;
  //   return await dbClient.delete(
  //     'car',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
  // Future<int> deleteCarByType(int id,type) async {
  //   var dbClient = await db;
  //   return await dbClient.delete(
  //     type == 0 ?'carPresent': type == 1 ? 'carOld' : 'carFavorite',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
  // Future<int> deleteAllMaker() async {
  //   var dbClient = await db;
  //   return await dbClient.delete('maker');
  // }
  // Future<int> deleteAllCar() async {
  //   var dbClient = await db;
  //   return await dbClient.delete('car');
  // }
  // Future<int> deleteAllCarRecommend() async {
  //   var dbClient = await db;
  //   return await dbClient.delete('carFavorite');
  // }
  // Future<int> deleteAllCarFavorite() async {
  //   var dbClient = await db;
  //   return await dbClient.delete('carFavorite');
  // }
  // Future<int> update(Car car) async {
  //   var dbClient = await db;
  //   return await dbClient.update(
  //     'car',
  //     car.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [car.id],
  //   );
  // }

  Future close() async {
    var dbClient = await db;
    dbClient?.close();
  }
}