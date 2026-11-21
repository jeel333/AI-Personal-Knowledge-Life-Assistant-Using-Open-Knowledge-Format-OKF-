
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../widgets/app_card.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<int> onNavigate;

  const HomeScreen({
    super.key,
    required this.onNavigate,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Complete project plan',
      'priority': 'High',
      'done': false,
    },
    {
      'title': 'Review exam notes',
      'priority': 'Medium',
      'done': false,
    },
    {
      'title': 'Update travel itinerary',
      'priority': 'Low',
      'done': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          _buildHeader(),
          const SizedBox(height: 32),
          const Text(
            'Good morning, Jeel 👋',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Your personal AI life assistant',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 26),
          _buildAiBanner(),
          const SizedBox(height: 28),
          _buildQuickActions(),
          const SizedBox(height: 32),
          _buildSectionTitle('Today', Icons.today_outlined),
          const SizedBox(height: 14),
          _buildTasks(),
          const SizedBox(height: 30),
          _buildSectionTitle(
            'Upcoming Events',
            Icons.calendar_month_outlined,
            action: 'View All',
            onAction: () => widget.onNavigate(2),
          ),
          const SizedBox(height: 14),
          _buildEventCard(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(
            Icons.auto_awesome,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'Life Assistant',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Notifications coming soon'),
              ),
            );
          },
          icon: const Icon(Icons.notifications_none_rounded),
        ),
        const CircleAvatar(
          radius: 19,
          backgroundColor: AppColors.surfaceLight,
          child: Text(
            'J',
            style: TextStyle(color: AppColors.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildAiBanner() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF39305D),
            Color(0xFF242038),
            Color(0xFF302449),
          ],
        ),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.primary,
            size: 30,
          ),
          const SizedBox(height: 18),
          const Text(
            'Ask. Plan. Organize.',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Turn your thoughts into tasks, events and knowledge.',
            style: TextStyle(
              color: Color(0xFFD1CBE3),
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () => widget.onNavigate(4),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.background,
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 13,
              ),
            ),
            icon: const Icon(Icons.arrow_forward_rounded),
            label: const Text('Open AI Assistant'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      ('Tasks', Icons.check_circle_outline, 1),
      ('Events', Icons.calendar_month_outlined, 2),
      ('Notes', Icons.note_alt_outlined, 3),
      ('Knowledge', Icons.layers_outlined, 3),
    ];

    return Row(
      children: actions.map((action) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: AppCard(
              padding: const EdgeInsets.symmetric(
                vertical: 17,
                horizontal: 3,
              ),
              onTap: () => widget.onNavigate(action.$3),
              child: Column(
                children: [
                  Icon(
                    action.$2,
                    color: AppColors.primary,
                    size: 26,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    action.$1,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(
    String title,
    IconData icon, {
    String? action,
    VoidCallback? onAction,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (action != null)
          TextButton(
            onPressed: onAction,
            child: Text(action),
          ),
      ],
    );
  }

  Widget _buildTasks() {
    return AppCard(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      child: Column(
        children: List.generate(tasks.length, (index) {
          final task = tasks[index];
          final done = task['done'] as bool;

          return Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: done,
                    activeColor: AppColors.primary,
                    onChanged: (value) {
                      setState(() {
                        task['done'] = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      task['title'] as String,
                      style: TextStyle(
                        fontSize: 13,
                        decoration: done
                            ? TextDecoration.lineThrough
                            : null,
                        color: done
                            ? AppColors.textSecondary
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    task['priority'] as String,
                    style: TextStyle(
                      fontSize: 11,
                      color: task['priority'] == 'High'
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              if (index != tasks.length - 1)
                const Divider(color: AppColors.border),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildEventCard() {
    return AppCard(
      onTap: () => widget.onNavigate(2),
      child: const Row(
        children: [
          SizedBox(
            width: 62,
            child: Column(
              children: [
                Text(
                  'DEMO',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 5),
                Icon(
                  Icons.event_outlined,
                  color: AppColors.primary,
                  size: 26,
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Team Meeting',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Example event • 11:00 AM',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
