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
  @override String get somethingWrong => "Algo deu errado";
  @override String get productDetailError => "Ocorreu um erro ao buscar as informações sobre o produto, por favor tente novamente mais tarde.";
  @override String get tryAgain => "Tentar novamente";

  // Settings Page
  @override String get settings => "Configurações";
  @override String get darkMode => "Dark mode";
  @override String get logout => "Sair";

  // Cart Page
  @override String get cart => "Carrinho";
  @override String get checkOut => "Finalizar Pedido";
  @override String get items => "Itens";
  @override String get tax => "Impostos";
  @override String get totalPrice => "Preço Total";

  // Home Cart Container
  @override String get seeCart => "Ver Carrinho";
}