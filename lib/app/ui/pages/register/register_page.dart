import 'package:flutter/material.dart';
import 'package:mediquest/app/ui/global_controllers/session_controller.dart';
import 'package:mediquest/app/ui/global_widgets/custom_input_field.dart';
import 'package:mediquest/app/ui/global_widgets/rounded_button.dart';
import 'package:mediquest/app/ui/pages/register/utils/send_register_form.dart';
import 'package:mediquest/app/utils/email_validator.dart';
import 'package:mediquest/app/utils/name_validator.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_meedu/screen_utils.dart';
import 'controller/register_controller.dart';
import 'controller/register_state.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
    );
    final padding = context.mediaQueryPadding;
    final height = context.height -
        padding.top -
        padding.bottom -
        appBar.preferredSize.height;

    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          appBar: appBar,
          body: ListView(
            children: [
              SizedBox(
                height: height,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(15),
                    child: Align(
                      child: Form(
                        key: controller.formKey,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 360,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Registrarse",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                              CustomInputField(
                                label: "Nombre",
                                onChanged: controller.onNameChanged,
                                validator: (text) {
                                  return isValidName(text!)
                                      ? null
                                      : "Nombre inválido";
                                },
                              ),
                              const SizedBox(height: 15),
                              CustomInputField(
                                label: "Apellido",
                                onChanged: controller.onLastNameChanged,
                                validator: (text) {
                                  return isValidName(text!)
                                      ? null
                                      : "Apellido inválido";
                                },
                              ),
                              const SizedBox(height: 15),
                              CustomInputField(
                                label: "E-mail",
                                inputType: TextInputType.emailAddress,
                                onChanged: controller.onEmailChanged,
                                validator: (text) {
                                  return isValidEmail(text!)
                                      ? null
                                      : "E-mail inválido";
                                },
                              ),
                              const SizedBox(height: 15),
                              CustomInputField(
                                label: "Contraseña",
                                onChanged: controller.onPasswordChanged,
                                isPassword: true,
                                validator: (text) {
                                  if (text!.trim().length >= 6) {
                                    return null;
                                  }
                                  return "Contraseña inválida";
                                },
                              ),
                              const SizedBox(height: 15),
                              Consumer(
                                builder: (_, watch, __) {
                                  watch(
                                    registerProvider.select(
                                      (_) => _.password,
                                    ),
                                  );
                                  return CustomInputField(
                                    label: "Verificar contraseña",
                                    onChanged: controller.onVPasswordChanged,
                                    isPassword: true,
                                    validator: (text) {
                                      if (controller.state.password != text) {
                                        return "Las contraseñas no coinciden";
                                      }
                                      if (text!.trim().length >= 6) {
                                        return null;
                                      }
                                      return "Contraseña inválida";
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 30),
                              RoundedButton(
                                text: "Registrarse",
                                onPressed: () => sendRegisterForm(context),
                              ),
                              if (!context.isTablet) const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
