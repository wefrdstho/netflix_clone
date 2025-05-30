import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key}); // Corrected key usage

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black87,
            Colors.black54,
            Colors.transparent,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Row with Logo and Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      "assets/movies/netfologo.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Icons
                  Row(
                    children: const [
                      Icon(Icons.cast, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.search, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.person, color: Colors.white),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Menu options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "TV Shows",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "Movies",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
