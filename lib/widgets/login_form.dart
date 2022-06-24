import 'package:flutter/material.dart';
import 'package:shop_app/helpers/helpers.dart';
import 'package:shop_app/widget_style/widget_style.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FormContainer(
      size: size,
      child: Column(
        children: [
          Text(
            "Login",
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: WidgetStyle.inputDecoration(
                          label: "e mail", hint: "type your email"),
                      validator: (value) => Validator.email(value),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: WidgetStyle.inputDecoration(
                          label: "password", hint: "type your password"),
                      validator: (value) => Validator.password(value),
                    ),
                    const FormButtonBar()
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class FormButtonBar extends StatelessWidget {
  const FormButtonBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        OutlinedButton(onPressed: () {}, child: const Text("create account")),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.login),
          label: const Text("login"),
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
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: size.height * 0.45,
      width: double.infinity,
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}
