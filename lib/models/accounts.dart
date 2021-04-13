import 'package:app_bancaria/models/transactions.dart';

class AccountsModel {
  double balance;
  String alias, entity, accountNumber, user, type, money;
  int userId;
  List<TransactiontsModel> transactions;

  AccountsModel({
    this.balance,
    this.alias,
    this.entity,
    this.accountNumber,
    this.user,
    this.userId,
    this.type,
    this.money,
    this.transactions,
  });
}
