import 'package:delivery_app/exports.dart';

class ToastHelper {
  static success(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      // title: const Text('Sucesso!'),
      description: RichText(text: TextSpan(text: message)),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 100),
      // animationBuilder: (context, animation, alignment, child) {
      //   return FadeTransition(
      //     turns: animation,
      //     child: child,
      //   );
      // },
      icon: const Icon(Icons.check),
      showIcon: true, // show or hide the icon
      primaryColor: BrandColors.primaryColor,
      // backgroundColor: Colors.white,
      // foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      // boxShadow: const [
      //   BoxShadow(
      //     color: Color(0x07000000),
      //     blurRadius: 16,
      //     offset: Offset(0, 16),
      //     spreadRadius: 0,
      //   )
      // ],
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
    );
  }
}
