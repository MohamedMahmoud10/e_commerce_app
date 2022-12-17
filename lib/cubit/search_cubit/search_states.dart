abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {}

class SearchErrorStates extends SearchStates {
  final String error;

  SearchErrorStates(this.error);
}
