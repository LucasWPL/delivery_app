import 'package:delivery_app/exports.dart';

class FirebaseCircularImage extends StatelessWidget {
  final String fileName;
  final double size;

  const FirebaseCircularImage({
    super.key,
    required this.fileName,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: FirebaseHelper.getImageUrl(fileName),
      builder: (context, snapshot) {
        if ([ConnectionState.waiting, ConnectionState.active]
            .contains(snapshot.connectionState)) {
          return SizedBox(
            width: size,
            height: size,
            child: const CircularProgressIndicator(strokeWidth: 2),
          );
        }
        if (snapshot.hasError) {
          return ClipOval(
            child: Container(
              width: size,
              height: size,
              color: Colors.grey,
              child: Icon(Icons.error, size: size * 0.5, color: Colors.red),
            ),
          );
        }
        if (snapshot.hasData) {
          return ClipOval(
            child: Image.network(
              snapshot.data!,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          );
        }
        return ClipOval(
          child: Container(
            width: size,
            height: size,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
