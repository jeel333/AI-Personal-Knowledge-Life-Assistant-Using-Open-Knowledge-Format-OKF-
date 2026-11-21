
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../widgets/app_card.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final TextEditingController messageController =
      TextEditingController();

  String? lastMessage;

  final suggestions = const [
    'Plan my day',
    'Add a task',
    'Take a note',
    'Summarize a topic',
    'Schedule an event',
    'Learn something',
  ];

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void sendMessage() {
    final message = messageController.text.trim();

    if (message.isEmpty) return;

    setState(() {
      lastMessage = message;
      messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: AppColors.primary,
                ),
                SizedBox(width: 12),
                Text(
                  'AI Assistant',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 25),
                Center(
                  child: Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(
                        alpha: 0.12,
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Icon(
                      Icons.smart_toy_outlined,
                      size: 55,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'How can I help you today?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your personal assistant for planning, tasks, notes and knowledge.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 35),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: suggestions.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 64,
                  ),
                  itemBuilder: (context, index) {
                    return AppCard(
                      padding: const EdgeInsets.all(12),
                      onTap: () {
                        messageController.text = suggestions[index];
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          suggestions[index],
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    );
                  },
                ),
                if (lastMessage != null) ...[
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(lastMessage!),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'AI responses will be enabled when we connect the backend.',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    onSubmitted: (_) => sendMessage(),
                    decoration: const InputDecoration(
                      hintText: 'Message your assistant...',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  onPressed: sendMessage,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.background,
                  ),
                  icon: const Icon(Icons.arrow_upward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
