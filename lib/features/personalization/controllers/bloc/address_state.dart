part of 'address_bloc.dart';
sealed class AddressState {
  List<AddressModel> listAddress;
  AddressState({required this.listAddress});
}

final class AddressInitial extends AddressState {
  AddressInitial({required super.listAddress});
}
final class AddressSuccessState extends AddressState {
  AddressSuccessState({required super.listAddress});


}
final class AddressFailureState extends AddressState {
  final String message;
  AddressFailureState(this.message, {required super.listAddress});
}
final class AddressLoadingState extends AddressState {
  AddressLoadingState({required super.listAddress});
}

final class AddressUpdateSuccessState extends AddressState {
  AddressUpdateSuccessState({required super.listAddress});
}
final class AddressUpdateFailureState extends AddressState {
  final String message;
  AddressUpdateFailureState(this.message, {required super.listAddress});
}
final class AddressUpdateLoadingState extends AddressState {
  AddressUpdateLoadingState({required super.listAddress});
}


final class AddressAddSuccessState extends AddressState {
  AddressAddSuccessState({required super.listAddress});
}
final class AddressAddFailureState extends AddressState {
  final String message;
  AddressAddFailureState(this.message, {required super.listAddress});
}
final class AddressAddLoadingState extends AddressState {
  AddressAddLoadingState({required super.listAddress});
}