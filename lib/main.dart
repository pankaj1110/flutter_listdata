import 'package:flutter/material.dart';

class Contact {
  Contact({ this.name, this.mobile});

  String name;
  String mobile;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TodoTask'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Contact _contact = Contact();
  List<Contact> _contacts = [];
  // List<Contact> _contactslist = _contacts<List>.toSet().toList();

  // var set = <String>{};
  // List<Contact> duplicateName =
  // -.where((student) => set.add(student.name)).toList();


  // List<Contact> uniq=_contacts<String>.toSet().toList();
  // var seen = Set<String>();
  // List<Contact> uniquelist = _contacts.where((contact) => seen.add(contact.name)).toList();
  final _formKey = GlobalKey<FormState>();

  final _ctrlName = TextEditingController();
  final _ctrlMobile = TextEditingController();


  @override
  void initState() {
    print("data$_contacts");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_form(), _list()],
        ),
      ),
    );
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print('''
    Full Name : ${_contact.name}
    Mobile : ${_contact.mobile}
    ''');
      _contacts
          .add(Contact(name: _contact.name, mobile: _contact.mobile));
      form.reset();
    }
  }

  _form() => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _ctrlName,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Enter Email'),
                validator: (val) {
                  if (val.isEmpty ||
                      !RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(val)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                onSaved: (val) => setState(() => _contact.name = val),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _ctrlMobile,
                decoration: InputDecoration(labelText: 'Number',
                  hintText: 'Enter Number',),
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please enter number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onSaved: (val) => setState(() => _contact.mobile = val),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () => _onSubmit(),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      );

  _list() => Expanded(
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Scrollbar(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        _contacts.toSet().toList()[index].name,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_contacts[index].mobile),
                      onTap: () {},
                    ),
                    Divider(
                      height: 5.0,
                    ),
                  ],
                );
              },
              itemCount: _contacts.length,
            ),
          ),
        ),
      );
}
