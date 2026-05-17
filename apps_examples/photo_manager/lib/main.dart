import 'package:flutter/material.dart';

// Modelo de dados para a foto
class Foto {
  int id;
  String descricao;
  String imagem; // URL da imagem

  Foto({required this.id, required this.descricao, required this.imagem});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Fotos',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const PhotoListScreen(),
    );
  }
}

// Tela de Listagem de Fotos
class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  // Lista de fotos em memória
  final List<Foto> _fotos = [
    Foto(
      id: 1,
      descricao: 'Paisagem montanhosa',
      imagem: 'https://picsum.photos/id/1/200/200',
    ),
    Foto(
      id: 2,
      descricao: 'Cachorro brincando',
      imagem: 'https://picsum.photos/id/2/200/200',
    ),
  ];
  int _proximoId = 3; // Para gerar IDs únicos

  // Função para abrir diálogo com descrição e opção de exclusão
  Future<void> _showPhotoDialog(BuildContext context, Foto foto) async {
    final bool? confirmDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Detalhes da Foto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              foto.imagem,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text('Descrição: ${foto.descricao}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );

    if (confirmDelete == true) {
      setState(() {
        _fotos.removeWhere((f) => f.id == foto.id);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Foto "${foto.descricao}" excluída')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Fotos')),
      body: _fotos.isEmpty
          ? const Center(child: Text('Nenhuma foto cadastrada'))
          : ListView.builder(
              itemCount: _fotos.length,
              itemBuilder: (context, index) {
                final foto = _fotos[index];
                return ListTile(
                  leading: Image.network(
                    foto.imagem,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                  title: Text('Foto ID: ${foto.id}'),
                  subtitle: Text(foto.descricao),
                  onTap: () => _showPhotoDialog(context, foto),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navega para a tela de cadastro e aguarda nova foto
          final novaFoto = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PhotoCreateScreen(proximoId: _proximoId),
            ),
          );
          if (novaFoto != null) {
            setState(() {
              _fotos.add(novaFoto);
              _proximoId++;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Tela de Cadastro de Fotos
class PhotoCreateScreen extends StatefulWidget {
  final int proximoId;

  const PhotoCreateScreen({super.key, required this.proximoId});

  @override
  _PhotoCreateScreenState createState() => _PhotoCreateScreenState();
}

class _PhotoCreateScreenState extends State<PhotoCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();

  @override
  void dispose() {
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Gera URL fictícia baseada no próximo ID
    final imageUrl = 'https://picsum.photos/id/${widget.proximoId}/200/200';

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Foto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Pré-visualização da imagem
              Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
              const SizedBox(height: 20),
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
                    // Cria uma nova foto
                    final foto = Foto(
                      id: widget.proximoId,
                      descricao: _descricaoController.text,
                      imagem: imageUrl,
                    );
                    Navigator.pop(context, foto);
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
