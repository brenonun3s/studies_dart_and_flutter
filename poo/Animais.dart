import 'Animal.dart';
import 'Cachorro.dart';
import 'Gato.dart';

void main(List<String> args) {
  Gato gato = Gato('Thor', 7, 'preto');
  Cachorro cachorro = Cachorro('Negão', 5);

  cachorro.correndo();
  gato.arranha();

  cachorro.emitirSom();
  gato.emitirSom();

  List<Animal> animais = [gato, cachorro];

  for (Animal animal in animais) {
    animal.emitirSom();
  }
}
