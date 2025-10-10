// screens/transactions/transaction_history_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../providers/banking_provider.dart';
import '../../models/transaction.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  String _filter = 'all';

  @override
  Widget build(BuildContext context) {
    final bankingProvider = Provider.of<BankingProvider>(context);
    final filteredTransactions = _getFilteredTransactions(bankingProvider.transactions);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() => _filter = value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'all', child: Text('All')),
              const PopupMenuItem(value: 'transfer_in', child: Text('Received')),
              const PopupMenuItem(value: 'transfer_out', child: Text('Sent')),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => bankingProvider.fetchTransactions(),
        child: ListView.builder(
          itemCount: filteredTransactions.length,
          itemBuilder: (context, index) {
            final transaction = filteredTransactions[index];
            return _TransactionDetailTile(transaction: transaction);
          },
        ),
      ),
    );
  }

  List<BankTransaction> _getFilteredTransactions(List<BankTransaction> transactions) {
    if (_filter == 'all') return transactions;
    return transactions.where((t) => t.type == _filter).toList();
  }
}

class _TransactionDetailTile extends StatelessWidget {
  final BankTransaction transaction;

  const _TransactionDetailTile({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isPositive = transaction.amount > 0;
    final currencyFormat = NumberFormat.currency(symbol: '\$');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isPositive ? Colors.green.shade100 : Colors.red.shade100,
          child: Icon(
            isPositive ? Icons.arrow_downward : Icons.arrow_upward,
            color: isPositive ? Colors.green : Colors.red,
          ),
        ),
        title: Text(_getTransactionTitle()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat.yMMMd().add_jm().format(transaction.timestamp)),
            if (transaction.note != null && transaction.note!.isNotEmpty)
              Text('Note: ${transaction.note}', style: const TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
        trailing: Text(
          currencyFormat.format(transaction.amount.abs()),
          style: TextStyle(
            color: isPositive ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        isThreeLine: transaction.note != null && transaction.note!.isNotEmpty,
      ),
    );
  }

  String _getTransactionTitle() {
    switch (transaction.type) {
      case 'transfer_in':
        return 'Received from ${transaction.senderEmail ?? "Unknown"}';
      case 'transfer_out':
        return 'Sent to ${transaction.recipientEmail ?? "Unknown"}';
      case 'deposit':
        return 'Deposit';
      case 'withdrawal':
        return 'Withdrawal';
      default:
        return 'Transaction';
    }
  }
}