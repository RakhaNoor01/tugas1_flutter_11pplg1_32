import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';
import '../widgets/custom_text_field.dart'; // Impor widget
import '../widgets/custom_button.dart';    // Impor widget

class LoginPage extends StatefulWidget {
  final String? initialEmail;
  final String? initialPassword;

  const LoginPage({super.key, this.initialEmail, this.initialPassword});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static final Map<String, String> _akunTersimpan = {
    'admin': '123',
  };

  @override
  void initState() {
    super.initState();
    if (widget.initialEmail != null && widget.initialPassword != null) {
      _akunTersimpan[widget.initialEmail!] = widget.initialPassword!;
      _usernameController.text = widget.initialEmail!;
      _passwordController.text = widget.initialPassword!;
      
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registrasi berhasil! Silakan login.'),
            backgroundColor: Colors.green,
          ),
        );
      });
    }
  }

  void _handleLogin() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text;

    if (_akunTersimpan.containsKey(username) && _akunTersimpan[username] == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username atau Password salah!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.lock_person_sharp,
                        size: 80,
                        color: Colors.blueAccent,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Selamat Datang",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Silakan login untuk melanjutkan",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 40),

                // --- MENGGUNAKAN CUSTOM WIDGET ---
                CustomTextField(
                  controller: _usernameController,
                  labelText: 'Username atau Email',
                  prefixIcon: Icons.person_outline,
                ),
                const SizedBox(height: 15),

                CustomTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 30),

                CustomButton(
                  text: "Login",
                  onPressed: _handleLogin,
                ),
                
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RegisterPage()),
                        );
                      },
                      child: const Text("Daftar di sini"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}