import 'package:bloc/bloc.dart';
import 'cipher_state.dart';
import '../core/utils/cipher_functions.dart';

class CipherCubit extends Cubit<CipherState> {
  CipherCubit() : super(const CipherState());

  void setInput(String input) =>
      emit(state.copyWith(input: input, error: null));

  void setAlgorithm(CipherAlgo algo) =>
      emit(state.copyWith(algorithm: algo, keyOrShift: '', error: null));

  void setKeyOrShift(String val) =>
      emit(state.copyWith(keyOrShift: val, error: null));

  void encrypt() {
    try {
      emit(state.copyWith(isWorking: true, error: null));
      final out = _process(encrypt: true);
      emit(state.copyWith(output: out, isWorking: false));
    } catch (e) {
      emit(state.copyWith(isWorking: false, error: e.toString()));
    }
  }

  void decrypt() {
    try {
      emit(state.copyWith(isWorking: true, error: null));
      final out = _process(encrypt: false);
      emit(state.copyWith(output: out, isWorking: false));
    } catch (e) {
      emit(state.copyWith(isWorking: false, error: e.toString()));
    }
  }

  String _process({required bool encrypt}) {
    final algo = state.algorithm;
    final text = state.input;
    final key = state.keyOrShift;
    if (algo == CipherAlgo.caesar) {
      return encrypt
          ? Cipher.caesarEncryptWithKey(text, key)
          : Cipher.caesarDecryptWithKey(text, key);
    } else if (algo == CipherAlgo.railFence) {
      return encrypt
          ? Cipher.railFenceEncryptWithKey(text, key)
          : Cipher.railFenceDecryptWithKey(text, key);
    } else {
      return encrypt
          ? Cipher.vigenereEncryptWithKey(text, key)
          : Cipher.vigenereDecryptWithKey(text, key);
    }
  }

  void clearAll() => emit(const CipherState());
}
