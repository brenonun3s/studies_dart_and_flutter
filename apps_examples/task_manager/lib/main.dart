import 'package:flutter/material.dart';

// Modelo de dados para a tarefa
class Tarefa {
  int id;
  String descricao;
  bool concluida;

  Tarefa({required this.id, required this.descricao, this.concluida = false});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Tarefas',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const TaskListScreen(),
    );
  }
}

// Tela de Listagem de Tarefas
class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // Lista de tarefas em memória
  final List<Tarefa> _tarefas = [
    Tarefa(id: 1, descricao: 'Comprar mantimentos', concluida: false),
    Tarefa(id: 2, descricao: 'Estudar Flutter', concluida: true),
  ];
  int _proximoId = 3; // Para gerar IDs únicos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),
      body: _tarefas.isEmpty
          ? const Center(child: Text('Nenhuma tarefa cadastrada'))
          : ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                final tarefa = _tarefas[index];
                return ListTile(
                  leading: Icon(
                    tarefa.concluida
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: tarefa.concluida ? Colors.green : Colors.grey,
                  ),
                  title: Text(
                    tarefa.descricao,
                    style: TextStyle(
                      decoration: tarefa.concluida
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text('ID: ${tarefa.id}'),
                  onTap: () async {
                    // Navega para a tela de edição e aguarda resultado
                    final tarefaEditada = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskEditScreen(tarefa: tarefa),
                      ),
                    );
                    if (tarefaEditada != null) {
                      setState(() {
                        // Atualiza a tarefa editada
                        _tarefas[index] = tarefaEditada;
                      });
                    } else if (tarefaEditada == null &&
                        !_tarefas.contains(tarefa)) {
                      setState(() {
                        // Remove a tarefa se foi excluída
                        _tarefas.removeAt(index);
                      });
                    }
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navega para a tela de cadastro e aguarda nova tarefa
          final novaTarefa = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TaskCreateScreen()),
          );
          if (novaTarefa != null) {
            setState(() {
              novaTarefa.id = _proximoId++;
              _tarefas.add(novaTarefa);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Tela de Cadastro de Tarefas
class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({super.key});

  @override
  _TaskCreateScreenState createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();

  @override
  void dispose() {
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Tarefa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Cria uma nova tarefa
                    final tarefa = Tarefa(
                      id: 0, // ID será atribuído na tela de listagem
                      descricao: _descricaoController.text,
                      concluida: false,
                    );
                    Navigator.pop(context, tarefa);
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tela de Edição de Tarefas
class TaskEditScreen extends StatefulWidget {
  final Tarefa tarefa;

  const TaskEditScreen({super.key, required this.tarefa});

  @override
  _TaskEditScreenState createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _descricaoController;
  late bool _concluida;

  @override
  void initState() {
    super.initState();
    // Inicializa com os dados da tarefa
    _descricaoController = TextEditingController(text: widget.tarefa.descricao);
    _concluida = widget.tarefa.concluida;
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Tarefa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text('Concluída'),
                value: _concluida,
                onChanged: (value) {
                  setState(() {
                    _concluida = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Atualiza a tarefa
                        final tarefaAtualizada = Tarefa(
                          id: widget.tarefa.id,
                          descricao: _descricaoController.text,
                          concluida: _concluida,
                        );
                        Navigator.pop(context, tarefaAtualizada);
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      // Exclui a tarefa (retorna null)
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Tarefa "${widget.tarefa.descricao}" excluída',
                          ),
                        ),
                      );
                      setState(() {
                        // Remove a tarefa da lista
                        final index =
                            (context
                                    .findAncestorStateOfType<
                                      _TaskListScreenState
                                    >())
                                ?._tarefas
                                .indexWhere((t) => t.id == widget.tarefa.id);
                        if (index != -1) {
                          (context
                                  .findAncestorStateOfType<
                                    _TaskListScreenState
                                  >())
                              ?._tarefas
                              .removeAt(index!);
                        }
                      });
                    },
                    child: const Text('Excluir'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
