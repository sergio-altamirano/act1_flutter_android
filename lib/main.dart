import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: const NetworkImage(
              'https://raw.githubusercontent.com/sergio-altamirano/act1-android/refs/heads/main/tacos-al-pastor.jpg',
            ),
            title: 'taco de pastor',
            description:
                'Este delicioso taco de pastor, esta acompañado de su rica y fresca verdura y con el mejor sazon.',
          ),
          makePage(
            page: 2,
            image: const NetworkImage(
              'https://raw.githubusercontent.com/sergio-altamirano/act1-android/refs/heads/main/tacos-de-bistec-a-la-mexicana.jpg',
            ),
            title: 'Taco de bistec a la mexicana',
            description:
                'Este delicioso taco de bistec a la mexicana, esta acompañado de su rica y fresca verdura y con el mejor sazon.',
          ),
          makePage(
            page: 3,
            image: const NetworkImage(
              'https://raw.githubusercontent.com/sergio-altamirano/act1-android/refs/heads/main/tripa.jpg',
            ),
            title: 'taco de tripas',
            description:
                'este delicioso taco de tripas, esta acompañado de su rica y fresca verdura y con el mejor sazon.',
          ),
          makePage(
            page: 4,
            image: const NetworkImage(
              'https://raw.githubusercontent.com/sergio-altamirano/act1-android/refs/heads/main/buche.jpg',
            ),
            title: 'Taco de buche',
            description:
                'este delicioso taco de buche, esta acompañado de su rica y fresca verdura y con el mejor sazon.',
          ),
        ],
      ),
    );
  }

  Widget makePage({
    required ImageProvider image,
    required String title,
    required String description,
    required int page,
  }) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    page.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/$totalPage',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.star, color: Colors.yellow, size: 15),
                        Icon(Icons.star, color: Colors.yellow, size: 15),
                        Icon(Icons.star, color: Colors.yellow, size: 15),
                        Icon(Icons.star, color: Colors.yellow, size: 15),
                        Icon(Icons.star,
                            color: Color.fromARGB(255, 60, 59, 59), size: 15),
                        SizedBox(width: 5),
                        Text('4.0 ', style: TextStyle(color: Colors.black)),
                        Text('(2300)',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        description,
                        style: const TextStyle(
                          color: Colors.black,
                          height: 1.9,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 0),
                    const Text(
                      'READ MORE',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
