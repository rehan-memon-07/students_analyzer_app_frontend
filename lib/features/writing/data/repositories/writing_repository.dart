import 'package:student_analyzer_app/features/writing/domain/entities/writing_entities.dart';

abstract class WritingRepository {
  Future<GeneratedContent> generateContent(WritingRequest request);
}

class MockWritingRepository implements WritingRepository {
  static const Map<String, Map<String, String>> mockTemplates = {
    'Email': {
      'Professional': '''Subject: Regarding [Position] Opportunity

Dear [Name],

I hope this email finds you well. I am writing to express my strong interest in the [Position] role at [Company].

With my background in [Your Expertise], I am confident that I can contribute significantly to your team. I am particularly drawn to [Company Name] because of [Specific Reason].

I would welcome the opportunity to discuss how my skills and experience align with your needs.

Best regards,
[Your Name]''',
      'Casual': '''Hi [Name],

Quick note – I'm really interested in the [Position] role at [Company]. Your team's work on [Project] caught my attention.

I think my experience with [Your Skills] would be a good fit for what you're building. Would love to chat more about this.

Thanks,
[Your Name]''',
    },
    'CoverLetter': {
      'Professional': '''[Your Name]
[Your Address]
[Date]

Dear Hiring Manager,

I am writing to express my strong interest in the [Position] position at [Company]. With [X] years of experience in [Industry], I am confident in my ability to make meaningful contributions to your organization.

Throughout my career, I have demonstrated expertise in [Key Skills] and a track record of [Achievements]. At [Previous Company], I [Specific Achievement with metrics].

I am particularly excited about [Company Name]'s mission to [Company's Mission] and would welcome the opportunity to contribute to your team's success.

Thank you for considering my application.

Sincerely,
[Your Name]''',
    },
    'Outreach': {
      'Warm': '''Hi [Name],

I've been following [Company]'s work on [Project/Initiative], and I'm genuinely impressed by [Specific Detail].

I'm currently exploring opportunities in [Field], and I think our interests align well. Would you have 20 minutes for a quick call next week?

Thanks,
[Your Name]''',
    },
  };

  @override
  Future<GeneratedContent> generateContent(WritingRequest request) async {
    // Simulate AI generation delay
    await Future.delayed(const Duration(seconds: 2));

    // Return mock content based on type and tone
    final template = mockTemplates[request.type]?[request.tone] ??
        mockTemplates[request.type]?.values.first ??
        'Your generated content will appear here.';

    return GeneratedContent(
      id: 'content_${DateTime.now().millisecondsSinceEpoch}',
      type: request.type,
      content: template,
      generatedAt: DateTime.now(),
    );
  }
}
