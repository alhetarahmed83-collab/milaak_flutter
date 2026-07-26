import 'package:local_auth/local_auth.dart';

class LockService {
  final _auth = LocalAuthentication();

  Future<bool> canUseDeviceLock() async {
    return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    if (!await canUseDeviceLock()) return false;
    return _auth.authenticate(
      localizedReason: 'افتح مِلاك باستخدام قفل الجهاز',
      options: const AuthenticationOptions(biometricOnly: false),
    );
  }
}
