import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/interview/presentation/providers/interview_provider.dart';

class InterviewLivePage extends ConsumerStatefulWidget {
  const InterviewLivePage({Key? key}) : super(key: key);

  @override
  ConsumerState<InterviewLivePage> createState() => _InterviewLivePageState();
}

class _InterviewLivePageState extends ConsumerState<InterviewLivePage>
    with SingleTickerProviderStateMixin {
  late TextEditingController _answerController;
  late AnimationController _timerController;
  late Stopwatch _stopwatch;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController();
    _timerController = AnimationController(
      duration: const Duration(minutes: 5),
      vsync: this,
    );
    _stopwatch = Stopwatch()..start();
    _timerController.forward();
  }

  @override
  void dispose() {
    _answerController.dispose();
    _timerController.dispose();
    _stopwatch.stop();
    super.dispose();
  }

  Future<void> _handleSubmitAnswer() async {
    final session = ref.read(currentInterviewSessionProvider)!;
    final currentIndex = ref.read(currentQuestionIndexProvider);

    if (_answerController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide an answer')),
      );
      return;
    }

    final repository = ref.read(interviewRepositoryProvider);
    await repository.submitAnswer(
      session.sessionId,
      session.questions[currentIndex].id,
      _answerController.text,
    );

    _answerController.clear();

    if (currentIndex < session.questions.length - 1) {
      ref.read(currentQuestionIndexProvider.notifier).state = currentIndex + 1;
    } else {
      _handleEndInterview();
    }
  }

  Future<void> _handleEndInterview() async {
    final session = ref.read(currentInterviewSessionProvider)!;
    final repository = ref.read(interviewRepositoryProvider);

    final result = await repository.endInterviewSession(session.sessionId);
    ref.read(interviewResultsProvider.notifier).state = result;

    if (mounted) {
      context.push('/interview/results');
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    final sessionAsync = ref.watch(currentInterviewSessionProvider);
    final currentIndex = ref.watch(currentQuestionIndexProvider);

    if (sessionAsync == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final session = sessionAsync;
    final currentQuestion = session.questions[currentIndex];

    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1F26),
        title: Text(
          'MOCK INTERVIEW',
          style: TextStyle(
            fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('End Interview?'),
                content: const Text('Are you sure you want to end this interview?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _handleEndInterview();
                    },
                    child: const Text('End Interview'),
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getResponsiveSpacing(context, 16),
              vertical: ResponsiveHelper.getResponsiveSpacing(context, 8),
            ),
            child: Center(
              child: Text(
                '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: responsivePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question Counter
                Text(
                  'Question ${currentIndex + 1} of ${session.questions.length}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                ),
                // Question Text
                Container(
                  padding: responsivePadding,
                  decoration: BoxDecoration(
                    color: Color(0xFF2A2F36),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    currentQuestion.text,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                ),
                // Recording Status
                Row(
                  children: [
                    Container(
                      width: ResponsiveHelper.getResponsiveFontSize(context, 12),
                      height: ResponsiveHelper.getResponsiveFontSize(context, 12),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveHelper.getResponsiveSpacing(context, 8),
                    ),
                    Text(
                      'RECORDING',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                ),
                // Answer Input
                TextField(
                  controller: _answerController,
                  maxLines: isMobile ? 4 : 5,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Tap to finish answer',
                    hintStyle: TextStyle(
                      color: Colors.white30,
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white24),
                    ),
                    filled: true,
                    fillColor: Color(0xFF2A2F36),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                ),
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.mic,
                          size: ResponsiveHelper.getResponsiveFontSize(context, 20),
                        ),
                        label: const Text('Mic'),
                        onPressed: () {
                          setState(() => _isRecording = !_isRecording);
                        },
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.videocam,
                          size: ResponsiveHelper.getResponsiveFontSize(context, 20),
                        ),
                        label: const Text('Video'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.arrow_forward,
                      size: ResponsiveHelper.getResponsiveFontSize(context, 20),
                    ),
                    label: const Text('Next Question'),
                    onPressed: _handleSubmitAnswer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
