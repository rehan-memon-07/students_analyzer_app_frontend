import 'package:flutter/material.dart';
import '../../domain/entities/resume_entities.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/core/models/resume_model.dart';
import 'package:student_analyzer_app/core/data/local/resume_local_datasource.dart';

class ResumeAnalysisPage extends StatefulWidget {
  final ResumeAnalysis analysis;

  const ResumeAnalysisPage({
    super.key,
    required this.analysis,
  });

  @override
  State<ResumeAnalysisPage> createState() => _ResumeAnalysisPageState();
}

class _ResumeAnalysisPageState extends State<ResumeAnalysisPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _scoreAnimationController;
  late Animation<double> _scoreAnimation;

  @override
  void initState() {
    super.initState();
    _scoreAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _scoreAnimation = Tween<double>(begin: 0, end: widget.analysis.totalScore)
        .animate(
      CurvedAnimation(parent: _scoreAnimationController, curve: Curves.easeOutCubic),
    );
    _scoreAnimationController.forward();
    _saveResumeToHive();
  }
  Future<void> _saveResumeToHive() async {
    final localDataSource = ResumeLocalDataSource();

    await localDataSource.saveResume(
      ResumeModel(
        id: "resume_${DateTime.now().millisecondsSinceEpoch}",
        filePath: "temp_path",
        score: widget.analysis.totalScore.toInt(),
        parsedData: {
          "keyStrength": widget.analysis.keyStrength,
          "keyImprovement": widget.analysis.keyImprovement,
          "recommendations": widget.analysis.recommendations
              .map((e) => {
            "title": e.title,
            "description": e.description,
          })
              .toList(),
        },
        version: 1,
        createdAt: DateTime.now(),
      ),
    );

    print("Resume saved to Hive ✅");
  }

  @override
  void dispose() {
    _scoreAnimationController.dispose();
    super.dispose();
  }

  Color _getScoreColor(double score) {
    if (score >= 80) return AppTheme.primaryGreen;
    if (score >= 60) return AppTheme.warningOrange;
    return Colors.redAccent;
  }

  String _getScoreLabel(double score) {
    if (score >= 80) return 'EXCELLENT';
    if (score >= 60) return 'GOOD';
    return 'NEEDS WORK';
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with back button
              Padding(
                padding: responsivePadding,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(
                      width: ResponsiveHelper.getResponsiveSpacing(context, 8),
                    ),
                    Expanded(
                      child: Text(
                        'Analysis Result',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize:
                          ResponsiveHelper.getResponsiveFontSize(context, 28),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Score Header Card with Animation
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: responsivePadding.left,
                  vertical: ResponsiveHelper.getResponsiveSpacing(context, 16),
                ),
                padding: EdgeInsets.all(
                  ResponsiveHelper.getResponsiveSpacing(context, 24),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _getScoreColor(widget.analysis.totalScore),
                      _getScoreColor(widget.analysis.totalScore).withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: _getScoreColor(widget.analysis.totalScore)
                          .withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Animated Score
                    AnimatedBuilder(
                      animation: _scoreAnimation,
                      builder: (context, child) {
                        return Column(
                          children: [
                            Text(
                              _scoreAnimation.value.toStringAsFixed(0),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                color: Colors.white,
                                fontSize: ResponsiveHelper.getResponsiveFontSize(
                                  context,
                                  72,
                                ),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '/ 100',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white70,
                                fontSize:
                                ResponsiveHelper.getResponsiveFontSize(context, 16),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    // Star Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < widget.analysis.starRating
                              ? Icons.star
                              : Icons.star_outline,
                          color: Colors.white,
                          size: 24,
                        );
                      }),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                        ResponsiveHelper.getResponsiveSpacing(context, 12),
                        vertical: ResponsiveHelper.getResponsiveSpacing(context, 6),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _getScoreLabel(widget.analysis.totalScore),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize:
                          ResponsiveHelper.getResponsiveFontSize(context, 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: responsivePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Key Strength & Improvement Cards
                    isTablet
                        ? Row(
                      children: [
                        Expanded(
                          child: _StrengthCard(
                            title: 'Key Strength',
                            content: widget.analysis.keyStrength,
                            icon: Icons.thumb_up,
                            color: AppTheme.primaryGreen,
                            context: context,
                          ),
                        ),
                        SizedBox(
                          width:
                          ResponsiveHelper.getResponsiveSpacing(context, 16),
                        ),
                        Expanded(
                          child: _StrengthCard(
                            title: 'To Improve',
                            content: widget.analysis.keyImprovement,
                            icon: Icons.warning_amber_rounded,
                            color: AppTheme.warningOrange,
                            context: context,
                          ),
                        ),
                      ],
                    )
                        : Column(
                      children: [
                        _StrengthCard(
                          title: 'Key Strength',
                          content: widget.analysis.keyStrength,
                          icon: Icons.thumb_up,
                          color: AppTheme.primaryGreen,
                          context: context,
                        ),
                        SizedBox(
                          height: ResponsiveHelper.getResponsiveSpacing(
                            context,
                            16,
                          ),
                        ),
                        _StrengthCard(
                          title: 'To Improve',
                          content: widget.analysis.keyImprovement,
                          icon: Icons.warning_amber_rounded,
                          color: AppTheme.warningOrange,
                          context: context,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                    ),

                    // Category Breakdown Section
                    Text(
                      'Category Breakdown',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize:
                        ResponsiveHelper.getResponsiveFontSize(context, 20),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    ...widget.analysis.categoryScores.map((category) {
                      final categoryProgress = category.score / 100;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: ResponsiveHelper.getResponsiveSpacing(context, 12),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(
                            ResponsiveHelper.getResponsiveSpacing(context, 16),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppTheme.borderGray),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    category.category,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                      ResponsiveHelper.getResponsiveFontSize(
                                        context,
                                        15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: ResponsiveHelper.getResponsiveSpacing(
                                        context,
                                        8,
                                      ),
                                      vertical:
                                      ResponsiveHelper.getResponsiveSpacing(
                                        context,
                                        4,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primaryBlue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      '${category.score.toStringAsFixed(1)}/100',
                                      style:
                                      Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: AppTheme.primaryBlue,
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                        ResponsiveHelper.getResponsiveFontSize(
                                          context,
                                          12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                ResponsiveHelper.getResponsiveSpacing(context, 8),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: LinearProgressIndicator(
                                  value: categoryProgress,
                                  minHeight: 6,
                                  backgroundColor:
                                  AppTheme.borderGray.withOpacity(0.5),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    categoryProgress >= 0.7
                                        ? AppTheme.primaryGreen
                                        : categoryProgress >= 0.5
                                        ? AppTheme.warningOrange
                                        : Colors.redAccent,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                ResponsiveHelper.getResponsiveSpacing(context, 8),
                              ),
                              Text(
                                category.description,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppTheme.neutralGray,
                                  height: 1.5,
                                  fontSize:
                                  ResponsiveHelper.getResponsiveFontSize(
                                    context,
                                    13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                    ),

                    // Recommendations Section
                    Text(
                      'Top Recommendations',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize:
                        ResponsiveHelper.getResponsiveFontSize(context, 20),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    ...widget.analysis.recommendations.map((rec) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: ResponsiveHelper.getResponsiveSpacing(context, 12),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(
                            ResponsiveHelper.getResponsiveSpacing(context, 12),
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.warningOrange.withOpacity(0.08),
                            border: Border(
                              left: BorderSide(
                                width: 4,
                                color: AppTheme.warningOrange,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.lightbulb_outline,
                                color: AppTheme.warningOrange,
                                size: 20,
                              ),
                              SizedBox(
                                width:
                                ResponsiveHelper.getResponsiveSpacing(context, 12),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      rec.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                        ResponsiveHelper.getResponsiveFontSize(
                                          context,
                                          14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: ResponsiveHelper.getResponsiveSpacing(
                                        context,
                                        4,
                                      ),
                                    ),
                                    Text(
                                      rec.description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                        color: AppTheme.neutralGray,
                                        height: 1.5,
                                        fontSize:
                                        ResponsiveHelper.getResponsiveFontSize(
                                          context,
                                          13,
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
                    }),

                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                    ),

                    // Export Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        label: Text(
                          'Export Full Report',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.getResponsiveFontSize(
                              context,
                              16,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StrengthCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color color;
  final BuildContext context;

  const _StrengthCard({
    required this.title,
    required this.content,
    required this.icon,
    required this.color,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        ResponsiveHelper.getResponsiveSpacing(context, 16),
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              SizedBox(
                width: ResponsiveHelper.getResponsiveSpacing(context, 12),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w700,
                  fontSize:
                  ResponsiveHelper.getResponsiveFontSize(context, 15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ResponsiveHelper.getResponsiveSpacing(context, 12),
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppTheme.textDark,
              height: 1.6,
              fontSize:
              ResponsiveHelper.getResponsiveFontSize(context, 14),
            ),
          ),
        ],
      ),
    );
  }
}
