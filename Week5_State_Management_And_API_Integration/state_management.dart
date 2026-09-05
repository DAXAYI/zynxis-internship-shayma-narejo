import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';

class StateManagementPage extends StatefulWidget {
  const StateManagementPage({super.key});

  @override
  State<StateManagementPage> createState() =>
      _StateManagementPageState();
}

class _StateManagementPageState
    extends State<StateManagementPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        context.watch<AppState>().isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'State Management',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: IndexedStack(
        index: currentIndex,
        children: const [
          CounterTab(),
          ThemeTab(),
        ],
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.exposure_plus_1_outlined,
            ),
            selectedIcon: Icon(
              Icons.exposure_plus_1,
            ),
            label: 'Counter',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.palette_outlined,
            ),
            selectedIcon: Icon(
              Icons.palette,
            ),
            label: 'Theme',
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   COUNTER TAB
   ========================================================= */

class CounterTab extends StatelessWidget {
  const CounterTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final bool isDarkMode =
        appState.isDarkMode;

    final Color cardColor = isDarkMode
        ? const Color(0xFF1E293B)
        : Colors.white;

    final Color secondaryText = isDarkMode
        ? const Color(0xFF94A3B8)
        : const Color(0xFF475569);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              'COUNTER',
              style: TextStyle(
                fontSize: 13,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                color: secondaryText,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Shared Counter',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'The counter value remains the same when you switch between tabs.',
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: secondaryText,
              ),
            ),

            const SizedBox(height: 35),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius:
                BorderRadius.circular(22),
                border: Border.all(
                  color: isDarkMode
                      ? const Color(0xFF334155)
                      : const Color(0xFFCBD5E1),
                ),
              ),

              child: Column(
                children: [
                  Text(
                    'Current Count',
                    style: TextStyle(
                      fontSize: 16,
                      color: secondaryText,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    '${appState.counter}',
                    style: const TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 32),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed:
                          appState.decrementCounter,
                          icon:
                          const Icon(Icons.remove),
                          label:
                          const Text('Decrease'),
                          style:
                          ElevatedButton.styleFrom(
                            padding:
                            const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed:
                          appState.incrementCounter,
                          icon:
                          const Icon(Icons.add),
                          label:
                          const Text('Increase'),
                          style:
                          ElevatedButton.styleFrom(
                            padding:
                            const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        appState.resetCounter();

                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Counter reset to 0.',
                            ),
                          ),
                        );
                      },
                      icon:
                      const Icon(Icons.refresh),
                      label:
                      const Text('Reset Counter'),
                      style:
                      OutlinedButton.styleFrom(
                        padding:
                        const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius:
                BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Text(
                      'Increase the counter, move to the Theme tab, then return here. The number will still be ${appState.counter}.',
                      style: TextStyle(
                        height: 1.5,
                        color: secondaryText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* =========================================================
   THEME TAB
   ========================================================= */

class ThemeTab extends StatelessWidget {
  const ThemeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final bool isDarkMode =
        appState.isDarkMode;

    final Color cardColor = isDarkMode
        ? const Color(0xFF1E293B)
        : Colors.white;

    final Color secondaryText = isDarkMode
        ? const Color(0xFF94A3B8)
        : const Color(0xFF475569);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              'THEME',
              style: TextStyle(
                fontSize: 13,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                color: secondaryText,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Theme Switcher',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Change the appearance of the application using shared Provider state.',
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: secondaryText,
              ),
            ),

            const SizedBox(height: 35),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius:
                BorderRadius.circular(20),
                border: Border.all(
                  color: isDarkMode
                      ? const Color(0xFF334155)
                      : const Color(0xFFCBD5E1),
                ),
              ),

              child: Row(
                children: [
                  Container(
                    padding:
                    const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xFF334155)
                          : const Color(0xFFE2E8F0),
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                    child: Icon(
                      isDarkMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          isDarkMode
                              ? 'Dark Mode'
                              : 'Light Mode',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          isDarkMode
                              ? 'Dark theme is currently active.'
                              : 'Light theme is currently active.',
                          style: TextStyle(
                            fontSize: 13,
                            color: secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Switch(
                    value:
                    appState.isDarkMode,
                    onChanged: (value) {
                      appState.toggleTheme(
                        value,
                      );

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
                        SnackBar(
                          content: Text(
                            value
                                ? 'Dark theme enabled.'
                                : 'Light theme enabled.',
                          ),
                          duration:
                          const Duration(
                            seconds: 1,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius:
                BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Shared State Test',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Counter value from the other tab:',
                    style: TextStyle(
                      color: secondaryText,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    '${appState.counter}',
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'This proves both tabs are reading from the same Provider state.',
                    style: TextStyle(
                      height: 1.5,
                      color: secondaryText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}