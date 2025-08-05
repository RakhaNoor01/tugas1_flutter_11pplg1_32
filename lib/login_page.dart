import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart'; // Impor halaman registrasi

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

  // Simulasi database akun. Dimulai dengan akun admin.
  static final Map<String, String> _akunTersimpan = {
    'admin': '123',
  };

  @override
  void initState() {
    super.initState();
    // Jika ada data yang dikirim dari halaman registrasi,
    // simpan akun baru dan isi form.
    if (widget.initialEmail != null && widget.initialPassword != null) {
      _akunTersimpan[widget.initialEmail!] = widget.initialPassword!;
      _usernameController.text = widget.initialEmail!;
      _passwordController.text = widget.initialPassword!;
      
      // Tampilkan pesan sukses setelah frame selesai dibangun
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

    // Cek apakah username dan password cocok dengan yang tersimpan
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
                // --- LOGO DITAMBAHKAN DI SINI ---
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.contain,
                    // Fallback jika gambar tidak ditemukan
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

                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username atau Email',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 15),

                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 20),

                // --- LINK KE HALAMAN REGISTER ---
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