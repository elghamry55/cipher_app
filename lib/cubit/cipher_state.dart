import 'package:flutter/foundation.dart';

enum CipherAlgo { caesar, railFence, vigenere }

@immutable
class CipherState {
  final String input;
  final String output;
  final CipherAlgo algorithm;
  final String keyOrShift;
  final bool isWorking;
  final String? error;

  const CipherState({
    this.input = '',
    this.output = '',
    this.algorithm = CipherAlgo.caesar,
    this.keyOrShift = '',
    this.isWorking = false,
    this.error,
  });

  CipherState copyWith({
    String? input,
    String? output,
    CipherAlgo? algorithm,
    String? keyOrShift,
    bool? isWorking,
    String? error,
  }) {
    return CipherState(
      input: input ?? this.input,
      output: output ?? this.output,
      algorithm: algorithm ?? this.algorithm,
      keyOrShift: keyOrShift ?? this.keyOrShift,
      isWorking: isWorking ?? this.isWorking,
      error: error,
    );
  }
}
