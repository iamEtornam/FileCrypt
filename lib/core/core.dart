import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';

class Core {
  static Uint8List encryptFile(Uint8List data, Uint8List key) {
    final cbcBlockCipher = CBCBlockCipher(AESFastEngine());
    final cfbBlockCipher = CFBBlockCipher(cbcBlockCipher, 128);

    final parameters = ParametersWithIV(KeyParameter(key), Uint8List(16));
    cfbBlockCipher.init(true, parameters);

    return cfbBlockCipher.process(Uint8List.fromList(data));
  }

  static Uint8List decryptFile(Uint8List encryptedData, Uint8List key) {
    final cbcBlockCipher = CBCBlockCipher(AESFastEngine());
    final cfbBlockCipher = CFBBlockCipher(cbcBlockCipher, 128);

    final parameters = ParametersWithIV(KeyParameter(key), Uint8List(16));
    cfbBlockCipher.init(false, parameters);

    return cfbBlockCipher.process(Uint8List.fromList(encryptedData));
  }

  static Uint8List generateRandomKey() {
    final random = Random.secure();
    const keyLength = 16; // 16 bytes for a 128-bit key
    final key = List<int>.generate(keyLength, (_) => random.nextInt(256));
    return Uint8List.fromList(key);
  }
}
