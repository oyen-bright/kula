import 'package:hive_flutter/hive_flutter.dart';
import 'package:kula/utils/types.dart';

class TokenAdapter extends TypeAdapter<Token> {
  @override
  final typeId = 2; // Unique identifier for this type adapter

  @override
  Token read(BinaryReader reader) {
    // Implement how to read a Token object from binary
    // Here, you'll need to read the map from the binary and return a Token object
    return (
      access: reader.readString(),
      refresh: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Token token) {
    writer.writeString(token.access);
    writer.writeString(token.refresh);
  }
}
