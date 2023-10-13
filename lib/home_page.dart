import 'package:flutter/material.dart';
import 'package:my_nadetdev_blog/description_page.dart';
import 'package:my_nadetdev_blog/main.dart';
import 'constants.dart' as constant_text_app;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: ListTile(
                  title: Text(
                    'NadetDev',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: const Text(
                  'Réglages',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Se déconnecter',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    child: const Text("L'histoire de l'Automobile"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    child: const Text('24h Le Mans'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    child: const Text('Arc de la Nature'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    child: const Text("Ville de l'aviation"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    child: const Text('Université Le Mans'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    child: const Text("Antoine de Saint-Exupéry"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    child: const Text('Rillettes'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const DescriptionPage(
                        title: constant_text_app.titre24hLeMans,
                        description: constant_text_app.text24hLeMans,
                        imagePath: constant_text_app.image24hLeMans,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        constant_text_app.image24hLeMans,
                        width: constant_text_app.imageWidth,
                        height: constant_text_app.imageHeight,
                      ),
                      const ListTile(
                        title: Text(
                          constant_text_app.titre24hLeMans,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        leading: Icon(Icons.flag),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const DescriptionPage(
                        title: constant_text_app.titreLeMansVilleChampions,
                        description: constant_text_app.textLeMansVilleChampions,
                        imagePath: constant_text_app.imageLeMansVilleChampions,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        constant_text_app.imageLeMansVilleChampions,
                        width: constant_text_app.imageWidth,
                        height: constant_text_app.imageHeight,
                      ),
                      const ListTile(
                        title: Text(
                          constant_text_app.titreLeMansVilleChampions,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        leading: Icon(Icons.stadium),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const DescriptionPage(
                        title: constant_text_app.titreLeMansGourments,
                        description: constant_text_app.textLeMansGourments,
                        imagePath: constant_text_app.imageLeMansGourments,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        constant_text_app.imageLeMansGourments,
                        width: constant_text_app.imageWidth,
                        height: constant_text_app.imageHeight,
                      ),
                      const ListTile(
                        title: Text(
                          constant_text_app.titreLeMansGourments,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        leading: Icon(Icons.restaurant),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const DescriptionPage(
                        title: constant_text_app.titreLeMansEcoResponsable,
                        description: constant_text_app.textLeMansEcoResponsable,
                        imagePath: constant_text_app.imageLeMansEcoResponsable,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        constant_text_app.imageLeMansEcoResponsable,
                        width: constant_text_app.imageWidth,
                        height: constant_text_app.imageHeight,
                      ),
                      const ListTile(
                        title: Text(
                          constant_text_app.titreLeMansEcoResponsable,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        leading: Icon(Icons.energy_savings_leaf),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const DescriptionPage(
                        title: constant_text_app.titreLeMansEtudesInnovations,
                        description:
                            constant_text_app.textLeMansEtudesInnovations,
                        imagePath:
                            constant_text_app.imageLeMansEtudesInnovations,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        constant_text_app.imageLeMansEtudesInnovations,
                        width: constant_text_app.imageWidth,
                        height: constant_text_app.imageHeight,
                      ),
                      const ListTile(
                        title: Text(
                          constant_text_app.titreLeMansEtudesInnovations,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        leading: Icon(Icons.book),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const DescriptionPage(
                        title:
                            constant_text_app.titreLeMansRencontrerLesManceaux,
                        description:
                            constant_text_app.textLeMansRencontrerLesManceaux,
                        imagePath:
                            constant_text_app.imageLeMansRencontrerLesMonceaux,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        constant_text_app.imageLeMansRencontrerLesMonceaux,
                        width: constant_text_app.imageWidth,
                        height: constant_text_app.imageHeight,
                      ),
                      const ListTile(
                        title: Text(
                          constant_text_app.titreLeMansRencontrerLesManceaux,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        leading: Icon(Icons.people),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
