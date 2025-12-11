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
      backgroundColor: Color.fromRGBO(0, 35, 53, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromRGBO(0, 35, 53, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children: [
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passCtrl,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20,),
            if(_error != null) ...[
              Text(_error!, 
              style: TextStyle(
                  color: Colors.red,
                ), 
              ),
              SizedBox(height: 8,),
            ],
            ElevatedButton(
              onPressed: _isLoading ? null : _login, 
              child: _isLoading ? CircularProgressIndicator() : Text('Log in')
              )
            ],
        ),
      ),
    );
  }
}