import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/bloc/auth_state.dart';
import 'package:walmart/layout/password_layout.dart';
import 'package:walmart/widget/form_widget.dart';

import '../widget/others.dart';

class TabletScreen extends StatefulWidget {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  State<TabletScreen> createState() => TabletScreenState();
}

class TabletScreenState extends State<TabletScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Text text = const Text(
      'Sign in to your Walmart account',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'BogleWeb'),
    );

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state is EmailContinueState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Proceeding to password entry'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordLayout(
                email: state.email,
              ),
            ),
          );
        }

        if (state is SignedUpState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully. Please sign in.'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Container(
                          width: width / 6,
                          height: width / 6,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage('images/wall.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      const SizedBox(height: 30),
                      text,
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: width / 2,
                          child: FormWidget(),
                        ),
                      ),
                      Expanded(child: const SizedBox()),
                      ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: BottomAppBar(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10, top: 0, right: 10),
                              child: InkWell(
                                hoverColor: Colors.white,
                                splashColor: Colors.white,
                                onTap: () {},
                                child: const OthersInfos(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        );
      },
    );
  }
}
