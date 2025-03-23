import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'login_database.db');
    return await openDatabase(
      path,
      version: 2, // Actualizamos la versión
      onCreate: (db, version) async {
        // Crear tabla de usuarios
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT, email TEXT)',
        );

        // Insertar usuario admin por defecto
        await db.insert('users', {
          'username': 'admin',
          'password': '13dpb0490e', // Contraseña de administrador
          'email': 'admin@gmail.com',
        });

        // Crear tabla de preguntas del juego
        await db.execute(
          'CREATE TABLE questions(id INTEGER PRIMARY KEY AUTOINCREMENT, question TEXT, option1 TEXT, option2 TEXT, option3 TEXT, correctAnswer TEXT)',
        );

        // Insertar algunas preguntas de ejemplo
        await db.insert('questions', {
          'question': '¿A qué anime pertenece el rey de un solo ojo?',
          'option1': 'Tokyo Ghoul',
          'option2': 'My Hero Academia',
          'option3': 'Pokemon',
          'correctAnswer': 'Tokyo Ghoul',
        });
        await db.insert('questions', {
          'question': '¿Quién es el protagonista de Naruto?',
          'option1': 'Sasuke Uchiha',
          'option2': 'Naruto Uzumaki',
          'option3': 'Kakashi Hatake',
          'correctAnswer': 'Naruto Uzumaki',
        });
                await db.insert('questions', {
          'question': '¿Quién es el protagonista de "One Piece"?',
          'option1': 'Naruto Uzumaki',
          'option2': 'Monkey D. Luffy',
          'option3': 'Edward Elric',
          'correctAnswer': 'Monkey D. Luffy',
        });
        await db.insert('questions', {
          'question': '¿En qué anime aparece el personaje "Goku"?',
          'option1': 'Dragon Ball Z',
          'option2': 'Naruto',
          'option3': 'Bleach',
          'correctAnswer': 'Dragon Ball Z',
        });
        await db.insert('questions', {
          'question': '¿Quién es el creador de "Attack on Titan"?',
          'option1': 'Tite Kubo',
          'option2': 'Hajime Isayama',
          'option3': 'Yoshihiro Togashi',
          'correctAnswer': 'Hajime Isayama',
        });
        await db.insert('questions', {
          'question': '¿En qué anime aparece el personaje "Luffy"?',
          'option1': 'Naruto',
          'option2': 'One Piece',
          'option3': 'Fairy Tail',
          'correctAnswer': 'One Piece',
        });
        await db.insert('questions', {
          'question': '¿Qué habilidad tiene "Naruto" que lo hace único?',
          'option1': 'Sharingan',
          'option2': 'Rinnegan',
          'option3': 'Kurama (El Zorro de Nueve Colas)',
          'correctAnswer': 'Kurama (El Zorro de Nueve Colas)',
        });
        await db.insert('questions', {
          'question': '¿Cómo se llama el capitán de los "Shinigamis" en "Bleach"?',
          'option1': 'Ichigo Kurosaki',
          'option2': 'Rukia Kuchiki',
          'option3': 'Genryūsai Shigekuni Yamamoto',
          'correctAnswer': 'Genryūsai Shigekuni Yamamoto',
        });
        await db.insert('questions', {
          'question': '¿En qué anime aparece "Edward Elric"?',
          'option1': 'Fullmetal Alchemist',
          'option2': 'Naruto',
          'option3': 'One Piece',
          'correctAnswer': 'Fullmetal Alchemist',
        });
        await db.insert('questions', {
          'question': '¿En qué anime aparece "Saitama"?',
          'option1': 'One Punch Man',
          'option2': 'Naruto',
          'option3': 'Attack on Titan',
          'correctAnswer': 'One Punch Man',
        });
        await db.insert('questions', {
          'question': '¿En qué anime aparece "Zoro"?',
          'option1': 'Bleach',
          'option2': 'One Piece',
          'option3': 'Hunter x Hunter',
          'correctAnswer': 'One Piece',
        });
        await db.insert('questions', {
          'question': '¿Quién es el creador de "Naruto"?',
          'option1': 'Masashi Kishimoto',
          'option2': 'Tite Kubo',
          'option3': 'Eiichiro Oda',
          'correctAnswer': 'Masashi Kishimoto',
        });
        await db.insert('questions', {
          'question': '¿Qué clase de criatura es "Kakashi Hatake"?',
          'option1': 'Shinigami',
          'option2': 'Humano',
          'option3': 'Jinchuriki',
          'correctAnswer': 'Humano',
        });
        await db.insert('questions', {
          'question': '¿Cuál es el poder principal de "Ichigo Kurosaki" en "Bleach"?',
          'option1': 'Fullbring',
          'option2': 'Bankai',
          'option3': 'Rinnegan',
          'correctAnswer': 'Bankai',
        });
        await db.insert('questions', {
          'question': '¿Cómo se llama la nave de "Naruto"?',
          'option1': 'Konoha',
          'option2': 'Kurama',
          'option3': 'Tailed Beast',
          'correctAnswer': 'Kurama',
        });
        await db.insert('questions', {
          'question': '¿Qué es el "Akatsuki" en "Naruto"?',
          'option1': 'Una organización de ninjas',
          'option2': 'Un clan de samuráis',
          'option3': 'Un grupo de científicos',
          'correctAnswer': 'Una organización de ninjas',
        });
        await db.insert('questions', {
          'question': '¿Cuál es el objetivo principal del "Akatsuki"?',
          'option1': 'Destruir la aldea de Konoha',
          'option2': 'Capturar a los bijuus',
          'option3': 'Matar a Naruto',
          'correctAnswer': 'Capturar a los bijuus',
        });
        await db.insert('questions', {
          'question': '¿Qué anime es famoso por su "Titan"?',
          'option1': 'Attack on Titan',
          'option2': 'Fullmetal Alchemist',
          'option3': 'My Hero Academia',
          'correctAnswer': 'Attack on Titan',
        });
        await db.insert('questions', {
          'question': '¿Cómo se llama el personaje principal en "My Hero Academia"?',
          'option1': 'Izuku Midoriya',
          'option2': 'Katsuki Bakugo',
          'option3': 'All Might',
          'correctAnswer': 'Izuku Midoriya',
        });
        await db.insert('questions', {
          'question': '¿En qué anime aparece "Sasuke Uchiha"?',
          'option1': 'Attack on Titan',
          'option2': 'Naruto',
          'option3': 'One Punch Man',
          'correctAnswer': 'Naruto',
        });
        await db.insert('questions', {
          'question': '¿Cuál es la relación entre "Sasuke" y "Naruto"?',
          'option1': 'Son hermanos',
          'option2': 'Son amigos',
          'option3': 'Son rivales',
          'correctAnswer': 'Son rivales',
        });
        await db.insert('questions', {
          'question': '¿En qué anime aparece "Yusuke Urameshi"?',
          'option1': 'Bleach',
          'option2': 'Yu Yu Hakusho',
          'option3': 'Naruto',
          'correctAnswer': 'Yu Yu Hakusho',
        });
        await db.insert('questions', {
          'question': '¿Cuál es el poder principal de "Luffy" en "One Piece"?',
          'option1': 'Gomu Gomu no Mi',
          'option2': 'Haki',
          'option3': 'Rinnegan',
          'correctAnswer': 'Gomu Gomu no Mi',
        });
        await db.insert('questions', {
          'question': '¿Quién es el creador de "One Piece"?',
          'option1': 'Eiichiro Oda',
          'option2': 'Tite Kubo',
          'option3': 'Masashi Kishimoto',
          'correctAnswer': 'Eiichiro Oda',
        });
        await db.insert('questions', {
          'question': '¿Qué tipo de manga es "Naruto"?',
          'option1': 'Shonen',
          'option2': 'Seinen',
          'option3': 'Shojo',
          'correctAnswer': 'Shonen',
        });
        await db.insert('questions', {
          'question': '¿Qué habilidad tiene "Naruto" que lo hace único?',
          'option1': 'Sharingan',
          'option2': 'Rinnegan',
          'option3': 'Kurama (El Zorro de Nueve Colas)',
          'correctAnswer': 'Kurama (El Zorro de Nueve Colas)',
        });
        await db.insert('questions', {
          'question': '¿En qué anime aparece "Shoto Todoroki"?',
          'option1': 'Tokyo Ghoul',
          'option2': 'My Hero Academia',
          'option3': 'One Punch Man',
          'correctAnswer': 'My Hero Academia',
        });
        await db.insert('questions', {
          'question': '¿Quién es el creador de "Death Note"?',
          'option1': 'Tsugumi Ohba',
          'option2': 'Tite Kubo',
          'option3': 'Masashi Kishimoto',
          'correctAnswer': 'Tsugumi Ohba',
        });
        await db.insert('questions', {
          'question': '¿Cómo se llama el Dios de la Muerte en "Death Note"?',
          'option1': 'Ryuk',
          'option2': 'Shinigami',
          'option3': 'L',
          'correctAnswer': 'Ryuk',
        });
        await db.insert('questions', {
          'question': '¿Quién es el enemigo principal en "Dragon Ball Z"?',
          'option1': 'Frieza',
          'option2': 'Cell',
          'option3': 'Majin Buu',
          'correctAnswer': 'Frieza',
        });
        await db.insert('questions', {
          'question': '¿En qué anime aparece "Kagome Higurashi"?',
          'option1': 'Inuyasha',
          'option2': 'Naruto',
          'option3': 'Bleach',
          'correctAnswer': 'Inuyasha',
        });
        await db.insert('questions', {
          'question': '¿Qué tipo de criatura es "Naruto" al principio de la serie?',
          'option1': 'Humano',
          'option2': 'Jinchuriki',
          'option3': 'Demonio',
          'correctAnswer': 'Jinchuriki',
        });

      },
    );
  }

  // Funciones de gestión de usuarios
  Future<int> insertUser(String username, String password, String email) async {
    final db = await database;
    return await db.insert('users', {
      'username': username,
      'password': password,
      'email': email,
    });
  }

  Future<Map<String, dynamic>?> getUser(String username, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return users.isNotEmpty ? users.first : null;
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await database;
    return await db.query('users');
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> userExists(String username) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    return result.isNotEmpty;
  }

  Future<bool> emailExists(String email) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> getAllQuestions() async {
    final db = await database;
    return await db.query('questions');
  }
}
