import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/loaders/loaders.dart';
import 'package:t_store/features/personalization/controllers/bloc/address_bloc.dart';
import 'package:t_store/utils/constants/sizes.dart';

class UserAddAddressScreen extends StatefulWidget {

  const UserAddAddressScreen({Key? key})
      : super(key: key);

  @override
  State<UserAddAddressScreen> createState() => _UserAddAddressScreenState();
}

class _UserAddAddressScreenState extends State<UserAddAddressScreen> {
  String _name = '';

  String _phoneNumber = '';
  String _street = '';
  String _postalCode = '';
  String _city = '';
  String _state = '';
  String _country = '';

  @override
  Widget build(BuildContext context) {
    final AddressBloc addressBloc = context.read<AddressBloc>();
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Add new Address'),
        showBackArrow: true,
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        bloc: addressBloc,
        buildWhen: (previous, current) => current is AddressAddLoadingState,
        listenWhen: (previous, current) => current is AddressAddSuccessState,
        builder: (BuildContext context, state) {
          print("xay dung lai");
          if (state is AddressAddLoadingState) return const Center(child: CircularProgressIndicator());
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name',),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields,),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _phoneNumber = value;
                        });
                      },
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields,),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _street = value;
                              });
                            },
                            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwInputFields,),
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _postalCode = value;
                              });
                            },
                            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields,),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _city = value;
                              });
                            },
                            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwInputFields,),
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _state = value;
                              });
                            },
                            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields,),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _country = value;
                        });
                      },
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                    ),
                    const SizedBox(height: TSizes.defaultSpace,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () => addressBloc.add(AddressAddEvent(_name, _phoneNumber,
                          _street, _postalCode, _city, _state, _country)),
                          child: const Text('Save')),
                    )


                  ],
                ),
              ),
            ),
          );
        }, listener: (BuildContext context, AddressState state) {
          print("nghe lai add success");
          if (state is AddressAddSuccessState) {
            Navigator.pop(context);
            TLoaders.successSnackBar(title: 'Success', message: "Congratulate you created new address");
            // addressBloc.add(AddressFetched());
          }
      },
      ),
    );
  }
}
