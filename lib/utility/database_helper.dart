import 'package:mysql1/mysql1.dart';
import 'secrets.dart';

class DatabaseHelper {

    // Open a connection
   Future<MySqlConnection?> createConnection() async {

     MySqlConnection? conn;
     try {
      conn = await MySqlConnection.connect(ConnectionSettings(
              host: host,
              port: 3306,
              user: 'root',
              db: 'chat',
              password: password),
      );
    } catch (e) {
       print('Connection failed');
      print(e);
    }

     print('Connection successful');

     return conn;

  }

  Future insertUser(String name, String username, String phoneNumber, String email, String password) async {

     MySqlConnection? conn = await createConnection();
     var result;

     if (conn != null) {
       // Create a table
       result = await conn.query(
           'insert into users (name, username, phoneNumber, email, password) values (?, ?, ?, ?, ?)',
           [name, username, phoneNumber, email, password]);
       print('Inserted row id=${result.insertId}');
     }

     await removeConnection(conn);


    return result;
  }

  Future<dynamic> showUsers(result) async {

    MySqlConnection? conn = await createConnection();

    if (conn != null) {
      // Query the database using a parameterized query
      var results = await conn.query(
          'select email from users where id = ?', [result.insertId]);
      for (var row in results) {
        // print('Name: ${row[0]}, email: ${row[1]}');
        return row[0];
      }
    }

    await removeConnection(conn);
  }

  Future<void> updateUserEmail(String newEmail, oldEmail) async {
    MySqlConnection? conn = await createConnection();

    if (conn != null) {
      await conn.query('update users set email=? where email=?', [newEmail, oldEmail]);
    }

    await removeConnection(conn);
   }

  Future<void> updateUserPassword(String newPassword, oldPassword) async {

    MySqlConnection? conn = await createConnection();

    if (conn != null) {
      await conn.query('update users set password=? where password=?', [newPassword, oldPassword]);
    }

    await removeConnection(conn);   }

   Future<void> deleteUser(String password) async {

     MySqlConnection? conn = await createConnection();

     if (conn != null) {
       await conn.query('delete from users where password=?', [password]);
     }

     await removeConnection(conn);

   }

   Future<void> removeConnection(MySqlConnection? conn) async {
     // Close the connection

     if (conn != null) {
       await conn.close();
     }

   }

}