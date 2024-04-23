part of 'onboaring_cubit.dart';

@immutable
sealed class OnboaringState {}

final class OnboaringInitial extends OnboaringState {}

final class UpdateIndexState extends OnboaringState {}
