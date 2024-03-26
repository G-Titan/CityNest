import 'package:flutter/material.dart';

class Power extends StatefulWidget {
  const Power({Key? key}) : super(key: key);

  @override
  _PowerState createState() => _PowerState();
}

class _PowerState extends State<Power> {
  bool isRegisterMode = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Power Stone',
            style: TextStyle(
              color: Colors.white, // Set text color to white
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Draggable(
                    feedback:
                        Container(), // Empty container to prevent visual artifacts
                    childWhenDragging:
                        Container(), // Empty container to prevent visual artifacts
                    child: AlertDialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      content: SingleChildScrollView(
                        child: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                children: [
                                  // Your background GIF
                                  Positioned.fill(
                                    child: Image.asset(
                                      'assets/animations/purpleFlame.gif', // Replace with your GIF path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 16),
                                      GestureDetector(
                                        onVerticalDragDown:
                                            (_) {}, // Prevent dragging on header
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.drag_handle,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              isRegisterMode
                                                  ? 'Register'
                                                  : 'Login',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.drag_handle,
                                                  color: Colors.transparent),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Username',
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Register',
                                            style: TextStyle(
                                              color: isRegisterMode
                                                  ? Colors.white
                                                  : Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Switch(
                                            value: isRegisterMode,
                                            onChanged: (value) {
                                              setState(() {
                                                isRegisterMode = value;
                                              });
                                            },
                                            activeColor: Colors.blue,
                                            inactiveThumbColor: Colors.grey,
                                          ),
                                          Text(
                                            'Login',
                                            style: TextStyle(
                                              color: !isRegisterMode
                                                  ? Colors.white
                                                  : Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (isRegisterMode) {
                                            // Proceed with registration
                                            print(
                                                'Proceeding with registration');
                                          } else {
                                            // Proceed with login
                                            print('Proceeding with login');
                                          }
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                        ),
                                        child: Text(
                                          isRegisterMode ? 'Proceed' : 'Login',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Define button color
            ),
            child: const Text(
              'Start',
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
          ),
        ],
      ),
    );
  }
}
