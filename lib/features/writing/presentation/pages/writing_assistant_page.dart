import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/writing/domain/entities/writing_entities.dart';
import 'package:student_analyzer_app/features/writing/presentation/providers/writing_provider.dart';
import '../../../session/session_provider.dart';


class WritingAssistantPage extends ConsumerStatefulWidget {
  const WritingAssistantPage({Key? key}) : super(key: key);

  @override
  ConsumerState<WritingAssistantPage> createState() =>
      _WritingAssistantPageState();
}

class _WritingAssistantPageState extends ConsumerState<WritingAssistantPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedType = 'Email';
  String _selectedTone = 'Professional';
  late TextEditingController _contextController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _contextController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _contextController.dispose();
    super.dispose();
  }

  Future<void> _handleGenerate() async {
    if (_contextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide context')),
      );
      return;
    }

    try {
      ref.read(isGeneratingProvider.notifier).state = true;

      final repository = ref.read(writingRepositoryProvider);

      final sessionToken =
      await ref.read(ensureSessionProvider.future);

      final request = WritingRequest(
        type: _selectedType,
        context: _contextController.text,
        tone: _selectedTone,
        recipientRole: 'Hiring Manager',
      );

      final content = await repository.generateContent(
        request: request,
        sessionToken: sessionToken,
      );

      ref.read(generatedContentProvider.notifier).state = content;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      ref.read(isGeneratingProvider.notifier).state = false;
    }
  }



  @override
  Widget build(BuildContext context) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    final generatedContent = ref.watch(generatedContentProvider);
    final isGenerating = ref.watch(isGeneratingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Writing Assistant'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Selection
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                onTap: (index) {
                  setState(() {
                    _selectedType = ['Email', 'CoverLetter', 'Outreach'][index];
                  });
                },
                tabs: const [
                  Tab(text: 'Email'),
                  Tab(text: 'Cover Letter'),
                  Tab(text: 'Outreach'),
                ],
              ),
            ),
            Padding(
              padding: responsivePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What should I write about?',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                  ),
                  Text(
                    'Describe your topic, tone, and key details.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.neutralGray,
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                  ),
                  // Tone Selection
                  Text(
                    'Tone',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                  ),
                  Row(
                    children: ['Professional', 'Casual', 'Warm'].map((tone) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedTone = tone),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: ResponsiveHelper.getResponsiveSpacing(context, 8),
                            ),
                            margin: EdgeInsets.only(
                              right: ResponsiveHelper.getResponsiveSpacing(context, 8),
                            ),
                            decoration: BoxDecoration(
                              color: _selectedTone == tone
                                  ? AppTheme.primaryBlue
                                  : AppTheme.borderGray,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              tone,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: _selectedTone == tone
                                    ? Colors.white
                                    : AppTheme.textDark,
                                fontWeight: FontWeight.w600,
                                fontSize: ResponsiveHelper.getResponsiveFontSize(
                                    context, 12),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                  ),
                  // Context Input
                  TextField(
                    controller: _contextController,
                    maxLines: isMobile ? 4 : 5,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                    ),
                    decoration: InputDecoration(
                      hintText:
                          'E.g., Write a follow-up email after an interview with Acme Corp for the Designer role...',
                      hintStyle: TextStyle(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 13),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                  ),
                  // Generate Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.auto_awesome),
                      label: isGenerating
                          ? const Text('Generating...')
                          : const Text('Generate Draft'),
                      onPressed: isGenerating ? null : _handleGenerate,
                    ),
                  ),
                  if (generatedContent != null) ...[
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                    ),
                    Text(
                      'AI GENERATED PREVIEW',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.neutralGray,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    Container(
                      padding: responsivePadding,
                      decoration: BoxDecoration(
                        color: AppTheme.borderGray.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.borderGray),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SUBJECT',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: ResponsiveHelper.getResponsiveFontSize(
                                  context, 11),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                          ),
                          Text(
                            generatedContent.type,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: ResponsiveHelper.getResponsiveFontSize(
                                  context, 14),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                          ),
                          Text(
                            'CONTENT',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: ResponsiveHelper.getResponsiveFontSize(
                                  context, 11),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                          ),
                          Text(
                            generatedContent.content,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: ResponsiveHelper.getResponsiveFontSize(
                                  context, 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.content_copy),
                            label: const Text('Copy'),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Copied to clipboard')),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: ResponsiveHelper.getResponsiveSpacing(context, 12),
                        ),
                        Expanded(
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.edit),
                            label: const Text('Edit'),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
