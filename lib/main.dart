import 'package:a_m_s/Pages/UsersList/UsersList.dart';
import 'package:a_m_s/Utilities/Constant.dart';
import 'package:a_m_s/Widgets/signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'Pages/navigationPage.dart';
import 'StateManagment/Category/subCategoryProviderModel.dart';
import 'StateManagment/ContactUs/contactUsProviderModel.dart';
import 'StateManagment/News/newsProviderModel.dart';
import 'StateManagment/Products/productsProviderModel.dart';
import 'StateManagment/Promotions/promotionsProviderModel.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SubCategoryProviderModel>(
          create: (_) => SubCategoryProviderModel(),
        ),
        ChangeNotifierProvider<PromotionsProviderModel>(
          create: (_) => PromotionsProviderModel(),
        ),
        ChangeNotifierProvider<ProductsProviderModel>(
          create: (_) => ProductsProviderModel(),
        ),
        ChangeNotifierProvider<NewsProviderModel>(
          create: (_) => NewsProviderModel(),
        ),
        ChangeNotifierProvider<ContactUsProviderModel>(
          create: (_) => ContactUsProviderModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        routes: {
          '/users': (context) => const UsersList(),
        },
        debugShowCheckedModeBanner: false,
        home: MyHome(),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   final plugin = FacebookLogin(debug: true);
//    MyApp({Key? key}) : super(key: key);
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHome> {
  String? _sdkVersion;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SignInPage();
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Container(
    //           width: MediaQuery.of(context).size.width,
    //           height: MediaQuery.of(context).size.height * 0.7,
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               fit: BoxFit.fill,
    //               image: AssetImage('assets/images/login-bg.png'),
    //             ),
    //           ),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             // if (_sdkVersion != null) Text('SDK v$_sdkVersion'),
    //             if (isLogin)
    //               Padding(
    //                 padding: const EdgeInsets.only(bottom: 10),
    //                 child: _buildUserInfo(
    //                     context, _profile!, _token!, Constant.email),
    //               ),
    //             isLogin
    //                 ? ElevatedButton(
    //                     child: const Text('Log Out'),
    //                     onPressed: _onPressedLogOutButton,
    //                   )
    //                 : Column(
    //                     children: [
    //                       SizedBox(height: 40.h),
    //                       Text(
    //                         'Welcome back',
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.w700, fontSize: 34.sp),
    //                       ),
    //                       SizedBox(height: 7.h),
    //                       Text('Login to your account',
    //                           style: TextStyle(
    //                               color: Color(0xFFA1A1A1),
    //                               fontSize: 17.sp,
    //                               fontWeight: FontWeight.w400)),
    //                       SizedBox(height: 20.h),
    //                       ElevatedButton(
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Image.asset(
    //                               'assets/images/facebook-icon.png',
    //                               height: 24.h,
    //                             ),
    //                             SizedBox(width: 5.w),
    //                             const Text('Log In With Facebook',
    //                                 style:
    //                                     TextStyle(fontWeight: FontWeight.w400)),
    //                           ],
    //                         ),
    //                         onPressed: _onPressedLogInButton,
    //                         style: ElevatedButton.styleFrom(
    //                           primary: Color(0xFF3C5A9A),
    //                           padding: EdgeInsets.symmetric(
    //                               horizontal: 60.w, vertical: 5.h),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //
    //             // if (!isLogin && Platform.isAndroid)
    //             //   OutlineButton(
    //             //     child: const Text('Express Log In'),
    //             //     onPressed: () => _onPressedExpressLogInButton(context),
    //             //   )
    //           ],
    //         ),
    //         SizedBox(height: 50.h),
    //       ],
    //     ),
    //   ),
    // );
  }

  void push() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NavigationPage(),
    ));
  }
}
