import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TextFormFieldState(),
    );
  }
}
class TextFormFieldState extends StatefulWidget {
    const TextFormFieldState({super.key });


  @override
  State<TextFormFieldState> createState() => TextFormFieldStateState();
}

class TextFormFieldStateState extends State<TextFormFieldState> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  String? name = "";
  String? emailAddress ="";
  String? pass = "";
  bool press = false;
  @override
  Widget build(BuildContext context) {
    void Pressed(){
      setState(() {
        press = !press;
      });
    }
    void sumbitform(){
      if(formstate.currentState!.validate()){
        formstate.currentState!.save();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Valid")));
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Form Field"),
        backgroundColor: const Color.fromARGB(255, 150, 161, 167),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: formstate,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                      child:  Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person , size: 100, color: Colors.black),
                           ),
                           Padding(
                             padding: EdgeInsets.all(8.0),
                             child: Text("Login Screen" ,style:  TextStyle(fontSize: 30,color: Colors.black87 , fontWeight: FontWeight.bold)),
                           ),
                          ],
                        ),
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: "Enter Your Email",
                      labelText: "Email",
                      border: const OutlineInputBorder(),
                      fillColor: Colors.grey[400],
                      filled: true,
                    ),
                    validator: (value) {
                      if(email.text.isEmpty){
                        return "Email is required";
                      }
                      if(!value!.contains("@")){
                       return "Email Must Contain @ sign";
                      }
                    },
                    onSaved: (value){
                      setState(() {
                        emailAddress = value ?? email.text;
                      });
                      
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: username,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Enter Your Username",
                      labelText: "Username",
                      border: const OutlineInputBorder(),
                      fillColor: Colors.grey[400],
                      filled: true,
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Username is required";
                      }
                      if(value.length > 15){
                       return "Maximum Length is 15 chars";
                      }
                    },
                    onSaved: (value){
                      setState(() {
                        name = value ?? username.text;
                      });
                      
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: password,
                    obscureText: press? false : true,
                    obscuringCharacter: "*",
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      suffixIcon:  IconButton(
                         onPressed: Pressed
                         , icon: press? const Icon(Icons.remove_red_eye) : const Icon(Icons.visibility_off)),
                      hintText: "Enter Your Password",
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      fillColor: Colors.grey[400],
                      filled: true,
                    ),
                    validator: (value) {
                      if(password.text.isEmpty){
                        return "Password is required";
                      }
                      if((value!.length < 8 ) || (value.length > 64 )){
                       return "Password must be betwwen 8 and 64 chars";
                      }
                    },
                    onSaved: (value){
                      setState(() {
                        pass = value ?? password.text;
                      });
                      
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: sumbitform, style:  const ButtonStyle(
                  backgroundColor: WidgetStateColor.transparent),
                child: const Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 18))),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: 350,
                      height: 150,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey[400]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                      Text("Email : $emailAddress",style: const TextStyle(fontSize: 20,color: Colors.white),),
                      const SizedBox(height: 10),
                      Text("Username : $name",style: const TextStyle(fontSize: 20,color: Colors.white),),
                      const SizedBox(height: 10),
                        Text("Password : $pass",style: const TextStyle(fontSize: 20,color: Colors.white),),
                        const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}