import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
  ));
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 56, 76),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Profile Team',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profil 1
              ProfileCard(
                name: 'Jesulin Noni Novelis Wattilete',
                role: 'Mobile Application Engineer',
                description:
                    'As a Flutter Developer, I enjoy learning new things and facing challenges in mobile app development. My expertise in Flutter allows me to build responsive and effective apps, while my design skills help create visually appealing user interfaces. Additionally, I have experience with Laravel to develop scalable backend solutions.',
                imagePath: 'assets/jeje.jpg',
                skills: [
                  Skill(icon: FontAwesomeIcons.paintbrush, skillName: 'Design'),
                  Skill(icon: FontAwesomeIcons.code, skillName: 'Flutter'),
                  Skill(icon: FontAwesomeIcons.laravel, skillName: 'Laravel'),
                ],
              ),
              const SizedBox(height: 20),

              // Profil 2
              ProfileCard(
                name: 'Astrid',
                role: 'Mobile Developer',
                description:
                    'I have a experience in mobile app development using Flutter. My focus is on building scalable and efficient mobile apps. With a deep understanding of backend development, I ensure seamless integration between the frontend and backend. I also enjoy challenges in optimizing app performance.',
                imagePath: 'assets/astrid.jpg',
                skills: [
                  Skill(icon: FontAwesomeIcons.paintbrush, skillName: 'Design'),
                  Skill(icon: FontAwesomeIcons.code, skillName: 'Flutter'),
                  Skill(icon: FontAwesomeIcons.briefcase, skillName: 'Backend'),
                ],
              ),
              const SizedBox(height: 20),

              // Profil 3
              ProfileCard(
                name: 'Vivi Safira Rizki',
                role: 'Mobile Developer',
                description:
                    'As a mobile developer, I am very enthusiastic to continue learning and developing in the field of mobile application development. I am currently focused on improving my skills in Flutter and SQL databases to build efficient and easy to use applications. I believe that my experience as a junior developer will provide me with many opportunities to grow further.',
                imagePath: 'assets/vivi.jpg',
                skills: [
                  Skill(icon: FontAwesomeIcons.paintbrush, skillName: 'Design'),
                  Skill(icon: FontAwesomeIcons.code, skillName: 'Flutter'),
                  Skill(icon: FontAwesomeIcons.database, skillName: 'SQL'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String description;
  final String imagePath;
  final List<Skill> skills;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.role,
    required this.description,
    required this.imagePath,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bagian Foto Profil
        AnimatedLogo(imagePath: imagePath),

        const SizedBox(width: 20), // Spasi antara foto dan keterangan

        // Bagian Keterangan dan Skills
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                role,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              SelectableText(
                description,
                style: const TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 15),

              // Menampilkan skill
              Wrap(
                spacing: 20.0,
                runSpacing: 10.0,
                children:
                    skills.map((skill) => SkillCard(skill: skill)).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  final String imagePath;

  const AnimatedLogo({super.key, required this.imagePath});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isZoomed = !isZoomed;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.only(bottom: isZoomed ? 20.0 : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
          border: Border.all(
            color: Color.fromARGB(255, 48, 56, 113),
            width: 2,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
            width: isZoomed ? 105 : 95,
            height: isZoomed ? 105 : 95,
          ),
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final Skill skill;

  const SkillCard({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blueAccent.withOpacity(0.2),
          child: Icon(
            skill.icon,
            size: 30,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          skill.skillName,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Skill {
  final IconData icon;
  final String skillName;

  Skill({required this.icon, required this.skillName});
}
