import 'package:flutter/material.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final String? initialEmail;
  final String? initialPassword;

  const LoginPage({super.key, this.initialEmail, this.initialPassword});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String statusLogin = '';

  // Simpan akun dalam map
  Map<String, String> akunTersimpan = {
    'admin@gmail.com': 'admin123',
  };

  @override
  void initState() {
    super.initState();

    // Jika dikirim dari register, isi otomatis dan simpan akun
    if (widget.initialEmail != null && widget.initialPassword != null) {
      _emailController.text = widget.initialEmail!;
      _passwordController.text = widget.initialPassword!;
      akunTersimpan[widget.initialEmail!] = widget.initialPassword!;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          statusLogin = 'Berhasil daftar, silakan login';
        });
      });
    }
  }

  void _handleLogin() {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (akunTersimpan.containsKey(email) && akunTersimpan[email] == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      setState(() {
        statusLogin = 'Login Gagal';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login Page",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 120,
                  child: Image.asset('images/logo.png', fit: BoxFit.contain),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome to our First App",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Please login using your email and password"),
                const SizedBox(height: 20),

                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),

                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 15),

                Text(
                  statusLogin,
                  style: TextStyle(
                    color: statusLogin == 'Login Berhasil' ||
                            statusLogin == 'Berhasil daftar, silakan login'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text("Daftar"),
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
