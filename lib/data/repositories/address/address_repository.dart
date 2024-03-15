import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/models/address_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AddressRepository {

  static Future<List<AddressModel>> fetchAllAddress() async{
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final snapshot = await FirebaseFirestore.instance.collection('user').doc(userId).collection('address').get();

      return snapshot.docs.map((e) => AddressModel.fromDocumentSnapshot(e)).toList();
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  static Future<void> updateAddress(String addressId, bool selected) async{
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('user').doc(userId).collection('address').where('SelectedAddress', isEqualTo: true).get();
      List<DocumentSnapshot> documents = snapshot.docs;
      for (DocumentSnapshot doc in documents) {
        await doc.reference.update({'SelectedAddress': false});
      }
      await FirebaseFirestore.instance.collection('user').doc(userId).collection('address').doc(addressId).update(
          {'SelectedAddress': selected});

    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  static Future<String> addAddress(AddressModel address) async{
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await FirebaseFirestore.instance.collection('user').doc(userId).collection('address').add(address.toJson());
      return currentAddress.id;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}