import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/bloc/address_bloc.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../commom/widgets/loaders/loaders.dart';

class UserAddressScreen extends StatefulWidget {
  UserAddressScreen({Key? key}) : super(key: key);

  @override
  State<UserAddressScreen> createState() => _UserAddressScreenState();
}

class _UserAddressScreenState extends State<UserAddressScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(AddressFetched());
  }

  @override
  Widget build(BuildContext context) {
    final AddressBloc addressBloc = context.read<AddressBloc>();
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Addresses'),
        showBackArrow: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => UserAddAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        bloc: addressBloc,
        builder: (BuildContext context, state) {
          switch (state.runtimeType) {
            case AddressUpdateLoadingState :
            case AddressLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case AddressSuccessState:
            case AddressUpdateSuccessState:
            case AddressAddSuccessState:
              final successState = state;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      ListView.separated(
                        itemCount: successState.listAddress.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: TSizes.spaceBtwItems,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          final address = successState.listAddress[index];
                          return TSingleAddress(
                            selectedAddress: address.selectedAddress,
                            address: address,
                            onPressed:() {
                              addressBloc
                                  .add(AddressUpdateEvent(address.id, true));
                            }
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            default:
              print(state);
              if (state is AddressFailureState) {
                final failureState = state;
                TLoaders.errorSnackBar(
                    title: 'Oh Snap!', message: failureState.message);
                return Text("Error due to ${failureState.message}");
              }
              return const Text("Error");
          }
        }, listener: (BuildContext context, AddressState state) {
          // if (state is AddressUpdateSuccessState) {
          //   addressBloc.add(AddressFetched());
          // }
      },
      ),
    );
  }
}
