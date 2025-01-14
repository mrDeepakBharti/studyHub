import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

var kLogger = Logger();

class UserSimplePreferences {
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   signInOption: SignInOption.standard,
  //   scopes: ['email'],
  // );
  static late SharedPreferences _preferences;
  static Future init() async {
    return _preferences = await SharedPreferences.getInstance();
  }

  static const _keyUserId = "userId";
  static const _keyProfileToken = "profileToken";
  static const _keyCustomerMobile = "customerMobile";
  static const _keyCustomerDOB = "customerDOB";
  static const _keyCustomerEmail = "customerEmail";
  static const _keyCustomerName = "customerName";
  static const _keyCustomerPhoto = "customerPhoto";
  static const isFirstTimeAppOpen = "isFirstTimeAppOpen";
  static const _keyGroupId = 'groupId';

  // ----------------Group ID---------------- //
  static Future setGroupId(String groupId) async {
    await _preferences.remove(_keyGroupId); // Clear any existing groupId
    return await _preferences.setString(_keyGroupId, groupId);
  }

  static String? getGroupId() => _preferences.getString(_keyGroupId);

  static Future clearGroupId() async {
    return await _preferences.remove(_keyGroupId);
  }

  // ----------------Profile Token ---------------- //
  static Future setProfileToken(String profileToken) async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.setString(_keyProfileToken, profileToken);
  }

  static String? getProfileToken() => _preferences.getString(_keyProfileToken);
  static Future clearProfileToken() async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.remove(_keyProfileToken);
  }

  // ---------------- ------------User  Id-------------------- //
  static Future setUserId(String userId) async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.setString(_keyUserId, userId);
  }

  static String? getUserId() => _preferences.getString(_keyUserId);
  static Future clearUserId() async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.remove(_keyUserId);
  }

  // ----------------Customer Name ---------------- //
  static Future setCName(String cName) async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.setString(_keyCustomerName, cName);
  }

  static String? getCName() => _preferences.getString(_keyCustomerName);
  static Future clearCName() async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.remove(_keyCustomerName);
  }

  // ----------------Customer Mobile---------------- //
  static Future setCMobile(String cMobile) async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.setString(_keyCustomerMobile, cMobile);
  }

  static String? getCMobile() => _preferences.getString(_keyCustomerMobile);
  static Future clearCMobile() async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.remove(_keyCustomerMobile);
  }

  // ----------------Customer Email ---------------- //
  static Future setCEmail(String cEmail) async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.setString(_keyCustomerEmail, cEmail);
  }

  static String? getCEmail() => _preferences.getString(_keyCustomerEmail);
  static Future clearCEmail() async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.remove(_keyCustomerEmail);
  }

// ----------------Customer DOB ---------------- //
  static Future setCDOB(String cDOB) async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.setString(_keyCustomerDOB, cDOB);
  }

  static String? getCDOB() => _preferences.getString(_keyCustomerDOB);
  static Future clearCDOB() async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.remove(_keyCustomerDOB);
  }

  // ----------------Customer Photo---------------- //
  static Future setCPhoto(String cPhoto) async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.setString(_keyCustomerPhoto, cPhoto);
  }

  static String? getCPhoto() => _preferences.getString(_keyCustomerPhoto);
  static Future clearCPhoto() async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.remove(_keyCustomerPhoto);
  }

  // ----------------Customer isFirst time app open---------------- //
  static Future setIsFirstTimeOpen(String setIsFirstTimeOpen) async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.setString(isFirstTimeAppOpen, setIsFirstTimeOpen);
  }

  static String? getIsFirstTimeOpen() =>
      _preferences.getString(isFirstTimeAppOpen);
  static Future clearIsFirstTimeOpen() async {
    //  SharedPreferences _preferences = await SharedPreferences.getInstance();
    return await _preferences.remove(isFirstTimeAppOpen);
  }

  static Future clearAllData() async {
    try {
      await _preferences.clear();
      kLogger.i("All data cleared successfully.");
    } catch (e) {
      kLogger.e("Error clearing data: $e");
      rethrow;
    }
  }

  Future<void> logout() async {
    // await _googleSignIn.signOut();
    UserSimplePreferences.clearProfileToken();
    UserSimplePreferences.clearAllData();
    // Get.offAllNamed(RouteName.loginScreen);
  }
}
