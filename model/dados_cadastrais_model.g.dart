// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_cadastrais_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DadosCadastraisModelAdapter extends TypeAdapter<DadosCadastraisModel> {
  @override
  final int typeId = 0;

  @override
  DadosCadastraisModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DadosCadastraisModel()
      ..nome = fields[0] as String?
      ..dataCadastro = fields[1] as DateTime?
      ..comumCongregacao = fields[2] as String?
      ..uf = fields[3] as String?
      ..cidade = fields[4] as String?
      ..cargoMinisterio = fields[5] as String?
      ..instrumentos = (fields[6] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, DadosCadastraisModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.dataCadastro)
      ..writeByte(2)
      ..write(obj.comumCongregacao)
      ..writeByte(3)
      ..write(obj.uf)
      ..writeByte(4)
      ..write(obj.cidade)
      ..writeByte(5)
      ..write(obj.cargoMinisterio)
      ..writeByte(6)
      ..write(obj.instrumentos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DadosCadastraisModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
