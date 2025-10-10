// providers/banking_provider.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/transaction.dart';

class BankingProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<BankTransaction> _transactions = [];
  List<BankTransaction> get transactions => _transactions;

  double _balance = 0.0;
  bool _isLoading = false;

  double get balance => _balance;

  Future<void> fetchBalance() async {
    try {
      final doc = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      _balance = (doc.data()?['balance'] ?? 0.0).toDouble();
      notifyListeners();
    } catch (e) {
      print('Error fetching balance: $e');
    }
  }

  Future<void> fetchTransactions() async {
    try {
      _isLoading = true;
      notifyListeners();

      final snapshot = await _firestore
          .collection('transactions')
          .where('userId', isEqualTo: _auth.currentUser!.uid)
          .orderBy('timestamp', descending: true)
          .limit(50)
          .get();

      _transactions = snapshot.docs
          .map((doc) => BankTransaction.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Error fetching transactions: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> transferMoney(String recipientEmail, double amount, String note) async {
    try {
      if (amount <= 0) return 'Invalid amount';
      if (amount > _balance) return 'Insufficient balance';

      final recipientQuery = await _firestore
          .collection('users')
          .where('email', isEqualTo: recipientEmail)
          .limit(1)
          .get();

      if (recipientQuery.docs.isEmpty) return 'Recipient not found';

      final recipientDoc = recipientQuery.docs.first;
      final senderId = _auth.currentUser!.uid;

      await _firestore.runTransaction((transaction) async {
        final senderRef = _firestore.collection('users').doc(senderId);
        final recipientRef = _firestore.collection('users').doc(recipientDoc.id);

        final senderSnap = await transaction.get(senderRef);
        final senderBalance = (senderSnap.data()?['balance'] ?? 0.0).toDouble();

        if (senderBalance < amount) throw Exception('Insufficient balance');

        transaction.update(senderRef, {'balance': senderBalance - amount});
        transaction.update(recipientRef, {
          'balance': FieldValue.increment(amount)
        });

        final transactionId = _firestore.collection('transactions').doc().id;

        transaction.set(_firestore.collection('transactions').doc(transactionId), {
          'userId': senderId,
          'type': 'transfer_out',
          'amount': -amount,
          'recipientEmail': recipientEmail,
          'note': note,
          'timestamp': FieldValue.serverTimestamp(),
        });

        transaction.set(_firestore.collection('transactions').doc(), {
          'userId': recipientDoc.id,
          'type': 'transfer_in',
          'amount': amount,
          'senderEmail': _auth.currentUser!.email,
          'note': note,
          'timestamp': FieldValue.serverTimestamp(),
        });
      });

      await fetchBalance();
      await fetchTransactions();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> requestDeposit(double amount) async {
    try {
      if (amount <= 0) return 'Invalid amount';

      await _firestore.collection('requests').add({
        'userId': _auth.currentUser!.uid,
        'type': 'deposit',
        'amount': amount,
        'status': 'pending',
        'timestamp': FieldValue.serverTimestamp(),
      });

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> requestWithdrawal(double amount) async {
    try {
      if (amount <= 0) return 'Invalid amount';
      if (amount > _balance) return 'Insufficient balance';

      await _firestore.collection('requests').add({
        'userId': _auth.currentUser!.uid,
        'type': 'withdrawal',
        'amount': amount,
        'status': 'pending',
        'timestamp': FieldValue.serverTimestamp(),
      });

      return null;
    } catch (e) {
      return e.toString();
    }
  }
}