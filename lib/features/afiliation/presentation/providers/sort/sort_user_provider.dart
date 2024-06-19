// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortUserProvider = StateNotifierProvider.autoDispose<SortUserStateNotifier, SortUserState>((ref) => SortUserStateNotifier());


class SortUserStateNotifier extends StateNotifier<SortUserState> {
  SortUserStateNotifier() : super(SortUserState());

  void sort(int columnIndex) {
    state = state.copyWith(
      columnIndex: columnIndex,
      ascending: !state.ascending
    );
  }
}

class SortUserState {
  final int columnIndex;
  final bool ascending;

  SortUserState({
     this.columnIndex = 0,
      this.ascending = true});

  SortUserState copyWith({
    int? columnIndex,
    bool? ascending,
  }) 
    => SortUserState(
      columnIndex: columnIndex ?? this.columnIndex,
      ascending: ascending ?? this.ascending,
    );

}

