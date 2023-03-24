import 'package:e_commerce/constance.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDatabase {
  CartDatabase._();
  static final CartDatabase db = CartDatabase._();

  static Database? _database;

  Future<Database?> get databas async {
    if (_database == null) {
      _database = await intial();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database?> intial() async {
    String path = await getDatabasesPath();
    String pathwithname = join(path, 'CartProduct.db');
    Database? mylocaldatabase = await openDatabase(pathwithname,
        onCreate: _oncreate, version: 1, onUpgrade: _onupdrade);
    return mylocaldatabase;
  }

  _oncreate(Database database, int vergan) async {
    await database.execute(''' 
     CREATE TABLE $tableCartProduct(
     $columnName TEXT NOT NULL,
     $columnimage TEXT NOT NULL,
     $columnQuantity INTERGER NOT NULL,
     $columnprice TEXT NOT NULL,
     $columnpoductid TEXT NOT NULL )
     ''');
  }

  _onupdrade(Database database, int oldvergin, int newvergin) {}

  insert(CartProductModel model) async {
    Database? database = await databas;
    int response = await database!.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return response;
  }

  Future<List<CartProductModel>> getAllProduct() async {
    Database? database = await databas;

    List<Map> maps = await database!.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];

    return list;
  }

  updateProduct(CartProductModel model) async {
    Database? database = await databas;
    return await database!.update(tableCartProduct, model.toJson(),
        where: '$columnpoductid =?', whereArgs: [model.productId]);
  }
}
