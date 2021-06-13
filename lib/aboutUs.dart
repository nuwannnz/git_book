import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Git Book"),
        ),
        body: ListView(
          children: <Widget>[
            Column(children: [
              Image.asset(
                'images/about-us.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              featureSection,
              benefitsSection,
              teamSection
            ])
          ],
        ));
  }

  Widget featureSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'FEATURES OF GIT',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Color(0xFF7cb342)),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Open Source',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Git is an open-source tool. It is released under the GPL (General Public License) license.',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scalable',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Git is scalable, which means when the number of users increases, the Git can easily handle such situations.',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Distributed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'One of Git\'s great features is that it is distributed. Distributed means that instead of switching the project to another machine, we can create a "clone" of the entire ',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ],
    ),
  );

  Widget benefitsSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'BENEFITS OF GIT',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Color(0xFF7cb342)),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saves Time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Git is lightning fast technology. Each command takes only a few seconds to execute so we can save a lot of time as compared to login to a GitHub account and find out its features.',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Offline Working',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'One of the most important benefits of Git is that it supports offline working. If we are facing internet connectivity issues, it will not affect our work. In Git, we can do almost everything locally. Comparatively, other CVS like SVN is limited and prefer the connection with the central repository.',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Undo Mistakes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'One additional benefit of Git is we can Undo mistakes. Sometimes the undo can be a savior option for us. Git provides the undo option for almost everything.',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Track the Changes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Git facilitates with some exciting features such as Diff, Log, and Status, which allows us to track changes so we can check the status, compare our files or branches.',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ],
    ),
  );

  Widget teamSection = Container(
    padding: const EdgeInsets.all(32),
    child: Expanded(
        //crossAxisAlignment: CrossAxisAlignment.start,
        child: Column(
      children: [
        /*2*/
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'MEET THE TEAM',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45,
                color: Color(0xFF7cb342)),
          ),
        ),
        Wrap(children: <Widget>[
          Column(
            children: [
              Card(
                  child: Column(
                children: [
                  Image.asset(
                    'images/male.jpg',
                    width: 150,
                    height: 200,
                    //fit: BoxFit.cover,
                  ),
                  Text( 
                    'Nuwan Karunarathna',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                        'IT18XXXXXX',
                        softWrap: true,
                        style: TextStyle(
                          color: Color(0xFF7cb342)),
                        )
                ],
              )),
              Card(
                child: Column(
                children: [
                  Image.asset(
                    'images/male.jpg',
                    width: 150,
                    height: 200,
                    //fit: BoxFit.cover,
                  ),
                  Text( 
                    'Hasintha Kavindu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                   Text(
                        'IT18XXXXXX',
                        softWrap: true,
                        style: TextStyle(
                          color: Color(0xFF7cb342)),
                        )
                ],
              )),
            ],
          ),
          Column(
            children: [
              Card(
                child: Column(
                children: [
                  Image.asset(
                    'images/female.png',
                    width: 150,
                    height: 200,
                    //fit: BoxFit.cover,
                  ),
                  Text( 
                    'Anjana Kumari',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                   Text(
                        'IT18XXXXXX',
                        softWrap: true,
                        style: TextStyle(
                          color: Color(0xFF7cb342)),
                        )
                ],
              )),
              Card(
                child: Column(
                children: [
                  Image.asset(
                    'images/male.jpg',
                    width: 150,
                    height: 200,
                    //fit: BoxFit.cover,
                  ),
                  Text( 
                    'Nirmal Amanda',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                   Text(
                        'IT18152906',
                        softWrap: true,
                        style: TextStyle(
                          color: Color(0xFF7cb342)),
                        )
                ],
              )),
            ],
          )
        ]),
      ],
    )),
  );
}
