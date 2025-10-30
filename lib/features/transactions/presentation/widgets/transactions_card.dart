import 'package:flutter/material.dart';
import 'package:view_line/core/localization/localized_helper.dart';
import 'package:view_line/features/transactions/domain/entities/sub_entities/transactions_data_entities.dart';

class TransactionCard extends StatelessWidget {
  final TransactionsDataEntities transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: const Icon(Icons.assignment_outlined, color: Colors.blue),
        ),
        title: Text(transaction.serviceTitleAr),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.isArabic
                  ? "الاسم: ${transaction.name}"
                  : "Name: ${transaction.name}",
            ),
            Text(
              context.isArabic
                  ? "رقم الجواز: ${transaction.passportNumber}"
                  : "Passport: ${transaction.passportNumber}",
            ),
            Text(
              context.isArabic
                  ? "الحالة: ${transaction.statusNameAr}"
                  : "Status: ${transaction.statusNameEn}",
            ),
            Text(
              context.isArabic
                  ? "رقم الهاتف: ${transaction.phoneNumber}"
                  : "Phone: ${transaction.phoneNumber}",
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}
