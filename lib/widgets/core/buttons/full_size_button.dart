import 'package:delivery_app/exports.dart';

enum ButtonType {
  primary,
  secondary,
  danger,
}

class FullSizeButton extends StatelessWidget {
  const FullSizeButton({
    super.key,
    required this.onPressed,
    required this.description,
    this.buttonType = ButtonType.primary,
  });

  final VoidCallback onPressed;
  final String description;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    final buttonColors = _getButtonColors(buttonType);

    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColors['background'],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          minimumSize: const Size(0, 50),
        ),
        child: Text(
          description,
          style: TextStyle(color: buttonColors['text']),
        ),
      ),
    );
  }

  Map<String, Color> _getButtonColors(ButtonType type) {
    switch (type) {
      case ButtonType.danger:
        return {
          'background': Colors.red,
          'text': Colors.white,
        };
      case ButtonType.secondary:
        return {
          'background': Colors.grey.shade200,
          'text': Colors.black,
        };
      case ButtonType.primary:
      default:
        return {
          'background': BrandColors.primaryColor,
          'text': Colors.white,
        };
    }
  }
}
