export 'package:flutter/material.dart';
// core app
// background
export 'package:flutter_application_1/my_app.dart';
export 'package:flutter_application_1/core/app_colors/colors.dart';
export 'package:flutter_application_1/core/app_strings/string.dart';
export 'package:flutter_application_1/core/app_icons/icons.dart';
// bloc
export 'package:bloc/bloc.dart';
export 'package:flutter_application_1/features/auth/cubit/auth_cubit_cubit.dart';
export 'package:flutter_application_1/features/auth/cubit/auth_cubit_state.dart';
export 'package:flutter_application_1/features/app/cubit/cubit/app_cubit.dart';
export 'package:flutter_application_1/features/app/cubit/cubit/app_state.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';


export 'package:meta/meta.dart';
// firbase
export 'package:firebase_core/firebase_core.dart';
export 'package:flutter_application_1/config/firbase/firebase_options.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:google_sign_in/google_sign_in.dart';
export 'package:flutter_application_1/features/auth/repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// screens contant
export 'package:flutter_application_1/features/auth/pages/contant/buttom.dart';
export 'package:flutter_application_1/features/auth/pages/contant/customLogo.dart';
export 'package:flutter_application_1/features/auth/pages/contant/text_field.dart';
// login
export 'package:flutter_application_1/features/auth/pages/screen/login.dart';
//signup
export 'package:flutter_application_1/features/auth/pages/screen/signUp.dart';
//
export 'package:flutter_application_1/features/auth/validators/auth_validators.dart';
// theme
export 'package:flutter_application_1/config/themes/backGround.dart';
export 'package:flutter_application_1/config/themes/theme_dark.dart';
export 'package:flutter_application_1/config/themes/theme_light.dart';

// home page
export 'package:flutter_application_1/features/app/screens/addTask_page.dart';
export 'package:flutter_application_1/features/app/screens/homePage.dart';
export 'package:flutter_application_1/features/app/validators/app_validators.dart';

