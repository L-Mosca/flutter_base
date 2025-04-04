import 'package:flutter_base_project/localization/strings/app_localization.dart';

class PtBr implements AppLocalization {
  @override String get appName => "Fake Store";

  // Login Page
  @override String get loginFailure => "Credenciais inválidas";
  @override String get username => "Usuário";
  @override String get password => "Senha";
  @override String get login => "Entrar";
  @override String get or => "ou";
  @override String get dontHaveAccount => "Não tem uma conta?";
  @override String get clickHere => "Clique aqui";
  @override String get welcome => "Bem-vindo(a) ao";
  @override String get signInToContinue => "Entre para continuar";
  @override String get invalidUsername => "Usuário inválido";
  @override String get invalidPassword => "Senha inválida";

  // Product Detail Page
  @override String get addToCart => "Adicionar ao Carrinho";
}