import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchDelegateProvider = StateNotifierProvider<SearchDelegateNotifier, SearchDelegateState>((ref) {
  return SearchDelegateNotifier();
});

class SearchDelegateNotifier extends StateNotifier<SearchDelegateState> {
  SearchDelegateNotifier(): super(SearchDelegateState());

  onInputChanged( String value ){
    state = state.copyWith(
      query: value.trim().toLowerCase()
    );
  }
  
}


class SearchDelegateState {

  final String query;

  SearchDelegateState({this.query = ''});

  SearchDelegateState copyWith({
    String? query,
  }) =>
     SearchDelegateState(
      query: query ?? this.query,
    );
  
}
