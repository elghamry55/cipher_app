class Cipher {
  static String caesarEncryptWithKey(String text, String keyStr) {
    final shift = int.tryParse(keyStr.trim()) ?? 3;
    return _caesarShift(text, shift);
  }

  static String caesarDecryptWithKey(String text, String keyStr) {
    final shift = int.tryParse(keyStr.trim()) ?? 3;
    return _caesarShift(text, -shift);
  }

  static String _caesarShift(String text, int shift) {
    shift = shift % 26;
    final buffer = StringBuffer();
    for (final r in text.runes) {
      final c = String.fromCharCode(r);
      if (_isUpper(c)) {
        final base = 'A'.codeUnitAt(0);
        var idx = (r - base + shift) % 26;
        if (idx < 0) idx += 26;
        buffer.writeCharCode(base + idx);
      } else if (_isLower(c)) {
        final base = 'a'.codeUnitAt(0);
        var idx = (r - base + shift) % 26;
        if (idx < 0) idx += 26;
        buffer.writeCharCode(base + idx);
      } else {
        buffer.write(c);
      }
    }
    return buffer.toString();
  }

  static String railFenceEncryptWithKey(String text, String keyStr) {
    final rails = int.tryParse(keyStr.trim()) ?? 3;
    if (rails <= 1) return text;
    final rows = List<StringBuffer>.generate(rails, (_) => StringBuffer());
    int r = 0;
    int dir = 1;
    for (var ch in text.runes) {
      rows[r].writeCharCode(ch);
      r += dir;
      if (r == rails) {
        r = rails - 2;
        dir = -1;
      } else if (r == -1) {
        r = 1;
        dir = 1;
      }
    }
    return rows.map((b) => b.toString()).join();
  }

  static String railFenceDecryptWithKey(String cipher, String keyStr) {
    final rails = int.tryParse(keyStr.trim()) ?? 3;
    if (rails <= 1) return cipher;

    final pattern = <int>[];
    int r = 0;
    int dir = 1;
    for (int i = 0; i < cipher.length; i++) {
      pattern.add(r);
      r += dir;
      if (r == rails) {
        r = rails - 2;
        dir = -1;
      } else if (r == -1) {
        r = 1;
        dir = 1;
      }
    }

    final counts = List<int>.generate(
      rails,
      (i) => pattern.where((p) => p == i).length,
    );
    final rows = <List<int>>[];
    int idx = 0;
    for (final c in counts) {
      rows.add(cipher.codeUnits.sublist(idx, idx + c));
      idx += c;
    }

    final pointers = List<int>.filled(rails, 0);
    final out = StringBuffer();
    for (final p in pattern) {
      out.writeCharCode(rows[p][pointers[p]]);
      pointers[p] += 1;
    }
    return out.toString();
  }

  static String vigenereEncryptWithKey(String text, String key) {
    var k = key.replaceAll(RegExp(r'[^A-Za-z]'), '').toUpperCase();
    if (k.isEmpty) k = 'KEY';
    final out = StringBuffer();
    int ki = 0;
    for (final r in text.runes) {
      final c = String.fromCharCode(r);
      if (_isLetter(c)) {
        final base = _isUpper(c) ? 'A'.codeUnitAt(0) : 'a'.codeUnitAt(0);
        final shift = k.codeUnitAt(ki % k.length) - 'A'.codeUnitAt(0);
        var idx = (r - base + shift) % 26;
        out.writeCharCode(base + idx);
        ki++;
      } else {
        out.write(c);
      }
    }
    return out.toString();
  }

  static String vigenereDecryptWithKey(String text, String key) {
    var k = key.replaceAll(RegExp(r'[^A-Za-z]'), '').toUpperCase();
    if (k.isEmpty) k = 'KEY';
    final out = StringBuffer();
    int ki = 0;
    for (final r in text.runes) {
      final c = String.fromCharCode(r);
      if (_isLetter(c)) {
        final base = _isUpper(c) ? 'A'.codeUnitAt(0) : 'a'.codeUnitAt(0);
        final shift = k.codeUnitAt(ki % k.length) - 'A'.codeUnitAt(0);
        var idx = (r - base - shift) % 26;
        if (idx < 0) idx += 26;
        out.writeCharCode(base + idx);
        ki++;
      } else {
        out.write(c);
      }
    }
    return out.toString();
  }

  static bool _isUpper(String c) =>
      c.codeUnitAt(0) >= 'A'.codeUnitAt(0) &&
      c.codeUnitAt(0) <= 'Z'.codeUnitAt(0);

  static bool _isLower(String c) =>
      c.codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
      c.codeUnitAt(0) <= 'z'.codeUnitAt(0);

  static bool _isLetter(String c) => RegExp(r'[A-Za-z]').hasMatch(c);
}
