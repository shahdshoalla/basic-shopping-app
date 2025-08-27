import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping/sign_in.dart';
import 'package:shopping/sign_up.dart';

class MyWelcomeScreen extends StatefulWidget {
  const MyWelcomeScreen({super.key});

  @override
  State<MyWelcomeScreen> createState() => _MyWelcomeScreenState();
}

class _MyWelcomeScreenState extends State<MyWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(child: Text("Shopping App", style: TextStyle(color: Colors.amberAccent),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Premium Shopping Experience"),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Expanded(
              child: Image.asset(
                "asstes/photo1.jpeg" ,
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height*0.3,
              ),
            ),
                const SizedBox(width: 20),
            Expanded(
              child: Image.network(
                "https://media.istockphoto.com/id/501026201/vector/shopping-design.jpg?s=612x612&w=0&k=20&c=hErWY_JzTVod59JcoC3wdZCy2XF1em7QkZXo3x6y3fI=",
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height*0.3,
              ),
            ),
           ]
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const SignUp()
                  )
              );
            },
                child: Text(tr('signUp'))
            ),
                const SizedBox(width: 50),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const SignIn()
                  )
              );
            },
                child: Text(tr('signIn'))
            ),

        ]
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
             changeLang();
            },
                child: Text("Change language")
            )
          ],
        ),
        
      ),
    );
  }

  changeLang(){
    if(context.locale == Locale('en' , 'US')){
      context.setLocale(Locale('ar' ,'EG'));
    }else{
      context.setLocale(Locale('en' , 'US'));
    }
  }
}
