  import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVES_DADOS_CADASTRAIS_DATA_PRESENCA,
  CHAVES_DADOS_CADASTRAIS_PRESENCA,
  CHAVES_DADOS_CADASTRAIS_COMUM_CONGREGACAO,
  CHAVES_DADOS_CADASTRAIS_UF,
  CHAVES_DADOS_CADASTRAIS_CIDADE,
  CHAVES_DADOS_CADASTRAIS_CARGO_MINISTERIO,
  CHAVES_DADOS_CADASTRAIS_INSTRUMENTO,
  CHAVE_NOME_USUARIO,
  CHAVE_ALTURA,
  CHAVE_RECEBER_NOTIFICACOES,
  CHAVE_MODO_ESCURO,
  CHAVE_NGERADO,
  CHAVE_QTD_CLICKS
}

class AppStorageService {
  Future<void> setDadosCadastraisNome(String nome) async {
    await _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }
  //Fim dos Dados Cadastrais Nome

  // Começo dos Dados Cadastrais Data Presenca
  Future<void> setDadosCadastraisDataPresenca(String data) async {
    await _setString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_DATA_PRESENCA.toString(), data.toString());
  }

  Future<String> getDadosCadastraisDataPresenca() async {
    return _getString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_DATA_PRESENCA.toString());
  }
  //Fim dos Dados Cadastrais Data Presenca

  // Começo dos Dados Cadastrais Presenca
  Future<void> setDadosCadastraisPresenca(List<String> values) async {
    await _setStringList(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_PRESENCA.toString(), values);
  }

  Future<List<String>> getDadosCadastraisPresenca() async {
    return _getStringList(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_PRESENCA.toString());
  }

  //Fim dos Dados Cadastrais Presenca

  //Começo dos Dados Cadastrais Comum Congregacao
  Future<void> setDadosCadastraisComumCongregacao(String comum) async {
    await _setString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_COMUM_CONGREGACAO.toString(), comum.toString());
  }

  Future<String> getDadosCadastraisComumCongregacao() async {
    return _getString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_COMUM_CONGREGACAO.toString());
  }
  //Fim dos Dados Cadastrais Comum Congregacao

  //Começo dos Dados Cadastrais UF

  Future<void> setDadosCadastraisUF(String uf) async {
    await _setString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_UF.toString(), uf.toString());
  }

  Future<String> getDadosCadastraisUF() async {
    return _getString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_UF.toString());
  }
  //Fim dos Dados Cadastrais UF

  //Começo dos Dados Cadastrais CIDADE
  Future<void> setDadosCadastraisCidade(String cidade) async {
    await _setString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_CIDADE.toString(), cidade.toString());
  }

  Future<String> getDadosCadastraisCidade() async {
    return _getString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_CIDADE.toString());
  }
  //Fim dos Dados Cadastrais CIDADE

  //Começo dos Dados Cadastrais CARGO/MINISTÉRIO
  Future<void> setDadosCadastraisCargoMinisterio(String ministerio) async {
    await _setString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_CARGO_MINISTERIO.toString(), ministerio.toString());
  }

  Future<String> getDadosCadastraisCargoMinisterio() async {
    return _getString(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_CARGO_MINISTERIO.toString());
  }
  //Fim dos Dados Cadastrais CARGO/MINISTÉRIO

  //Começo dos Dados Cadastrais INSTRUMENTO
  Future<void> setDadosCadastraisInstrumento(List<String> values) async {
    await _setStringList(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_INSTRUMENTO.toString(), values);
  }

  Future<List<String>> getDadosCadastraisInstrumento() async {
    return _getStringList(STORAGE_CHAVES.CHAVES_DADOS_CADASTRAIS_INSTRUMENTO.toString());
  }
  //Fim dos Dados Cadastrais Instrumentos

  //Começo da pagina de configuração parte Nome do Usuario

  Future<void> setConfiguracoesNomeUsuario(String nomeUsuario) async {
    await _setString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString(), nomeUsuario.toString());
  }

  Future<String> getConfiguracoesNomeUsuario() async {
    return _getString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString());
  }
  //Fim da pagina de configuração parte Nome do Usuario

  //Começo da pagina de configuração parte Altura

  Future<void> setConfiguracoesAltura(double value) async {
    await _setDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString(), value);
  }

  Future<double> getConfiguracoesAltura() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString());
  }
  //Fim da pagina de configuração parte Altura

  //Começo da pagina de configuração parte Receber Notificações

  Future<void> setConfiguracoesReceberNotificacao(bool value) async {
    await _setBool(STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString(), value);
  }

  Future<bool> getConfiguracoesReceberNotificacao() async {
    return _getBool(STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString());
  }
  //Fim da pagina de configuração parte Receber Notificações

  //Começo da pagina de configuração parte Receber Notificações

  Future<void> setConfiguracoesModoEscuro(bool value) async {
    await _setBool(STORAGE_CHAVES.CHAVE_MODO_ESCURO.toString(), value);
  }

  Future<bool> getConfiguracoesModoEscuro() async {
    return _getBool(STORAGE_CHAVES.CHAVE_MODO_ESCURO.toString());
  }
  //Fim da pagina de configuração parte Receber Notificações

  //Começo da pagina de Gerador de Numeros Aleatorios NGERADO

  Future<void> setGeradorNgerado(int value) async {
    await _setInt(STORAGE_CHAVES.CHAVE_NGERADO.toString(), value);
  }

  Future<int> getGeradorNgerado() async {
    return _getInt(STORAGE_CHAVES.CHAVE_NGERADO.toString());
  }
  //Fim da pagina Gerador de Numeros Aleatorios NGERADO

  //Começo da pagina de Gerador de Numeros Aleatorios NGERADO

  Future<void> setGeradorQTDClciks(int value) async {
    await _setInt(STORAGE_CHAVES.CHAVE_QTD_CLICKS.toString(), value);
  }

  Future<int> getGeradorQTDClciks() async {
    return _getInt(STORAGE_CHAVES.CHAVE_QTD_CLICKS.toString());
  }
  //Fim da pagina Gerador de Numeros Aleatorios NGERADO

  //Começo dos Set/Get padrões
  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<void> _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  Future<void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  Future<void> _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  Future<void> _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
}
