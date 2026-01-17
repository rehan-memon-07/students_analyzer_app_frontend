import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: responsivePadding,
          child: Column(
            children: [
              // Account Section
              _SettingsSection(
                title: 'ACCOUNT',
                children: [
                  _SettingsTile(
                    icon: Icons.person,
                    title: 'Student Account',
                    subtitle: 'Manage your personal info',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Account settings - TODO')),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 24),
              ),
              // Preferences Section
              _SettingsSection(
                title: 'PREFERENCES',
                children: [
                  _SettingsToggleTile(
                    icon: Icons.dark_mode,
                    title: 'Dark Mode',
                    value: false,
                    onChanged: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Dark mode ${value ? 'enabled' : 'disabled'}')),
                      );
                    },
                  ),
                  _SettingsToggleTile(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    value: true,
                    onChanged: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Notifications ${value ? 'enabled' : 'disabled'}')),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 24),
              ),
              // Data Section
              _SettingsSection(
                title: 'DATA',
                children: [
                  _SettingsTile(
                    icon: Icons.download,
                    title: 'Download My Data',
                    subtitle: 'Export your profile and progress',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Exporting data...')),
                      );
                    },
                  ),
                  _SettingsTile(
                    icon: Icons.delete,
                    title: 'Delete Account',
                    subtitle: 'Permanently delete your account',
                    textColor: Colors.red,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Account?'),
                          content: const Text(
                            'This action cannot be undone. All your data will be permanently deleted.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Account deletion - TODO')),
                                );
                              },
                              child: const Text('Delete',
                                  style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 24),
              ),
              // About Section
              _SettingsSection(
                title: 'ABOUT',
                children: [
                  _SettingsTile(
                    icon: Icons.help,
                    title: 'Help & Support',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Help & Support - TODO')),
                      );
                    },
                  ),
                  _SettingsTile(
                    icon: Icons.description,
                    title: 'Terms of Service',
                    onTap: () {},
                  ),
                  _SettingsTile(
                    icon: Icons.privacy_tip,
                    title: 'Privacy Policy',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 24),
              ),
              // Logout Section
              _SettingsSection(
                title: '',
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withOpacity(0.1),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Logout?'),
                            content: const Text(
                                'Are you sure you want to logout?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  context.go('/auth');
                                },
                                child: const Text('Logout',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Log Out',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.neutralGray,
              fontWeight: FontWeight.w600,
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
            ),
          ),
        if (title.isNotEmpty)
          SizedBox(
            height: ResponsiveHelper.getResponsiveSpacing(context, 12),
          ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.borderGray),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color? textColor;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(
          ResponsiveHelper.getResponsiveSpacing(context, 16),
        ),
        child: Row(
          children: [
            Icon(icon, color: textColor ?? AppTheme.primaryBlue, size: 24),
            SizedBox(
              width: ResponsiveHelper.getResponsiveSpacing(context, 16),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 4),
                    ),
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.neutralGray,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(Icons.arrow_forward,
                color: AppTheme.borderGray,
                size: ResponsiveHelper.getResponsiveFontSize(context, 20)),
          ],
        ),
      ),
    );
  }
}

class _SettingsToggleTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const _SettingsToggleTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  State<_SettingsToggleTile> createState() => _SettingsToggleTileState();
}

class _SettingsToggleTileState extends State<_SettingsToggleTile> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        ResponsiveHelper.getResponsiveSpacing(context, 16),
      ),
      child: Row(
        children: [
          Icon(widget.icon, color: AppTheme.primaryBlue, size: 24),
          SizedBox(
            width: ResponsiveHelper.getResponsiveSpacing(context, 16),
          ),
          Expanded(
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
              ),
            ),
          ),
          Switch(
            value: _value,
            onChanged: (value) {
              setState(() => _value = value);
              widget.onChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
