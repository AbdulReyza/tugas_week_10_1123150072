import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginDong extends StatefulWidget {
  const LoginDong({super.key});

  @override
  State<LoginDong> createState() => _LoginDongState();
}

class _LoginDongState extends State<LoginDong> {
      final emailCtrl = TextEditingController();
      final passCtrl = TextEditingController();

      bool _isLoading = false;
      String? _error;

      Future<void> _login() async {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailCtrl.text.trim(),
          password: passCtrl.text,
      );
      final user = credential.user;
      if (!mounted) return;
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
          title: const Text('Login Success'),
          content: Text('UID: ${user?.uid}\nEmail: ${user?.email}'),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
        ),
      );
      } on FirebaseAuthException catch (e) {
        setState(() {
        _error = e.message;
      });
      } catch (e) {
        setState(() {
        _error = e.toString();
      });
      } finally {
        setState(() {
        _isLoading = false;
      });

      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(64, 193, 199, 1),
                Color.fromRGBO(0, 35, 53, 1),
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(0, 35, 53, 1),
                Color.fromRGBO(64, 193, 199, 1)
              ],
            ),
          ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              children: [
                SizedBox(height: 20,),
                TextField(
                  controller: emailCtrl,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 10, 55, 75),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 1.5),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: passCtrl,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 10, 55, 75),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 1.5),
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                if (_error != null) ...[
                const SizedBox(height: 10),
                Text(
                  _error!,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 14),
                ),
                const SizedBox(height: 8),
              ],
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF0077B6),
                          Color(0xFF00B4D8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: _isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}