part of 'total_bill_bloc.dart';

sealed class TotalBillEvent {}

class TotalBillAdded extends TotalBillEvent {
  final String extraService;
  final String extraFitting;
  final String totalAmount;
  final String customerId;
  final String serviceName;
  final String vehicleNumber;
  TotalBillAdded({
    required this.serviceName,
    required this.extraService,
    required this.extraFitting,
    required this.totalAmount,
    required this.customerId,
    required this.vehicleNumber,
  });
}
