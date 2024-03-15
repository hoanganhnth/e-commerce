
part of 'address_bloc.dart';

@immutable
sealed class AddressEvent{}

final class AddressFetched extends AddressEvent {}
final class AddressUpdateEvent extends AddressEvent {
  final String addressId;
  final bool isSelected;

  AddressUpdateEvent(this.addressId, this.isSelected);
}

final class AddressAddEvent extends AddressEvent {
  final String name;
  final String phoneNumber;
  final String street;
  final String postalCode;
  final String city;
  final String state;
  final String country;

  AddressAddEvent(this.name, this.phoneNumber, this.street, this.postalCode, this.city, this.state, this.country);


}