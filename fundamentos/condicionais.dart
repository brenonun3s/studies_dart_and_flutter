void main() {
  int idade = 16;

  if (idade >= 18) {
    print('Maior de idade');
  } else {
    print('Menor de idade');
  }

  double nota = 7.5;
  if (nota >= 9) {
    print('Excelente');
  } else if (nota >= 7) {
    print('Bom');
  } else if (nota >= 5) {
    print('Regular');
  } else {
    print('Precisa melhorar');
  }

  String dia = 'segunda';
  switch (dia) {
    case 'segunda':
    case 'terça':
    case 'quarta':
    case 'quinta':
    case 'sexta':
      print('Dia útil');
      break;
    case 'sábado':
    case 'domingo':
      print('Final de semana');
      break;
    default:
      print('Dia inválido');
  }
}
