// ignore_for_file: avoid_print

String tempoAgora() {
  DateTime tempo = DateTime.now();
  return "${tempo.hour}:${tempo.minute}:${tempo.second}:${tempo.microsecond}";
}

void main(List<String> args) {
  print('Classe DateTime');
  print('Copilando as ${tempoAgora()}');

  var p1 = Pessoa('Eliel', 13, 3, 1987, horas: 10, minutos: 20);
  print(p1);
}

class Pessoa {
  String nome;
  late DateTime _data;
  late DateTime _nascimento;
  final _agora = DateTime.now();

  Pessoa(this.nome, int diaNascimento, int mesNascimento, int anoNascimento, {int horas = 0, int minutos = 0}) {
    _nascimento = DateTime.utc(anoNascimento, mesNascimento, diaNascimento, horas, minutos);
    print('$nome nascido em $diaNascimento/$mesNascimento/$anoNascimento ${diaSemana(_nascimento.weekday)} as $horas:$minutos ano ${bisexto(anoNascimento)}');

    fecundacao();
    tempo();
  }

  fecundacao() {
    int gestacaoMedia = 268;
    _data = _nascimento.subtract(Duration(days: gestacaoMedia));

    print('Data estimada da fecundação: ${_data.day}/${_data.month}/${_data.year}');
  }

  tempo() {
    print('Tem ${idade().toStringAsFixed(0)} anos e está vivo a: '
        '\n${_agora.difference(_nascimento).inDays} dias...'
        '\n${_agora.difference(_nascimento).inHours} dias...'
        '\n${_agora.difference(_nascimento).inMinutes} dias...'
        '\n${_agora.difference(_nascimento).inSeconds} dias...');
  }

  String bisexto(int ano) => (ano % 4 == 0 || ano % 400 == 0 && ano % 100 != 0) ? 'é bisexto' : 'não é bisexto';

  double idade() => _agora.difference(_nascimento).inDays / 360;

  String diaSemana(int dia) {
    switch (dia) {
      case 1:
        return 'segunda-feira';

      case 2:
        return 'terça-feira';

      case 3:
        return 'quarta-feira';

      case 7:
        return 'domingo';

      case 4:
        return 'quinta-feira';

      case 5:
        return 'sexta-feira';

      case 6:
        return 'sábado-feira';

      default:
        return 'erro';
    }
  }
}
