import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_application_1/core/cubit/theme/theme_cubit.dart';
import 'package:flutter_application_1/core/cubit/theme/theme_state.dart';
import 'package:flutter_application_1/app/routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotifications = true;
  bool refreshAutomatically = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // =========================
          // PROFILE SETTINGS
          // =========================

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
            child: Text(
              "Profile Settings",
              style: TextStyle(
                color: colors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Edit Profile
          _settingsButton(
            context,
            title: "Edit Profile",
            onPressed: () {
              // No navigation for now
            },
          ),

          // Change Password
          _settingsButton(
            context,
            title: "Change Password",
            onPressed: () {
              // No navigation for now
            },
          ),

          // =========================
          // PUSH NOTIFICATIONS
          // =========================

          _settingsSwitch(
            context,
            title: "Send Push Notifications",
            value: pushNotifications,
            onChanged: (value) {
              setState(() {
                pushNotifications = value;
              });
            },
          ),

          // =========================
          // AUTO REFRESH
          // =========================

          _settingsSwitch(
            context,
            title: "Refresh automatically",
            value: refreshAutomatically,
            onChanged: (value) {
              setState(() {
                refreshAutomatically = value;
              });
            },
          ),

          // =========================
          // DARK MODE
          // =========================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: colors.tertiary.withOpacity(0.5),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    color: colors.secondary,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                // Dark mode switch
                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return Switch(
                      value: state.isDark,
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                      activeColor: colors.primary,
                    );
                  },
                ),
              ],
            ),
          ),

          const Spacer(),

          // =========================
          // LOG OUT
          // =========================

          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  context.goNamed(Routes.homeScreen);
                },
                icon: const Icon(Icons.logout),
                label: const Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // NORMAL SETTINGS BUTTON
  // =========================

  Widget _settingsButton(
    BuildContext context, {
    required String title,
    required VoidCallback onPressed,
  }) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: colors.tertiary.withOpacity(0.5),
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: colors.secondary,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  // =========================
  // SWITCH SETTING
  // =========================

  Widget _settingsSwitch(
    BuildContext context, {
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colors.tertiary.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: colors.secondary,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: colors.primary,
          ),
        ],
      ),
    );
  }
}