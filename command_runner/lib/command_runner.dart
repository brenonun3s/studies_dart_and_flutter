library;

export 'src/arguments.dart';
export 'src/command_runner_base.dart';
export 'src/help_command.dart';

class CommandRunner {
  Future<void> run(List<String> input) async {
    print('CommandRunner received arguments: $input');
  }
}
