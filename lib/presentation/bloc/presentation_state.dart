part of 'presentation_bloc.dart';

sealed class PresentationState extends Equatable {
  const PresentationState();
  
  @override
  List<Object> get props => [];
}

final class PresentationInitial extends PresentationState {}
