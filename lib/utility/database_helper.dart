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
              user: user,
              db: db,
              password: password),
      );
    } catch (e) {
       print('Connection failed');
      print(e);
    }

     return conn;

  }

  // Inserts a new user to Users table with the given parameters.
  Future<Results> insertUser(MySqlConnection conn, String name, String username, String phoneNumber, String email, String password) async {

     Results result;

     result = await conn.query(
         'insert into users (name, username, phoneNumber, email, password) values (?, ?, ?, ?, ?)',
         [name, username, phoneNumber, email, password]);
     print('Inserted row id=${result.insertId}');

    return result;
  }

  // Shows all users after inserting new data.
  Future<dynamic> showUsers(MySqlConnection conn, Results result) async {

    var results = await conn.query(
        'select name, email from users where id = ?', [result.insertId]);
    for (var row in results) {
      print('name: ${row[0]}, email: ${row[1]}');
      return row[0];
    }

    await removeConnection(conn);
  }

  // Shows all columns of data for the user with the given username
   Future<dynamic> findUsersByUsername(MySqlConnection conn, String username) async {
     var results = await conn.query(
         'select * from users where username = ?', [username]);
     for (var row in results) {
       print('id: ${row[0]}, name: ${row[1]}, username: ${row[2]}, phoneNumber: ${row[3]}, email: ${row[4]}, password: ${row[5]}, profile_picture_url: ${row[6]}, last_update: ${row[7]}');
       return row[0];
     }

     await removeConnection(conn);
   }

   // Updates user email
  Future<void> updateUserEmail(String newEmail, oldEmail) async {
    MySqlConnection? conn = await createConnection();

    if (conn != null) {
      await conn.query('update users set email=? where email=?', [newEmail, oldEmail]);
    }

    await removeConnection(conn);
   }

   // Updates user password
  Future<void> updateUserPassword(String newPassword, oldPassword) async {

    MySqlConnection? conn = await createConnection();

    if (conn != null) {
      await conn.query('update users set password=? where password=?', [newPassword, oldPassword]);
    }

    await removeConnection(conn);
   }

   // Deletes the user with the given password.
   Future<void> deleteUser(String password) async {

     MySqlConnection? conn = await createConnection();

     if (conn != null) {
       await conn.query('delete from users where password=?', [password]);
     }

     await removeConnection(conn);

   }

   // Closes the connection.
   Future<void> removeConnection(MySqlConnection? conn) async {
     // Close the connection

     if (conn != null) {
       await conn.close();
     }

   }

}