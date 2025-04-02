import 'package:flutter/material.dart';
import 'login.dart';
import 'package:inicio_registro/paginas/mapa.dart';

class HomeScreen extends StatelessWidget {
  final String name;

  const HomeScreen({Key? key, required this.name}) : super(key: key);

  // Función para cerrar sesión y volver a la pantalla de login
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Hola, $name!',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ir a la pantalla de gestión de tareas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskManagerScreen()),
                );
              },
              child: const Text('Ir a la Gestión de Tareas'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Cerrar Sesión'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ir al mapa
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoogleMapScreen()), // Llama a la pantalla del mapa
                );
              },
              child: const Text('Ver Mapa'),
            ),
          ],
        ),
      ),
    );
  }
}

// El código de TaskManagerScreen que ya tenías
class TaskManagerScreen extends StatefulWidget {
  @override
  _TaskManagerScreenState createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  final List<Map<String, dynamic>> tasks = [];
  final TextEditingController taskController = TextEditingController();

  void _addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add({'task': taskController.text, 'completed': false});
      });
      taskController.clear();
    }
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Administrador de Tareas'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                  labelText: 'Nueva Tarea',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent, // Reemplazamos 'primary' por 'backgroundColor'
                foregroundColor: Colors.white, // Reemplazamos 'onPrimary' por 'foregroundColor'
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Agregar Tarea'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        tasks[index]['task'],
                        style: TextStyle(
                          fontSize: 18,
                          decoration: tasks[index]['completed']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: tasks[index]['completed']
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          tasks[index]['completed'] ? Icons.undo : Icons.check,
                          color: tasks[index]['completed']
                              ? Colors.blue
                              : Colors.green,
                        ),
                        onPressed: () => _toggleTaskCompletion(index),
                      ),
                      onLongPress: () => _deleteTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
