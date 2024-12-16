import 'package:flutter/material.dart';
import 'package:portfolio/utils/appcolors.dart';
import 'package:portfolio/widgets/project_card.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final bool isTab;
  final bool isMob;

  CustomTabBar(
      {super.key,
        required this.tabController,
        this.isTab = false,
        this.isMob = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Adjust font sizes and container width based on the screen size
    double fontSize = isTab ? size.height * 0.015 : (isMob) ? size.height * 0.013 : size.height * 0.02;
    double containerWidth = size.width * (isMob ? 0.9 : isTab ? 0.7 : 0.45); // Adjust container width based on device type

    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        color: AppColors.limeGreen1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: Colors.white54,
          fontSize: fontSize - 2,
        ),
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: AppColors.limeGreen1,
          fontSize: fontSize, // Adjust font size for selected labels
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        controller: tabController,
        tabs: [
          Tab(
            child: Text(
              "Projects",
              style: TextStyle(fontSize: fontSize), // Adjust font size for tab text
            ),
          ),
          Tab(
            child: Text(
              "Certificates",
              style: TextStyle(fontSize: fontSize), // Adjust font size for tab text
            ),
          ),
          Tab(
            child: Text(
              "Publications",
              style: TextStyle(fontSize: fontSize), // Adjust font size for tab text
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabBarView extends StatelessWidget {
  final TabController tabController;
  final bool isTab;
  final bool isMob;

  CustomTabBarView(
      {super.key,
      required this.tabController,
      this.isMob = false,
      this.isTab = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TabBarView(
        controller: tabController,
        physics: BouncingScrollPhysics(),
        children: [

      Projects(
        size: size,
        isTab: isTab,
        isMob: isMob,
      ),
      Certificate(
        size: size,
        isTab: isTab,
        isMob: isMob,
      ),
      Publications(
        size: size,
        isTab: isTab,
        isMob: isMob,
      ),
    ]);
  }
}

class Publications extends StatelessWidget {
  final Size size;
  final bool isTab;
  final bool isMob;

  const Publications(
      {super.key, required this.size, this.isMob = false, this.isTab = false});

  @override
  Widget build(BuildContext context) {
    String path = 'assets/images/p1.jpg';
    String title = 'Comprehensive Study of Google Gemini';
    String body =
        'As AI advances, text-generating tools like Google Gemini, ChatGPT, and Co-Pilot have gained prominence in various applications, from chatbots to language generation. This paper conducts a comparative study of Google Gemini and other AI models, examining their architecture, training data, and learning algorithms. Empirical evaluations will assess language understanding, coherence, and response generation based on predefined metrics. The primary objective is to highlight the similarities and differences between Google Gemini and its counterparts, providing insights into their strengths and weaknesses. This study contributes to a broader understanding of AI-powered conversational agents and lays the groundwork for future research in enhancing conversational AI systems.';
    final List<ProjectCard> projectCards = List.generate(1, (index) {
      return ProjectCard(
        mainText1: title,
        path: path,
        mainText2: body,
        color: Colors.black,
        isTab: isTab,
        isMob: isMob,
      );
    });

    return Expanded(
      child: Container(
        height: size.height * 0.4,
        padding: isMob ? EdgeInsets.only(left: 2) : EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: GridView.builder(
          scrollDirection: isMob ? Axis.horizontal : Axis.vertical ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTab ? 3 : (isMob ? 1 : 4),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          padding: EdgeInsets.all(10),
          itemCount: projectCards.length,
          itemBuilder: (context, index) {
            return Expanded(
              child: projectCards[index],
            );
          },
        ),
      ),
    );
  }
}



class Projects extends StatelessWidget {
  final Size size;
  final bool isTab;
  final bool isMob;

  const Projects(
      {super.key, required this.size, this.isMob = false, this.isTab = false});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      'Shringar',
      'NoteApp',
      'Twitter-Clone',
      'Portfolio',
      'ChatGPT based ChatApp'
    ];
    List<String> body = [
      "Shringar is an innovative jewelry shopping app developed collaboratively using React for web and React Native for mobile. Showcasing a curated collection of rings, necklaces, and earrings, the app provides a seamless shopping experience accessible anytime, anywhere. With secure payment options and intuitive navigation, Shringar prioritizes user satisfaction. As a Full-Stack Developer, I designed the UI/UX to ensure responsiveness across platforms, integrated remote APIs for enhanced functionality, and implemented the Razorpay payment gateway for secure transactions. This project utilizes React, React Native, JavaScript, Axios, Context API, Feather icons, React Native Animatable, and AsyncStorage for local storage.",
      "NoteApp is a streamlined note-taking application developed in Kotlin, designed to simplify the creation and organization of notes efficiently. As a Mobile Application Developer, I focused on enhancing user experience by designing a clean, responsive UI that adapts to various devices and screen sizes. I managed local database operations using Room DB, ensuring efficient data storage and retrieval. Additionally, I integrated and managed native modules to boost app functionality. The project employs the MVVM (Model-View-ViewModel) architecture, which promotes a clear separation of concerns, improving both maintainability and testability of the application while providing a robust framework for development.",
      "The Twitter clone is a social media application developed using Jetpack Compose and powered by Firebase. This app allows users to upload posts, follow other users, and interact with tweets in a visually appealing interface. Leveraging Firebase for backend services, I implemented authentication and used Firestore as the real-time database for seamless data synchronization. Users can create, read, and engage with tweets while receiving live updates. This project highlights the powerful combination of Jetpack Compose's UI capabilities with Firebase's robust backend services, creating a smooth and engaging user experience.",
      "The portfolio project is a visually striking application developed using Flutter, aimed at exploring the framework's capabilities. This app showcases my work and skills in a dynamic and responsive design, emphasizing a clean user interface and smooth navigation. The main goal of the project was to experiment with Flutter's widget-based architecture and cross-platform functionality, allowing me to create a seamless experience on both mobile and web platforms. By leveraging Flutter's rich set of pre-built widgets and powerful customization options, I was able to present my projects effectively while gaining hands-on experience with this innovative framework.",
      "The ChatGPT chatting app is my first application, designed to provide an intuitive and engaging chat experience. Built using modern technologies, this app allows users to interact with the ChatGPT model seamlessly. I utilized OkHttp for efficient networking and API requests, ensuring fast and reliable communication with the backend. The clean and user-friendly interface enhances user engagement, allowing for smooth conversations. This project not only showcases my ability to implement real-time chat functionality but also serves as a foundational experience in app development, helping me gain valuable insights into best practices and effective use of libraries."
    ];
    List<String> path = [
      'assets/images/pj1.jpg',
      'assets/images/pj2.png',
      'assets/images/pj3.png',
      'assets/images/pj4.png',
      'assets/images/pj5.png',
    ];
    List<Color> colors = [
      AppColors.rubyRed,
      AppColors.properYellow,
      Colors.blue,
      AppColors.flutterBlue,
      AppColors.charcoal
    ];
    final List<ProjectCard> projectCards = List.generate(5, (index) {
      return ProjectCard(
          mainText1: title[index],
          mainText2: body[index],
          path: path[index],
          isTab: isTab,
          isMob: isMob,
          color: colors[index]);
    });

    return Expanded(
      child: Container(
        height: size.height,

          padding: isMob ? EdgeInsets.only(left: 2) : EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: GridView.builder(

          scrollDirection: isMob ? Axis.horizontal : Axis.vertical ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTab ? 3 : (isMob ? 1 : 4),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1),
          padding: EdgeInsets.all(10),
          itemCount: projectCards.length,
          itemBuilder: (context, index) {
            return Expanded(
              child: projectCards[index],
            );
          },
        ),
      ),
    );
  }
}

class Certificate extends StatelessWidget {
  final Size size;
  final bool isTab;
  final bool isMob;

  const Certificate(
      {super.key, required this.size, this.isMob = false, this.isTab = false});

  @override
  Widget build(BuildContext context) {
    List<String> path = [
      'assets/images/c1.png',
      'assets/images/c2.png',
      'assets/images/c3.png',
      'assets/images/c4.png'
    ];
    List<String> title = [
      "Introduction to Android Development",
      "Create UserInterface in Android",
      "React Native",
      "Working with data in Android"
    ];
    List<String> body = [
      "Learned about the Android Operating System, gaining a solid understanding of its architecture and core components, including the Linux kernel and application framework. I explored essential elements like activities, services, and broadcast receivers, understanding how they interact within the system. This knowledge equipped me to design applications that leverage Android's unique capabilities effectively. Additionally, I studied permissions, security, and app distribution through the Google Play Store. Overall, this exploration has deepened my appreciation for Android's versatility and enhanced my ability to create robust, efficient applications tailored to user needs.",
      "Learned about Jetpack Compose, the modern toolkit for building native UIs in Android applications. By focusing on its declarative programming approach, I mastered creating dynamic user interfaces with less boilerplate code. I delved into various UI components and layouts, enhancing my skills in state management and user interaction. This experience included customizing themes and animations to improve visual appeal. My hands-on projects using Jetpack Compose reinforced best practices for responsive design. Overall, this toolkit has significantly improved my efficiency in UI development, allowing me to create engaging, user-friendly applications that prioritize the overall experience.",
      "Learned about React Native, a powerful framework for developing cross-platform mobile applications using a single codebase. This experience taught me the advantages of code reusability, streamlining my development process and reducing time-to-market. I explored React Native’s extensive components, libraries, and tools to create responsive, high-performing applications. My understanding of React’s component-based architecture enabled me to design consistent user interfaces across platforms while optimizing performance. I developed complete applications that deliver engaging user experiences. This framework broadened my ability to reach diverse audiences, ultimately enhancing my portfolio and equipping me to deliver impactful mobile solutions.",
      "Learned to integrate Retrofit and RoomDB into my Android applications, enhancing my skills in data management and persistence. With Retrofit, I became proficient in making API calls and handling responses effectively, simplifying data retrieval and display. I learned to implement best practices for network communication and error handling to improve user experience. RoomDB provided essential tools for managing local databases, allowing for seamless data persistence and offline capabilities. This combined knowledge has empowered me to build applications that are data-driven and user-friendly, ensuring smooth performance and a positive user experience across my applications."
    ];

    final List<ProjectCard> projectCards = List.generate(4, (index) {
      return ProjectCard(
        mainText1: title[index],
        path: path[index],
        mainText2: body[index],
        color: AppColors.meta,
        isTab: isTab,
        isMob: isMob,
      );
    });

    return Container(
      width: size.width,
      height: size.height * 0.1,
      padding: isMob ? EdgeInsets.only(left: 2) : EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: GridView.builder(
        scrollDirection: isMob ? Axis.horizontal : Axis.vertical ,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isTab ? 3 : (isMob ? 1 : 4),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        padding: EdgeInsets.all(10),
        itemCount: projectCards.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: projectCards[index],
          );
        },
      ),
    );
  }
}


