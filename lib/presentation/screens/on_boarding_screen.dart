import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes.dart';
import 'package:flutter_application_1/core/local_storage/base_local_storage.dart';
import 'package:flutter_application_1/core/constant/local_keys.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/domain/models/onBoarding/on_boarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this._localStorage});

  final BaseLocalStorage _localStorage;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnBoardingItem> _pages = const [
    OnBoardingItem(
      image: 'assets/images/jewelry.png',
      title: 'Discover Your Style',
      description:
          'Explore a beautiful collection of rings, necklaces, bracelets, charms, and more—made to match your unique style.',
    ),
    OnBoardingItem(
      image: 'assets/images/search_7566670.png',
      title: 'Find Your Perfect Accessory',
      description:
          'Browse our collection, discover your favorites, and easily find accessories that complete every look.',
    ),
    OnBoardingItem(
      image: 'assets/images/tap.png',
      title: 'Shop With Ease',
      description: 'Enjoy a simple and seamless shopping experience. Choose your favorite accessories and order them with just a few taps.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  Future<void> _skip() async {
    // _pageController.animateToPage(
    //   _pages.length - 1,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeInOut,
    // );
    await widget._localStorage.setBool(LocalKeys.isOpen, true);
    context.pushNamed(Routes.homeScreen);
  }

  Future<void> _finishOnboarding() async {
    await widget._localStorage.setBool(LocalKeys.isOpen, true);
    context.pushNamed(Routes.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: TextButton(
                  onPressed: _currentPage == _pages.length - 1 ? null : _skip,
                  child: const Text('Skip'),
                ),
              ),
            ),

            // Pages
            Expanded(
              child: PageView.builder( //bat5alini scroll the images with their description according to the index
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Center(
                            child: Image.asset(page.image, fit: BoxFit.contain),
                          ),
                        ),

                        const SizedBox(height: 24),

                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey.shade600,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                final isActive = index == _currentPage;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isActive
                        ? theme.colorScheme.primary
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),

            const SizedBox(height: 32),

            // Next / Get Started
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton(
                  onPressed: _nextPage,
                  child: Text(
                    _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
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