import 'package:flutter_base_project/di/modules/api_module.dart';
import 'package:flutter_base_project/di/modules/data_module.dart';
import 'package:flutter_base_project/di/modules/repository_module.dart';
import 'package:get_it/get_it.dart';

/// Classe para componentização do sistema de injeção de dependências do app
///
/// Aqui, estou usando o GetIt, mas se necessário é fácil trocar esta implementação por
/// qualquer outra biblioteca como: provider, getX ou até um sistema próprio de injeção de dependência.
///
/// Neste caso, preferi por utilizar uma biblioteca pronta, porque ela tem algumas otimizações e ganhos
/// de performance em tempo de execução que são praticamente inviáveis de serem implementados manualmente.
abstract class Injector {
  // 'T extends Object' impede que o usuário coloque algo nulo ou dinâmico
  T get<T extends Object>();

  void replace<T extends Object>(T instance);
}

class _GetItImpl implements Injector {
  final getIt = GetIt.instance;

  _GetItImpl() {
    _register();
  }

  Future<void> _register() async {
    ApiModule.setup(getIt);
    RepositoriesModule.setup(getIt);
    await DataModule.setup(getIt);
  }

  @override
  T get<T extends Object>() {
    return GetIt.I.get<T>();
  }

  @override
  void replace<T extends Object>(T instance) {
    GetIt.I.unregister<T>();
    GetIt.I.registerSingleton<T>(instance);
  }
}

final Injector injector = _GetItImpl();
