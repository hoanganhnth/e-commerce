import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/features/authentication/models/address_model.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitial(listAddress: [])) {

    on<AddressFetched>(_handleAddressFetchEvent);

    on<AddressUpdateEvent>(_handleAddressUpdateEvent);

    on<AddressAddEvent>(_handleAddressAddEvent);
  }


  void _handleAddressUpdateEvent(AddressUpdateEvent event, Emitter<AddressState> emit) async {
    try {
      emit(AddressUpdateLoadingState(listAddress: state.listAddress));
      await AddressRepository.updateAddress(event.addressId, event.isSelected);
      List<AddressModel> updatedList = List.from(state.listAddress);
      for (var address in updatedList) {
        if (address.id == event.addressId) {
          address.selectedAddress = true;
        } else {
          address.selectedAddress = false;
        }
      }
      emit(AddressUpdateSuccessState(listAddress: state.listAddress));
    } catch (e) {
      emit(AddressUpdateFailureState(e.toString(), listAddress: state.listAddress));
    }
  }

  void _handleAddressFetchEvent(AddressFetched event, Emitter<AddressState> emit) async {
    try {
      emit(AddressLoadingState(listAddress: state.listAddress));
      List<AddressModel> listAddress = await AddressRepository.fetchAllAddress();
      state.listAddress.assignAll(listAddress);
      emit(AddressSuccessState(listAddress: listAddress));
    } catch(e) {
      emit(AddressFailureState(e.toString(), listAddress: state.listAddress));
    }
  }

  void _handleAddressAddEvent(AddressAddEvent event, Emitter<AddressState> emit) async {
    try {
      emit(AddressAddLoadingState(listAddress: state.listAddress));
      AddressModel addressModel = AddressModel(name: event.name, phoneNumber: event.phoneNumber, street: event.street, city: event.city, state: event.state, postalCode: event.postalCode, country: event.country);
      String idNew = await AddressRepository.addAddress(addressModel);
      addressModel.id = idNew;
      state.listAddress.add(addressModel);
      emit(AddressAddSuccessState(listAddress: state.listAddress));
    } catch(e) {
      emit(AddressAddFailureState(e.toString(), listAddress: state.listAddress));
    }
  }


}