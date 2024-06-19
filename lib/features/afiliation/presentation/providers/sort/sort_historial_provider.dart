// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortHistorialProvider = StateNotifierProvider.autoDispose<SortHistorialStateNotifier, SortHistorialState>((ref) => SortHistorialStateNotifier());


class SortHistorialStateNotifier extends StateNotifier<SortHistorialState> {
  SortHistorialStateNotifier() : super(SortHistorialState());

  void sort(int columnIndex) {
    state = state.copyWith(
      columnIndex: columnIndex,
      ascending: !state.ascending
    );
  }
}

class SortHistorialState {
  final int columnIndex;
  final bool ascending;

  SortHistorialState({
     this.columnIndex = 0,
      this.ascending = true});

  SortHistorialState copyWith({
    int? columnIndex,
    bool? ascending,
  }) 
    => SortHistorialState(
      columnIndex: columnIndex ?? this.columnIndex,
      ascending: ascending ?? this.ascending,
    );

}

