import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/helpers/helpers.dart';
import 'package:shop_app/providers/login_form_provider.dart';
import 'package:shop_app/views/home.dart';
import 'package:shop_app/widget_style/widget_style.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final loginForm = Provider.of<LoginFormProvider>(context);

    return FormContainer(
      size: size,
      child: Column(
        children: [
          Text(
            "Login",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Form(
                key: loginForm.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: WidgetStyle.inputDecoration(
                          label: "e mail", hint: "type your email"),
                      validator: (value) => Validator.email(value),
                      onChanged: (value) => loginForm.email = value,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: WidgetStyle.inputDecoration(
                          label: "password", hint: "type your password"),
                      validator: (value) => Validator.password(value),
                      onChanged: (value) => loginForm.password = value,
                    ),
                    FormButtonBar(provider: loginForm)
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class FormButtonBar extends StatelessWidget {
  final LoginFormProvider provider;
  const FormButtonBar({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text("create account"),
        ),
        ElevatedButton.icon(
          onPressed: provider.isLoading
              ? null
              : () async {
                  if (!provider.isValidForm()) return;
                  FocusScope.of(context).unfocus();
                  provider.isLoading = true;

                  await Future.delayed(const Duration(seconds: 2))
                      .then((value) {
                    provider.isLoading = false;

                    Navigator.pushReplacementNamed(context, HomeView.routeName);
                  });
                },
          icon: const Icon(Icons.login),
          label: Text(provider.isLoading ? "loading" : "login"),
        ),
      ],
    );
  }
}

class FormContainer extends StatelessWidget {
  final Size size;
  final Widget child;
  const FormContainer({Key? key, required this.size, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      height: size.height * 0.41,
      width: double.infinity,
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}
