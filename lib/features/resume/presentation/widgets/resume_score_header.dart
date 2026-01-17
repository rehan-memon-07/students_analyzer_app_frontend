import 'package:flutter/material.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/features/resume/domain/entities/resume_entities.dart';

class ResumeScoreHeader extends StatefulWidget {
  final ResumeAnalysis analysis;

  const ResumeScoreHeader({
    Key? key,
    required this.analysis,
  }) : super(key: key);

  @override
  State<ResumeScoreHeader> createState() => _ResumeScoreHeaderState();
}

class _ResumeScoreHeaderState extends State<ResumeScoreHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scoreAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scoreAnimation = Tween<double>(begin: 0, end: widget.analysis.totalScore).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Animated Score
          AnimatedBuilder(
            animation: _scoreAnimation,
            builder: (context, child) {
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: CircularProgressIndicator(
                          value: _scoreAnimation.value / 100,
                          strokeWidth: 8,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _scoreAnimation.value >= 80
                                ? AppTheme.primaryGreen
                                : _scoreAnimation.value >= 60
                                    ? AppTheme.warningOrange
                                    : Colors.red,
                          ),
                          backgroundColor: AppTheme.borderGray.withOpacity(0.3),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            _scoreAnimation.value.toStringAsFixed(0),
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 48,
                            ),
                          ),
                          Text(
                            '/ 100',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.analysis.scoreStatus,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Star Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < widget.analysis.starRating ? Icons.star : Icons.star_outline,
                        color: AppTheme.warningOrange,
                        size: 20,
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
