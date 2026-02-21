import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/planner/domain/entities/planner_entities.dart';
import 'package:student_analyzer_app/features/planner/presentation/providers/planner_provider.dart';
import 'package:student_analyzer_app/features/resume/data/repositories/resume_repository.dart';
import 'package:student_analyzer_app/features/session/session_provider.dart';

class CareerPlannerPage extends ConsumerStatefulWidget {
  const CareerPlannerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CareerPlannerPage> createState() =>
      _CareerPlannerPageState();
}

class _CareerPlannerPageState extends ConsumerState<CareerPlannerPage> {
  CareerPath? careerPath;
  bool loading = false;

  Future<void> uploadAndPlan() async {
    setState(() {
      loading = true;
      careerPath = null;
    });

    try {
      // 1️⃣ Pick PDF
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result == null) {
        setState(() => loading = false);
        return;
      }

      final file = File(result.files.single.path!);

      // 2️⃣ Session
      final sessionToken =
      await ref.read(ensureSessionProvider.future);

      final resumeRepo = ref.read(resumeRepositoryProvider);
      final plannerRepo = ref.read(plannerRepositoryProvider);

      // 3️⃣ Upload resume
      final resumeId = await resumeRepo.uploadResume(
        sessionToken: sessionToken,
        file: file,
      );

      // 4️⃣ Extract text
      await resumeRepo.extractText(
        sessionToken: sessionToken,
        resumeId: resumeId,
      );

      // 5️⃣ Career planner (Gemini decides domain)
      final plan = await plannerRepo.getCareerPath(
        sessionToken: sessionToken,
        resumeId: resumeId,
        skillName: 'AUTO', // ignored by backend
      );

      setState(() {
        careerPath = plan;
        loading = false;
      });
    } catch (e) {
      debugPrint('Career planner error: $e');
      setState(() => loading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Career planner failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveHelper.getResponsivePadding(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Planner'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Map Your Future',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              Text(
                '"The best way to predict the future is to create it."',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppTheme.neutralGray),
              ),
              const SizedBox(height: 32),

              /// UPLOAD BUTTON
              ElevatedButton.icon(
                onPressed: loading ? null : uploadAndPlan,
                icon: const Icon(Icons.upload_file),
                label: const Text('Upload Resume'),
              ),

              const SizedBox(height: 32),

              if (loading)
                const Center(child: CircularProgressIndicator()),

              if (!loading && careerPath != null) ...[
                /// SKILL (FROM RESUME)
                Text(
                  'CAREER DOMAIN',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                    color: AppTheme.neutralGray,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Chip(
                  label: Text(careerPath!.skillName),
                  backgroundColor:
                  AppTheme.primaryBlue.withOpacity(0.15),
                ),

                const SizedBox(height: 24),

                /// ROLES
                Text(
                  'SUGGESTED ROLES',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.neutralGray,
                  ),
                ),
                const SizedBox(height: 8),
                ...careerPath!.suggestedRoles.map(
                      (role) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text('• $role'),
                  ),
                ),

                const SizedBox(height: 24),

                /// PATHS
                Text(
                  'LEARNING PATHS',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.neutralGray,
                  ),
                ),
                const SizedBox(height: 12),

                ...careerPath!.paths.map((path) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                      Border.all(color: AppTheme.borderGray),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${path.roleName} — ${path.weeks} weeks',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        ...path.modules.map(
                              (m) => Padding(
                            padding:
                            const EdgeInsets.only(bottom: 6),
                            child: Text('• ${m.name}'),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
