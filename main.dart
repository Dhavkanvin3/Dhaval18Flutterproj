import 'package:flutter/material.dart';

void main() {
  runApp(RoyalStayApp());
}

// =====================================================
// GLOBAL DATA
// =====================================================

String selectedRoom = "Deluxe Room";
String selectedPrice = "₹2500 / Night";

String customerName = "";
String customerPhone = "";
String checkInDate = "";
String checkOutDate = "";
String customerGuests = "1";
String customerPayment = "Cash";

String currentBookingId = "";

List<String> savedRooms = [];

List<Map<String, String>> bookings = [];

// =====================================================
// PROFILE DATA
// =====================================================

int selectedProfileIcon = 0;

List<IconData> profileIcons = [
  Icons.person,
  Icons.person_outline,
  Icons.face,
  Icons.account_circle,
  Icons.emoji_emotions,
  Icons.star,
];

// =====================================================
// HOTEL COLORS
// =====================================================

const Color primaryColor = Color(0xFF7C3AED);
const Color secondaryColor = Color(0xFFFF6B6B);
const Color accentColor = Color(0xFF38BDF8);
const Color mintColor = Color(0xFF34D399);

const Color darkBackground = Color(0xFF171323);

// =====================================================
// APP
// =====================================================

class RoyalStayApp extends StatefulWidget {
  @override
  State<RoyalStayApp> createState() => RoyalStayAppState();
}

class RoyalStayAppState extends State<RoyalStayApp> {
  bool isDarkMode = false;

  bool isLoggedIn = false;

  String loggedUser = "";

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void login(String name) {
    setState(() {
      isLoggedIn = true;
      loggedUser = name;
    });
  }

  void logout() {
    setState(() {
      isLoggedIn = false;
      loggedUser = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Royal Stay Hotel",

      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // =================================================
      // LIGHT THEME
      // =================================================

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor: Color(0xFFF8F7FF),

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF241B35),
          elevation: 0,
        ),

        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,

            minimumSize: Size(
              double.infinity,
              54,
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,

          fillColor: Colors.white,

          contentPadding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: primaryColor,
              width: 2,
            ),
          ),
        ),
      ),

      // =================================================
      // DARK THEME
      // =================================================

      darkTheme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
        ),

        scaffoldBackgroundColor: darkBackground,

        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF211A30),
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        cardTheme: CardThemeData(
          color: Color(0xFF241D32),
          elevation: 0,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,

            minimumSize: Size(
              double.infinity,
              54,
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,

          fillColor: Color(0xFF241D32),

          contentPadding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: accentColor,
              width: 2,
            ),
          ),
        ),
      ),

      // =================================================
      // LOGIN FIRST
      // =================================================

      home: isLoggedIn
          ? MainNavigation(
              isDarkMode: isDarkMode,
              toggleTheme: toggleTheme,
              isLoggedIn: isLoggedIn,
              loggedUser: loggedUser,
              login: login,
              logout: logout,
            )
          : LoginWelcomePage(
              login: login,
            ),
    );
  }
}

// =====================================================
// LOGIN WELCOME PAGE
// =====================================================

class LoginWelcomePage extends StatelessWidget {
  final Function(String) login;

  LoginWelcomePage({
    required this.login,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F7FF),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),

          children: [
            SizedBox(height: 25),

            // LOGO
            Center(
              child: Container(
                width: 78,
                height: 78,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      Color(0xFFA855F7),
                    ],
                  ),

                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withValues(
                        alpha: 0.25,
                      ),
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),

                child: Icon(
                  Icons.hotel,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),

            SizedBox(height: 18),

            Text(
              "Royal Stay",
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color(0xFF241B35),
              ),
            ),

            SizedBox(height: 7),

            Text(
              "Your comfort. Your stay. Your experience.",
              textAlign: TextAlign.center,

              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
            ),

            SizedBox(height: 30),

            // HERO IMAGE
            Container(
              height: 235,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),

                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1566073771259-6a8506099945",
                  ),

                  fit: BoxFit.cover,
                ),
              ),

              child: Container(
                padding: EdgeInsets.all(22),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),

                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,

                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ],
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Stay Beautifully",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Discover rooms designed for comfort.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 25),

            // LOGIN CARD
            Container(
              padding: EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(24),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 18,
                    offset: Offset(0, 8),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "Login to manage your bookings and rooms.",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),

                  SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: () {
                      showLoginDialog(
                        context,
                        login,
                      );
                    },

                    icon: Icon(Icons.login),

                    label: Text("LOGIN"),
                  ),

                  SizedBox(height: 12),

                  OutlinedButton.icon(
                    onPressed: () {
                      showSignupDialog(
                        context,
                        login,
                      );
                    },

                    icon: Icon(
                      Icons.person_add_alt_1,
                    ),

                    label: Text(
                      "CREATE NEW ACCOUNT",
                    ),

                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(
                        double.infinity,
                        54,
                      ),

                      foregroundColor: primaryColor,

                      side: BorderSide(
                        color: primaryColor,
                        width: 1.5,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // SMALL FEATURES
            Row(
              children: [
                Expanded(
                  child: loginFeature(
                    Icons.verified,
                    "Trusted",
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: loginFeature(
                    Icons.lock,
                    "Secure",
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: loginFeature(
                    Icons.support_agent,
                    "24/7 Help",
                  ),
                ),
              ],
            ),

            SizedBox(height: 25),

            Text(
              "By continuing, you agree to our hotel terms and privacy policy.",
              textAlign: TextAlign.center,

              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 11,
              ),
            ),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// LOGIN FEATURE
// =====================================================

Widget loginFeature(
  IconData icon,
  String title,
) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 8,
    ),

    decoration: BoxDecoration(
      color: Colors.white,

      borderRadius: BorderRadius.circular(18),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(
            alpha: 0.05,
          ),
          blurRadius: 8,
        ),
      ],
    ),

    child: Column(
      children: [
        Icon(
          icon,
          color: primaryColor,
          size: 25,
        ),

        SizedBox(height: 7),

        Text(
          title,
          textAlign: TextAlign.center,

          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

// =====================================================
// MAIN NAVIGATION
// =====================================================

class MainNavigation extends StatefulWidget {
  final bool isDarkMode;

  final VoidCallback toggleTheme;

  final bool isLoggedIn;

  final String loggedUser;

  final Function(String) login;

  final VoidCallback logout;

  MainNavigation({
    required this.isDarkMode,
    required this.toggleTheme,
    required this.isLoggedIn,
    required this.loggedUser,
    required this.login,
    required this.logout,
  });

  @override
  State<MainNavigation> createState() =>
      MainNavigationState();
}

class MainNavigationState
    extends State<MainNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomePage(
        goToRooms: () {
          setState(() {
            currentIndex = 1;
          });
        },
      ),

      RoomPage(),

      SavedRoomsPage(),

      BookingsPage(),

      ProfilePage(
        isDarkMode: widget.isDarkMode,
        toggleTheme: widget.toggleTheme,
        isLoggedIn: widget.isLoggedIn,
        loggedUser: widget.loggedUser,
        login: widget.login,
        logout: widget.logout,
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor,

        indicatorColor:
            Theme.of(context)
                .colorScheme
                .primary
                .withValues(alpha: 0.15),

        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),

          NavigationDestination(
            icon: Icon(Icons.hotel_outlined),
            selectedIcon: Icon(Icons.hotel),
            label: "Rooms",
          ),

          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: "Saved",
          ),

          NavigationDestination(
            icon: Icon(
              Icons.receipt_long_outlined,
            ),
            selectedIcon: Icon(
              Icons.receipt_long,
            ),
            label: "Bookings",
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// =====================================================
// HOME PAGE
// =====================================================

class HomePage extends StatelessWidget {
  final VoidCallback goToRooms;

  HomePage({
    required this.goToRooms,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(7),

              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),

              child: Icon(
                Icons.hotel,
                color: Colors.white,
                size: 20,
              ),
            ),

            SizedBox(width: 9),

            Text(
              "ROYAL STAY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: goToRooms,
            icon: Icon(Icons.search),
          ),
        ],
      ),

      body: ListView(
        children: [
          // =================================================
          // HERO
          // =================================================

          Stack(
            children: [
              Container(
                height: 330,

                margin: EdgeInsets.all(15),

                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(25),

                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1566073771259-6a8506099945",
                    ),

                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                height: 330,

                margin: EdgeInsets.all(15),

                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(25),

                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,

                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 40,
                left: 32,
                right: 32,

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius:
                            BorderRadius.circular(20),
                      ),

                      child: Text(
                        "LUXURY HOTEL",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Royal Stay",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Luxury Experience Awaits",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // =================================================
          // WELCOME
          // =================================================

          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              children: [
                Text(
                  "Welcome to Royal Stay",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Experience comfort, elegance and exceptional hospitality in the heart of Mumbai.",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: goToRooms,

                  icon: Icon(Icons.hotel),

                  label: Text(
                    "EXPLORE ROOMS",
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // =================================================
          // QUICK BOOKING CARD
          // =================================================

          Container(
            margin:
                EdgeInsets.symmetric(horizontal: 15),

            padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor,
                  Color(0xFFA855F7),
                ],
              ),

              borderRadius:
                  BorderRadius.circular(22),

              boxShadow: [
                BoxShadow(
                  color: primaryColor.withValues(
                    alpha: 0.20,
                  ),
                  blurRadius: 15,
                  offset: Offset(0, 7),
                ),
              ],
            ),

            child: Row(
              children: [
                Container(
                  width: 55,
                  height: 55,

                  decoration: BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                    size: 28,
                  ),
                ),

                SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        "Plan Your Stay",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Find your perfect room today.",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // =================================================
          // FACILITIES
          // =================================================

          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 15),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  "Hotel Facilities",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Row(
                  children: [
                    facilityCard(
                      context,
                      Icons.wifi,
                      "Free Wi-Fi",
                    ),

                    facilityCard(
                      context,
                      Icons.pool,
                      "Swimming Pool",
                    ),

                    facilityCard(
                      context,
                      Icons.restaurant,
                      "Restaurant",
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // =================================================
          // SPECIAL OFFERS
          // =================================================

          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 15),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  "Special Offers",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        secondaryColor,
                        Color(0xFFFF8E53),
                      ],
                    ),

                    borderRadius:
                        BorderRadius.circular(22),

                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.orange.withValues(
                          alpha: 0.20,
                        ),
                        blurRadius: 15,
                        offset: Offset(0, 7),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      Container(
                        width: 58,
                        height: 58,

                        decoration:
                            BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          Icons.local_offer,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            Text(
                              "Weekend Special",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Get up to 20% OFF on selected rooms.",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // =================================================
          // EVERYTHING YOU NEED
          // =================================================

          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 15),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  "Everything You Need",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      child: serviceBox(
                        context,
                        Icons.local_parking,
                        "Free Parking",
                        Color(0xFFE0F2FE),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: serviceBox(
                        context,
                        Icons.room_service,
                        "Room Service",
                        Color(0xFFFFE4E6),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: serviceBox(
                        context,
                        Icons.wifi,
                        "High Speed Wi-Fi",
                        Color(0xFFDCFCE7),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: serviceBox(
                        context,
                        Icons.spa,
                        "Relax & Spa",
                        Color(0xFFEDE9FE),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // =================================================
          // GUEST EXPERIENCE
          // =================================================

          Container(
            margin:
                EdgeInsets.symmetric(horizontal: 15),

            padding: EdgeInsets.all(22),

            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,

              borderRadius:
                  BorderRadius.circular(22),
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  "What Our Guests Love",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 18),

                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Color(0xFFEDE9FE),

                      child: Icon(
                        Icons.person,
                        color: primaryColor,
                      ),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Amazing Experience",
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "★★★★★",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                Text(
                  "\"Beautiful rooms, friendly staff and a very comfortable stay. I would definitely visit again!\"",
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // =================================================
          // WHY ROYAL STAY
          // =================================================

          Container(
            margin:
                EdgeInsets.symmetric(horizontal: 15),

            padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,

              borderRadius:
                  BorderRadius.circular(20),
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  "Why Royal Stay?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                benefitRow(
                  Icons.verified,
                  "Comfortable Rooms",
                ),

                benefitRow(
                  Icons.security,
                  "Safe & Secure",
                ),

                benefitRow(
                  Icons.room_service,
                  "24/7 Hospitality",
                ),

                benefitRow(
                  Icons.location_on,
                  "Prime Location",
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // =================================================
          // FOOTER
          // =================================================

          Container(
            padding: EdgeInsets.all(25),

            color: Theme.of(context).brightness ==
                    Brightness.dark
                ? Color(0xFF211A30)
                : primaryColor,

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  "ROYAL STAY HOTEL",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "A comfortable place for your perfect stay.",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "📞 +91 98765 43210",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "✉ royalstay@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "📍 Mumbai, Maharashtra",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// FACILITY CARD
// =====================================================

Widget facilityCard(
  BuildContext context,
  IconData icon,
  String title,
) {
  return Expanded(
    child: Container(
      margin:
          EdgeInsets.symmetric(horizontal: 5),

      padding: EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,

        borderRadius:
            BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [
          Icon(
            icon,
            color: primaryColor,
            size: 30,
          ),

          SizedBox(height: 10),

          Text(
            title,
            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}

// =====================================================
// SERVICE BOX
// =====================================================

Widget serviceBox(
  BuildContext context,
  IconData icon,
  String title,
  Color backgroundColor,
) {
  return Container(
    padding: EdgeInsets.all(18),

    decoration: BoxDecoration(
      color: backgroundColor,

      borderRadius:
          BorderRadius.circular(18),
    ),

    child: Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: primaryColor,
        ),

        SizedBox(height: 10),

        Text(
          title,
          textAlign: TextAlign.center,

          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

// =====================================================
// BENEFIT ROW
// =====================================================

Widget benefitRow(
  IconData icon,
  String title,
) {
  return Padding(
    padding:
        EdgeInsets.symmetric(vertical: 8),

    child: Row(
      children: [
        Icon(
          icon,
          color: primaryColor,
        ),

        SizedBox(width: 12),

        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

// =====================================================
// ROOM PAGE
// =====================================================

class RoomPage extends StatefulWidget {
  @override
  State<RoomPage> createState() =>
      RoomPageState();
}

class RoomPageState extends State<RoomPage> {
  final List<Map<String, dynamic>> rooms = [
    {
      "name": "Deluxe Room",
      "price": "₹2500 / Night",
      "image":
          "https://images.unsplash.com/photo-1611892440504-42a792e24d32",
      "icon": Icons.king_bed,
    },
    {
      "name": "Premium Room",
      "price": "₹3500 / Night",
      "image":
          "https://images.unsplash.com/photo-1590490360182-c33d57733427",
      "icon": Icons.star,
    },
    {
      "name": "Family Room",
      "price": "₹4500 / Night",
      "image":
          "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b",
      "icon": Icons.family_restroom,
    },
    {
      "name": "Luxury Room",
      "price": "₹5500 / Night",
      "image":
          "https://images.unsplash.com/photo-1591088398332-8a7791972843",
      "icon": Icons.workspace_premium,
    },
  ];

  void toggleSaved(String roomName) {
    setState(() {
      if (savedRooms.contains(roomName)) {
        savedRooms.remove(roomName);
      } else {
        savedRooms.add(roomName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Rooms",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(15),

        children: [
          Text(
            "Choose Your Room",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5),

          Text(
            "Find a room that fits your stay.",
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),

          SizedBox(height: 20),

          ...rooms.map(
            (roomData) {
              return roomCard(
                context,
                roomData,
                toggleSaved,
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}

// =====================================================
// ROOM CARD
// =====================================================

Widget roomCard(
  BuildContext context,
  Map<String, dynamic> roomData,
  Function(String) toggleSaved,
) {
  String name = roomData["name"];

  String price = roomData["price"];

  bool isSaved =
      savedRooms.contains(name);

  return Container(
    margin:
        EdgeInsets.only(bottom: 20),

    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,

      borderRadius:
          BorderRadius.circular(22),

      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),

    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.only(
                topLeft:
                    Radius.circular(22),
                topRight:
                    Radius.circular(22),
              ),

              child: Image.network(
                roomData["image"],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,

                errorBuilder:
                    (context, error, stack) {
                  return Container(
                    height: 200,
                    color: Color(0xFFEDE9FE),
                    child: Icon(
                      Icons.hotel,
                      size: 60,
                      color: primaryColor,
                    ),
                  );
                },
              ),
            ),

            Positioned(
              top: 12,
              right: 12,

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),

                child: IconButton(
                  onPressed: () {
                    toggleSaved(name);
                  },

                  icon: Icon(
                    isSaved
                        ? Icons.favorite
                        : Icons.favorite_border,

                    color: isSaved
                        ? Colors.red
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  Container(
                    padding:
                        EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: Color(0xFFEDE9FE),
                      borderRadius:
                          BorderRadius.circular(20),
                    ),

                    child: Text(
                      price,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              Text(
                "Comfortable • Spacious • Premium",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

              SizedBox(height: 15),

              ElevatedButton.icon(
                onPressed: () {
                  selectedRoom = name;

                  selectedPrice = price;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BookingPage(),
                    ),
                  );
                },

                icon: Icon(
                  Icons.calendar_month,
                ),

                label: Text("BOOK NOW"),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// =====================================================
// SAVED ROOMS
// =====================================================

class SavedRoomsPage extends StatefulWidget {
  @override
  State<SavedRoomsPage> createState() =>
      SavedRoomsPageState();
}

class SavedRoomsPageState
    extends State<SavedRoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved Rooms",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: savedRooms.isEmpty
          ? Center(
              child: Padding(
                padding: EdgeInsets.all(30),

                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 80,
                      color: Colors.grey,
                    ),

                    SizedBox(height: 20),

                    Text(
                      "No Saved Rooms",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Tap the heart icon on a room to save it here.",
                      textAlign:
                          TextAlign.center,

                      style: TextStyle(
                        color:
                            Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(15),

              itemCount: savedRooms.length,

              itemBuilder:
                  (context, index) {
                String room =
                    savedRooms[index];

                String price =
                    getRoomPrice(room);

                String image =
                    getRoomImage(room);

                return Card(
                  margin:
                      EdgeInsets.only(bottom: 15),

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      18,
                    ),
                  ),

                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(
                          topLeft:
                              Radius.circular(
                            18,
                          ),
                          topRight:
                              Radius.circular(
                            18,
                          ),
                        ),

                        child: Image.network(
                          image,
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover,

                          errorBuilder:
                              (context, error, stack) {
                            return Container(
                              height: 160,
                              color:
                                  Color(0xFFEDE9FE),
                              child: Icon(
                                Icons.hotel,
                                size: 55,
                                color:
                                    primaryColor,
                              ),
                            );
                          },
                        ),
                      ),

                      ListTile(
                        contentPadding:
                            EdgeInsets.all(15),

                        title: Text(
                          room,
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),

                        subtitle: Text(price),

                        trailing:
                            IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),

                          onPressed: () {
                            setState(() {
                              savedRooms
                                  .remove(room);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

// =====================================================
// ROOM PRICE
// =====================================================

String getRoomPrice(String room) {
  switch (room) {
    case "Premium Room":
      return "₹3500 / Night";

    case "Family Room":
      return "₹4500 / Night";

    case "Luxury Room":
      return "₹5500 / Night";

    default:
      return "₹2500 / Night";
  }
}

// =====================================================
// ROOM IMAGE
// =====================================================

String getRoomImage(String room) {
  switch (room) {
    case "Premium Room":
      return "https://images.unsplash.com/photo-1590490360182-c33d57733427";

    case "Family Room":
      return "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b";

    case "Luxury Room":
      return "https://images.unsplash.com/photo-1591088398332-8a7791972843";

    default:
      return "https://images.unsplash.com/photo-1611892440504-42a792e24d32";
  }
}

// =====================================================
// MY BOOKINGS
// =====================================================

class BookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bookings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: bookings.isEmpty
          ? Center(
              child: Padding(
                padding: EdgeInsets.all(30),

                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 80,
                      color: Colors.grey,
                    ),

                    SizedBox(height: 20),

                    Text(
                      "No Bookings Yet",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Your confirmed hotel bookings will appear here.",
                      textAlign:
                          TextAlign.center,

                      style: TextStyle(
                        color:
                            Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(15),

              itemCount: bookings.length,

              itemBuilder:
                  (context, index) {
                Map<String, String> booking =
                    bookings[index];

                return Card(
                  margin:
                      EdgeInsets.only(bottom: 15),

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      18,
                    ),
                  ),

                  child: Padding(
                    padding:
                        EdgeInsets.all(18),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,

                          children: [
                            Expanded(
                              child: Text(
                                booking["room"]!,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),

                            Container(
                              padding:
                                  EdgeInsets
                                      .symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),

                              decoration:
                                  BoxDecoration(
                                color: Colors.green
                                    .shade100,

                                borderRadius:
                                    BorderRadius
                                        .circular(
                                  20,
                                ),
                              ),

                              child: Text(
                                "CONFIRMED",
                                style: TextStyle(
                                  color: Colors
                                      .green
                                      .shade800,
                                  fontSize: 11,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15),

                        Text(
                          "Booking ID: ${booking["id"]}",
                          style: TextStyle(
                            color: Colors
                                .grey
                                .shade600,
                          ),
                        ),

                        SizedBox(height: 10),

                        Divider(),

                        SizedBox(height: 10),

                        Text(
                          "Guest: ${booking["name"]}",
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Check-in: ${booking["checkIn"]}",
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Check-out: ${booking["checkOut"]}",
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Guests: ${booking["guests"]}",
                        ),

                        SizedBox(height: 10),

                        Text(
                          booking["price"]!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                            color:
                                primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// =====================================================
// PROFILE PAGE
// =====================================================

class ProfilePage extends StatefulWidget {
  final bool isDarkMode;

  final VoidCallback toggleTheme;

  final bool isLoggedIn;

  final String loggedUser;

  final Function(String) login;

  final VoidCallback logout;

  ProfilePage({
    required this.isDarkMode,
    required this.toggleTheme,
    required this.isLoggedIn,
    required this.loggedUser,
    required this.login,
    required this.logout,
  });

  @override
  State<ProfilePage> createState() =>
      ProfilePageState();
}

class ProfilePageState
    extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(20),

        children: [
          // =================================================
          // PROFILE HEADER
          // =================================================

          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 55,

                  backgroundColor:
                      Color(0xFFEDE9FE),

                  child: Icon(
                    profileIcons[
                        selectedProfileIcon],

                    size: 58,

                    color: primaryColor,
                  ),
                ),

                SizedBox(height: 10),

                TextButton.icon(
                  onPressed: () {
                    showProfileIconDialog(
                      context,
                      () {
                        setState(() {});
                      },
                    );
                  },

                  icon: Icon(Icons.edit),

                  label: Text(
                    "Change Profile Icon",
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  widget.isLoggedIn
                      ? widget.loggedUser
                      : "Guest User",

                  style: TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  widget.isLoggedIn
                      ? "Welcome back!"
                      : "Login to manage your bookings",

                  style: TextStyle(
                    color:
                        Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          // =================================================
          // LOGIN / LOGOUT
          // =================================================

          if (!widget.isLoggedIn)
            ElevatedButton.icon(
              onPressed: () {
                showLoginDialog(
                  context,
                  widget.login,
                );
              },

              icon: Icon(Icons.login),

              label: Text("LOGIN"),
            )
          else
            OutlinedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,

                  builder: (context) {
                    return AlertDialog(
                      title: Text("Logout"),

                      content: Text(
                        "Are you sure you want to logout?",
                      ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            );
                          },

                          child:
                              Text("CANCEL"),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            );

                            widget.logout();
                          },

                          child:
                              Text("LOGOUT"),
                        ),
                      ],
                    );
                  },
                );
              },

              icon: Icon(Icons.logout),

              label: Text("LOGOUT"),

              style: OutlinedButton
                  .styleFrom(
                minimumSize:
                    Size(double.infinity, 54),

                foregroundColor:
                    secondaryColor,

                side: BorderSide(
                  color: secondaryColor,
                ),
              ),
            ),

          SizedBox(height: 25),

          // =================================================
          // SETTINGS
          // =================================================

          Text(
            "Settings",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Card(
            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(18),
            ),

            child: Column(
              children: [
                SwitchListTile(
                  secondary: Icon(
                    widget.isDarkMode
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),

                  title: Text(
                    "Dark Mode",
                  ),

                  subtitle: Text(
                    widget.isDarkMode
                        ? "Dark theme enabled"
                        : "Light theme enabled",
                  ),

                  value: widget.isDarkMode,

                  activeColor:
                      primaryColor,

                  onChanged: (value) {
                    widget.toggleTheme();
                  },
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),

                  title: Text(
                    "Saved Rooms",
                  ),

                  trailing: Text(
                    "${savedRooms.length}",

                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(
                    Icons.receipt_long,
                  ),

                  title: Text(
                    "My Bookings",
                  ),

                  trailing: Text(
                    "${bookings.length}",

                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          // =================================================
          // APP INFORMATION
          // =================================================

          Card(
            child: Padding(
              padding:
                  EdgeInsets.all(18),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    "Royal Stay Hotel",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Hotel Booking Application",
                    style: TextStyle(
                      color:
                          Colors.grey.shade600,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Version 1.0.0",
                    style: TextStyle(
                      color:
                          Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// LOGIN DIALOG
// =====================================================

void showLoginDialog(
  BuildContext context,
  Function(String) login,
) {
  TextEditingController nameController =
      TextEditingController();

  TextEditingController emailController =
      TextEditingController();

  showDialog(
    context: context,

    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20),
        ),

        title: Row(
          children: [
            Icon(
              Icons.hotel,
              color: primaryColor,
            ),

            SizedBox(width: 10),

            Text("Login"),
          ],
        ),

        content: Column(
          mainAxisSize:
              MainAxisSize.min,

          children: [
            TextField(
              controller:
                  nameController,

              decoration:
                  InputDecoration(
                labelText: "Your Name",
                prefixIcon:
                    Icon(Icons.person),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller:
                  emailController,

              keyboardType:
                  TextInputType.emailAddress,

              decoration:
                  InputDecoration(
                labelText: "Email",
                prefixIcon:
                    Icon(Icons.email),
              ),
            ),
          ],
        ),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },

            child: Text("CANCEL"),
          ),

          ElevatedButton(
            onPressed: () {
              if (nameController.text
                  .trim()
                  .isEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Please enter your name",
                    ),
                  ),
                );

                return;
              }

              login(
                nameController.text
                    .trim(),
              );

              Navigator.pop(context);
            },

            child: Text("LOGIN"),
          ),
        ],
      );
    },
  );
}

// =====================================================
// SIGN UP DIALOG
// =====================================================

void showSignupDialog(
  BuildContext context,
  Function(String) login,
) {
  TextEditingController nameController =
      TextEditingController();

  TextEditingController emailController =
      TextEditingController();

  TextEditingController phoneController =
      TextEditingController();

  TextEditingController passwordController =
      TextEditingController();

  showDialog(
    context: context,

    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(22),
        ),

        title: Row(
          children: [
            Icon(
              Icons.person_add,
              color: primaryColor,
            ),

            SizedBox(width: 10),

            Text("Create Account"),
          ],
        ),

        content: SingleChildScrollView(
          child: Column(
            mainAxisSize:
                MainAxisSize.min,

            children: [
              TextField(
                controller:
                    nameController,

                decoration:
                    InputDecoration(
                  labelText: "Full Name",
                  prefixIcon:
                      Icon(Icons.person),
                ),
              ),

              SizedBox(height: 12),

              TextField(
                controller:
                    emailController,

                keyboardType:
                    TextInputType.emailAddress,

                decoration:
                    InputDecoration(
                  labelText: "Email",
                  prefixIcon:
                      Icon(Icons.email),
                ),
              ),

              SizedBox(height: 12),

              TextField(
                controller:
                    phoneController,

                keyboardType:
                    TextInputType.phone,

                decoration:
                    InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon:
                      Icon(Icons.phone),
                ),
              ),

              SizedBox(height: 12),

              TextField(
                controller:
                    passwordController,

                obscureText: true,

                decoration:
                    InputDecoration(
                  labelText: "Password",
                  prefixIcon:
                      Icon(Icons.lock),
                ),
              ),
            ],
          ),
        ),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },

            child: Text("CANCEL"),
          ),

          ElevatedButton(
            onPressed: () {
              if (nameController.text
                      .trim()
                      .isEmpty ||
                  emailController.text
                      .trim()
                      .isEmpty ||
                  passwordController.text
                      .trim()
                      .isEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Please fill required details",
                    ),
                  ),
                );

                return;
              }

              login(
                nameController.text
                    .trim(),
              );

              Navigator.pop(context);
            },

            child: Text("SIGN UP"),
          ),
        ],
      );
    },
  );
}

// =====================================================
// PROFILE ICON SELECTOR
// =====================================================

void showProfileIconDialog(
  BuildContext context,
  VoidCallback refresh,
) {
  showDialog(
    context: context,

    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(22),
        ),

        title: Text(
          "Choose Profile Icon",
          style: TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),

        content: SizedBox(
          width: double.maxFinite,

          child: Wrap(
            alignment:
                WrapAlignment.center,

            spacing: 15,

            runSpacing: 15,

            children: List.generate(
              profileIcons.length,

              (index) {
                return GestureDetector(
                  onTap: () {
                    selectedProfileIcon =
                        index;

                    Navigator.pop(
                      context,
                    );

                    refresh();
                  },

                  child: Container(
                    width: 60,
                    height: 60,

                    decoration:
                        BoxDecoration(
                      color: index ==
                              selectedProfileIcon
                          ? Color(
                              0xFFEDE9FE,
                            )
                          : Colors
                              .grey
                              .shade100,

                      shape:
                          BoxShape.circle,

                      border: Border.all(
                        color: index ==
                                selectedProfileIcon
                            ? primaryColor
                            : Colors
                                .transparent,

                        width: 2,
                      ),
                    ),

                    child: Icon(
                      profileIcons[index],

                      size: 30,

                      color:
                          primaryColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}

// =====================================================
// BOOKING PAGE
// =====================================================

class BookingPage
    extends StatefulWidget {
  @override
  State<BookingPage> createState() =>
      BookingPageState();
}

class BookingPageState
    extends State<BookingPage> {
  TextEditingController nameController =
      TextEditingController();

  TextEditingController phoneController =
      TextEditingController();

  TextEditingController checkInController =
      TextEditingController();

  TextEditingController checkOutController =
      TextEditingController();

  String guests = "1";

  String payment = "Cash";

  bool agreement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking Details",
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(20),

        children: [
          // =================================================
          // ROOM SUMMARY
          // =================================================

          Container(
            padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor,
                  Color(0xFFA855F7),
                ],
              ),

              borderRadius:
                  BorderRadius.circular(20),
            ),

            child: Row(
              children: [
                Icon(
                  Icons.hotel,
                  color: Colors.white,
                  size: 40,
                ),

                SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        selectedRoom,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        selectedPrice,
                        style: TextStyle(
                          color:
                              Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          Text(
            "Guest Information",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller: nameController,

            decoration:
                InputDecoration(
              hintText:
                  "Enter your name",

              prefixIcon:
                  Icon(Icons.person),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller: phoneController,

            keyboardType:
                TextInputType.phone,

            decoration:
                InputDecoration(
              hintText:
                  "Enter phone number",

              prefixIcon:
                  Icon(Icons.phone),
            ),
          ),

          SizedBox(height: 25),

          Text(
            "Stay Details",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller:
                checkInController,

            decoration:
                InputDecoration(
              hintText:
                  "Enter check-in date",

              prefixIcon:
                  Icon(Icons.login),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller:
                checkOutController,

            decoration:
                InputDecoration(
              hintText:
                  "Enter check-out date",

              prefixIcon:
                  Icon(Icons.logout),
            ),
          ),

          SizedBox(height: 15),

          Container(
            padding:
                EdgeInsets.symmetric(
              horizontal: 15,
            ),

            decoration:
                BoxDecoration(
              color:
                  Theme.of(context)
                      .cardColor,

              borderRadius:
                  BorderRadius.circular(
                15,
              ),
            ),

            child:
                DropdownButtonHideUnderline(
              child:
                  DropdownButton<String>(
                value: guests,

                isExpanded: true,

                items: [
                  DropdownMenuItem(
                    value: "1",
                    child:
                        Text("1 Guest"),
                  ),

                  DropdownMenuItem(
                    value: "2",
                    child:
                        Text("2 Guests"),
                  ),

                  DropdownMenuItem(
                    value: "3",
                    child:
                        Text("3 Guests"),
                  ),

                  DropdownMenuItem(
                    value: "4",
                    child:
                        Text("4 Guests"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    guests = value!;
                  });
                },
              ),
            ),
          ),

          SizedBox(height: 30),

          Text(
            "Payment Method",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          RadioListTile<String>(
            title: Text("Cash"),

            secondary:
                Icon(Icons.money),

            value: "Cash",

            groupValue: payment,

            onChanged: (value) {
              setState(() {
                payment = value!;
              });
            },
          ),

          RadioListTile<String>(
            title: Text("UPI"),

            secondary:
                Icon(Icons.qr_code),

            value: "UPI",

            groupValue: payment,

            onChanged: (value) {
              setState(() {
                payment = value!;
              });
            },
          ),

          RadioListTile<String>(
            title: Text("Card"),

            secondary:
                Icon(Icons.credit_card),

            value: "Card",

            groupValue: payment,

            onChanged: (value) {
              setState(() {
                payment = value!;
              });
            },
          ),

          SizedBox(height: 10),

          CheckboxListTile(
            title: Text(
              "I agree to the hotel booking terms.",
            ),

            value: agreement,

            onChanged: (value) {
              setState(() {
                agreement = value!;
              });
            },
          ),

          SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {
              if (nameController.text
                      .trim()
                      .isEmpty ||
                  phoneController.text
                      .trim()
                      .isEmpty ||
                  checkInController.text
                      .trim()
                      .isEmpty ||
                  checkOutController.text
                      .trim()
                      .isEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Please enter all details",
                    ),
                  ),
                );
              } else if (!agreement) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Please accept the terms",
                    ),
                  ),
                );
              } else {
                customerName =
                    nameController.text;

                customerPhone =
                    phoneController.text;

                checkInDate =
                    checkInController.text;

                checkOutDate =
                    checkOutController.text;

                customerGuests =
                    guests;

                customerPayment =
                    payment;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BookingSummaryPage(),
                  ),
                );
              }
            },

            icon: Icon(
              Icons.receipt_long,
            ),

            label: Text(
              "VIEW BOOKING SUMMARY",
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// BOOKING SUMMARY
// =====================================================

class BookingSummaryPage
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking Summary",
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(20),

        children: [
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.hotel,
                  size: 55,
                  color: primaryColor,
                ),

                SizedBox(height: 10),

                Text(
                  "Review Your Booking",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          summaryTile(
            Icons.person,
            "Customer",
            customerName,
          ),

          summaryTile(
            Icons.phone,
            "Phone",
            customerPhone,
          ),

          summaryTile(
            Icons.hotel,
            "Room",
            selectedRoom,
          ),

          summaryTile(
            Icons.currency_rupee,
            "Price",
            selectedPrice,
          ),

          summaryTile(
            Icons.people,
            "Guests",
            customerGuests,
          ),

          summaryTile(
            Icons.login,
            "Check-in",
            checkInDate,
          ),

          summaryTile(
            Icons.logout,
            "Check-out",
            checkOutDate,
          ),

          summaryTile(
            Icons.payment,
            "Payment",
            customerPayment,
          ),

          SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,

                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Confirm Booking",
                    ),

                    content: Text(
                      "Do you want to confirm your hotel booking?",
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },

                        child:
                            Text("CANCEL"),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          currentBookingId =
                              "RS2026${DateTime.now().millisecondsSinceEpoch % 10000}";

                          bookings.add({
                            "id":
                                currentBookingId,

                            "name":
                                customerName,

                            "room":
                                selectedRoom,

                            "price":
                                selectedPrice,

                            "checkIn":
                                checkInDate,

                            "checkOut":
                                checkOutDate,

                            "guests":
                                customerGuests,
                          });

                          Navigator.pop(
                            context,
                          );

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      OrderSuccessPage(
                                bookingId:
                                    currentBookingId,
                              ),
                            ),
                          );
                        },

                        child:
                            Text("CONFIRM"),
                      ),
                    ],
                  );
                },
              );
            },

            icon: Icon(Icons.check),

            label: Text(
              "CONFIRM BOOKING",
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// SUMMARY TILE
// =====================================================

Widget summaryTile(
  IconData icon,
  String title,
  String value,
) {
  return Card(
    margin:
        EdgeInsets.only(bottom: 10),

    child: ListTile(
      leading: Icon(
        icon,
        color: primaryColor,
      ),

      title: Text(
        title,

        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade600,
        ),
      ),

      subtitle: Text(
        value,

        style: TextStyle(
          fontSize: 17,
          fontWeight:
              FontWeight.w600,
        ),
      ),
    ),
  );
}

// =====================================================
// SUCCESS PAGE
// =====================================================

class OrderSuccessPage
    extends StatelessWidget {
  final String bookingId;

  OrderSuccessPage({
    required this.bookingId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking Successful",
        ),
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [
              CircleAvatar(
                radius: 60,

                backgroundColor:
                    Colors.green.shade100,

                child: Icon(
                  Icons.check,
                  size: 75,
                  color: Colors.green,
                ),
              ),

              SizedBox(height: 25),

              Text(
                "Booking Confirmed!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight:
                      FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Your stay at Royal Stay Hotel has been confirmed.",

                textAlign:
                    TextAlign.center,
              ),

              SizedBox(height: 25),

              Container(
                width: double.infinity,

                padding:
                    EdgeInsets.all(20),

                decoration:
                    BoxDecoration(
                  color: Theme.of(context)
                      .cardColor,

                  borderRadius:
                      BorderRadius.circular(
                    20,
                  ),
                ),

                child: Column(
                  children: [
                    Text(
                      "BOOKING ID",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight:
                            FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      bookingId,

                      style: TextStyle(
                        fontSize: 23,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            primaryColor,
                      ),
                    ),

                    SizedBox(height: 10),

                    Divider(),

                    SizedBox(height: 10),

                    Text(
                      selectedRoom,

                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    Text(
                      selectedPrice,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (route) =>
                        route.isFirst,
                  );
                },

                icon: Icon(
                  Icons.home,
                ),

                label: Text(
                  "BACK TO HOME",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
