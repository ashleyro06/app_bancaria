import 'package:app_bancaria/screens/added_accounts_screen.dart';
import 'package:app_bancaria/screens/mycards_screen.dart';
import 'package:bloc/bloc.dart';

enum NavigationEvents { MyCardsClickedEvent, AddedAccountsClickedEvent }

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  NavigationStates get initialState => MyCardsScreen();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.MyCardsClickedEvent:
        yield MyCardsScreen();
        break;
      case NavigationEvents.AddedAccountsClickedEvent:
        yield AddedAccountsScreen();
        break;
    }
  }
}
