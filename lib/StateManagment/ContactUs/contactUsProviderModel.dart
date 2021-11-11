import 'package:a_m_s/API/ContactUs/contactUsApiManager.dart';
import 'package:a_m_s/Models/ContactUs/sendContactUsModel.dart';
import 'package:flutter/material.dart';

class ContactUsProviderModel extends ChangeNotifier {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> getFormKey() => _formKey;

  bool _isSending = false;
  bool isSending() => _isSending;

  Future<bool> sendContactUs() async {
    bool isSucess = false;
    _isSending = true;
    notifyListeners();
    SendContactUsModel sendContactUsModel = new SendContactUsModel(
        nameController.text, emailController.text, "", messageController.text);
    isSucess = await submitContactUsFormToServer(sendContactUsModel);
    if (isSucess) {
      nameController.text = "";
      emailController.text = "";
      messageController.text = "";
    }
    _isSending = false;
    notifyListeners();

    return isSucess;
  }
}
