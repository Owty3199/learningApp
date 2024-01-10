import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEcran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          // L'utilisateur est connecté, affichez les informations et un bouton de déconnexion
          return _buildLoggedInUI(snapshot.data!);
        } else {
          // L'utilisateur n'est pas connecté, affichez le formulaire de connexion
          return _buildLoginForm();
        }
      },
    );
  }

  Widget _buildLoggedInUI(User user) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Email: ${user.email}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: Text('Se déconnecter'),
          ),
        ],
      ),
    );
  }

 Widget _buildLoginForm() {
  String email = '';
  String password = '';

  return Container(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onChanged: (value) {
            email = value;
          },
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 12),
        TextField(
          onChanged: (value) {
            password = value;
          },
          obscureText: true,
          decoration: InputDecoration(labelText: 'Mot de passe'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            try {
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password,
              );
            } catch (e) {
              print('Erreur de connexion: $e');
              // Gérer les erreurs d'authentification ici
            }
          },
          child: Text('Se connecter'),
        ),
      ],
    ),
  );
}

}
