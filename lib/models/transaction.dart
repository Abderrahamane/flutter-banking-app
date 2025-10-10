// lib/models/transaction.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class BankTransaction {
  final String id;
  final String type;
  final double amount;
  final DateTime timestamp;
  final String? recipientEmail;
  final String? senderEmail;
  final String? note;

  BankTransaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.timestamp,
    this.recipientEmail,
    this.senderEmail,
    this.note,
  });

  factory BankTransaction.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return BankTransaction(
      id: doc.id,
      type: data['type'] ?? '',
      amount: (data['amount'] ?? 0.0).toDouble(),
      timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
      recipientEmail: data['recipientEmail'] as String?,
      senderEmail: data['senderEmail'] as String?,
      note: data['note'] as String?,
    );
  }
}
