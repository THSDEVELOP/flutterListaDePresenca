import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'model/dados_cadastrais_model.dart';
import 'presenca_ccb.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  runApp(const PresencaCCB());
}
