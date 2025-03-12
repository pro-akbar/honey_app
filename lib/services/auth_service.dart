class AuthService {
  final Map<String, String> _users = {}; 

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); 
    return _users[email] == password;
  }

  Future<bool> register(String email, String password) async {
    if (_users.containsKey(email)) return false;
    _users[email] = password;
    return true;
  }
}
