import 'dart:io' as io;
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'entities/cart_entity.dart';
import 'models/cart_model.dart';

class DbRepo{
  static Database? _db;

  Future<Database?> get db async{
    if(_db!=null){
      return _db;
    }
    _db=await initDataBase();
  }
  initDataBase()async{
    io.Directory documentDirectory=await getApplicationDocumentsDirectory();
    String path=join(documentDirectory.path,'MyCart.db');
    var db=await openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }
  _onCreate(Database db,int version)async{
    await db.execute('create table cart(userId VARCHAR , productId VARCHAR PRIMARY KEY,title TEXT,initialPrice INTEGER, productPrice INTEGER , quantity INTEGER, picture TEXT )');
  }

  Future<Cart> insert(Cart cart)async{

    var dbclient=await db;
    await dbclient!.insert('cart', cart.toEntity().toDocument());
    return cart;
  }
  Future<List<Cart>> getCartList()async{
    var dbclient=await db;
      final results = await dbclient!.query('cart');
      return results.map((e) => Cart.fromEntity(CartEntity.fromDocument(e))).toList();
  }


  Future<int> update(Cart cart)async{
    var dbClient=await db;
    return await dbClient!.update(
        'cart',
        cart.toEntity().toDocument(),
        where : 'productId=?',
        whereArgs: [cart.productId]
    );
  }

  Future<int> delete(String id)async{
    var dbClient=await db;
    return await dbClient!.delete(
        'cart',
        where: 'productId=?',
        whereArgs: [id]

    );
  }
  Future<List<Cart>> refreshCart() async {
    var dbClient = await db;
    final results = await dbClient!.query('cart');
    return results.map((e) => Cart.fromEntity(CartEntity.fromDocument(e))).toList();
  }


}