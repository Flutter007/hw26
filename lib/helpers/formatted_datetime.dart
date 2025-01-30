import 'package:flutter/material.dart';

String _addZero(int dateTimeValue) {
  if (dateTimeValue < 10) {
    return '0$dateTimeValue';
  }
  return dateTimeValue.toString();
}

String formatDate(DateTime dateTime) {
  final day = _addZero(dateTime.day);
  final month = _addZero(dateTime.month);
  final year = _addZero(dateTime.year);
  return '$day.$month.$year';
}

String formatTime(TimeOfDay time) {
  final hour = _addZero(time.hour);
  final minutes = _addZero(time.minute);
  return '$hour:$minutes';
}

String formatDateTime(DateTime dateTime) {
  final date = formatDate(dateTime);
  final time = formatTime(TimeOfDay.fromDateTime(dateTime));
  return '$date $time';
}
