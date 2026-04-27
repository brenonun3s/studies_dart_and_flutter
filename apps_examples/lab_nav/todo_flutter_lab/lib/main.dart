import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaListaTarefas(),
    );
  }
}

// ================== MODEL ==================
class Tarefa {
  final String id;
  String titulo;
  String descricao;
  String status;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.status,
  });
}

// ================== TELA LISTA ==================
class TelaListaTarefas extends StatefulWidget {
  @override
  _TelaListaTarefasState createState() => _TelaListaTarefasState();
}

class _TelaListaTarefasState extends State<TelaListaTarefas> {
  List<Tarefa> _tarefas = [];

  @override
  void initState() {
    super.initState();

    _tarefas.addAll([
      Tarefa(
        id: '1',
        titulo: 'Comprar leite',
        descricao: 'Leite desnatado',
        status: 'concluida',
      ),
      Tarefa(
        id: '2',
        titulo: 'Estudar Flutter',
        descricao: 'Navegação e rotas',
        status: 'andamento',
      ),
      Tarefa(
        id: '3',
        titulo: 'Treinar',
        descricao: 'Treino A',
        status: 'pendente',
      ),
    ]);
  }

  void _editarTarefa(BuildContext context, Tarefa tarefa, int index) async {
    final tarefaEditada = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaFormulario(tarefa: tarefa, index: index),
      ),
    );

    if (tarefaEditada != null) {
      setState(() {
        _tarefas[index] = tarefaEditada;
      });
    }
  }

  Icon _iconePorStatus(String status) {
    if (status == 'concluida') {
      return Icon(Icons.check_circle, color: Colors.green);
    } else if (status == 'andamento') {
      return Icon(Icons.autorenew, color: Colors.orange);
    } else {
      return Icon(Icons.hourglass_empty, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas')),
      body: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (context, index) {
          final tarefa = _tarefas[index];

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              leading: _iconePorStatus(tarefa.status),
              title: Text(tarefa.titulo),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => _editarTarefa(context, tarefa, index),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TelaDetalhes(tarefa: tarefa),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final novaTarefa = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => TelaFormulario()),
          );

          if (novaTarefa != null) {
            setState(() {
              _tarefas.add(novaTarefa);
            });
          }
        },
      ),
    );
  }
}

// ================== FORMULÁRIO ==================
class TelaFormulario extends StatefulWidget {
  final Tarefa? tarefa;
  final int? index;

  TelaFormulario({this.tarefa, this.index});

  @override
  _TelaFormularioState createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  String _statusSelecionado = 'pendente';

  @override
  void initState() {
    super.initState();

    if (widget.tarefa != null) {
      _tituloController.text = widget.tarefa!.titulo;
      _descricaoController.text = widget.tarefa!.descricao;
      _statusSelecionado = widget.tarefa!.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tarefa == null ? 'Nova Tarefa' : 'Editar Tarefa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descricaoController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            Text(
              'Status:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('Pendente'),
                    leading: Radio(
                      value: 'pendente',
                      groupValue: _statusSelecionado,
                      onChanged: (v) => setState(() => _statusSelecionado = v!),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Andamento'),
                    leading: Radio(
                      value: 'andamento',
                      groupValue: _statusSelecionado,
                      onChanged: (v) => setState(() => _statusSelecionado = v!),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Concluída'),
                    leading: Radio(
                      value: 'concluida',
                      groupValue: _statusSelecionado,
                      onChanged: (v) => setState(() => _statusSelecionado = v!),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    if (_tituloController.text.isNotEmpty) {
                      final novaTarefa = Tarefa(
                        id: widget.tarefa?.id ?? DateTime.now().toString(),
                        titulo: _tituloController.text,
                        descricao: _descricaoController.text,
                        status: _statusSelecionado,
                      );

                      Navigator.pop(context, novaTarefa);
                    }
                  },
                ),
                ElevatedButton(
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.pop(context, null),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ================== DETALHES ==================
class TelaDetalhes extends StatelessWidget {
  final Tarefa tarefa;

  TelaDetalhes({required this.tarefa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tarefa.titulo)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.title),
              title: Text('Título'),
              subtitle: Text(tarefa.titulo),
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Descrição'),
              subtitle: Text(tarefa.descricao),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Status'),
              subtitle: Text(tarefa.status),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                child: Text('VOLTAR'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
