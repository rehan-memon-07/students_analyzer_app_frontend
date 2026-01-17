// Mock data for frontend testing - centralized data source
// This file contains all mock data structures used throughout the app
// Ready to be replaced with real API calls

class MockData {
  // ============= USER DATA =============
  static const String mockUserId = 'user_001';
  static const String mockUserName = 'Alex Johnson';
  static const String mockUserEmail = 'alex.johnson@example.com';
  static const String mockUserPhone = '+1 (555) 123-4567';
  static const String mockUserUniversity = 'State University';
  static const String mockUserMajor = 'Computer Science';
  
  static const Map<String, dynamic> mockUserProfile = {
    'id': mockUserId,
    'name': mockUserName,
    'email': mockUserEmail,
    'phone': mockUserPhone,
    'university': mockUserUniversity,
    'major': mockUserMajor,
    'joinDate': '2024-01-15',
    'avatar': 'https://i.pravatar.cc/150?img=1',
    'careerScore': 780,
    'careerScoreTrend': 15,
    'totalInterviews': 4,
    'completedModules': 8,
  };

  // ============= RESUME DATA =============
  static const Map<String, dynamic> mockResumeAnalysis = {
    'id': 'resume_001',
    'fileName': 'my_resume_final_v2.pdf',
    'uploadDate': '2024-12-20',
    'overallScore': 85,
    'rating': 4.2,
    'status': 'STRONG PROFILE',
    'categories': [
      {
        'name': 'Formatting',
        'score': 9,
        'maxScore': 10,
        'icon': 'document',
      },
      {
        'name': 'Clarity',
        'score': 8,
        'maxScore': 10,
        'icon': 'pencil',
      },
      {
        'name': 'Technical Skills',
        'score': 7,
        'maxScore': 10,
        'icon': 'code',
      },
      {
        'name': 'ATS Keywords',
        'score': 8,
        'maxScore': 10,
        'icon': 'search',
      },
    ],
    'keyStrength': 'Excellent pacing and clear structure in your answers.',
    'toImprove': 'Technical depth on edge cases was missing.',
    'recommendations': [
      {
        'title': 'Add Quantifiable Results',
        'description': 'Section by including metrics like percentages, numbers, or dollar amounts.',
        'points': '+8 PTS',
      },
      {
        'title': 'Improve Action Verb Usage',
        'description': 'Start bullet points with stronger, more impactful verbs to better describe your accomplishments.',
        'points': '+5 PTS',
      },
      {
        'title': 'Optimize for ATS Keywords',
        'description': 'Include more keywords from the job description to improve your chances with Applicant Tracking Systems.',
        'points': '+7 PTS',
      },
    ],
  };

  // ============= INTERVIEW DATA =============
  static const Map<String, dynamic> mockInterviewSetup = {
    'roles': [
      'Software Engineer',
      'Frontend Developer',
      'Backend Developer',
      'Full Stack Developer',
      'Data Scientist',
      'Product Manager',
      'UI/UX Designer',
    ],
    'difficulties': [
      {'level': 'Entry', 'icon': 'leaf', 'description': 'Perfect for beginners'},
      {'level': 'Mid', 'icon': 'trending_up', 'description': 'Intermediate challenges'},
      {'level': 'Senior', 'icon': 'trending_up', 'description': 'Advanced questions'},
    ],
  };

  static const Map<String, dynamic> mockInterviewResult = {
    'id': 'interview_001',
    'role': 'Software Engineer',
    'difficulty': 'Mid',
    'date': 'Oct 26',
    'duration': '15:45',
    'overallFeedback': 'Great job!',
    'feedbackText': 'You demonstrated excellent usage of the STAR method. Your structure was clear and concise.',
    'metrics': [
      {
        'name': 'Difficulty',
        'score': 7,
        'maxScore': 10,
        'trend': 'Trending Up',
        'trendIcon': 'trending_up',
      },
      {
        'name': 'Confidence',
        'score': 8,
        'maxScore': 10,
        'trend': 'Steady',
        'trendIcon': 'trending_flat',
      },
    ],
    'buttonText': 'View Detailed Feedback',
  };

  static const List<Map<String, dynamic>> mockInterviewQuestions = [
    {
      'id': 'q_001',
      'question': 'Tell me about a time you had to work with a difficult team member.',
      'userAnswer': 'In my previous role at TechCorp, I encountered a situation where...',
      'expertFeedback': 'Great use of the STAR method! Your response was well-structured.',
      'suggestions': [
        'Include more specific metrics about the outcome',
        'Could emphasize your communication approach more',
      ],
    },
    {
      'id': 'q_002',
      'question': 'How do you handle conflicting priorities?',
      'userAnswer': 'I prioritize based on business impact and deadlines. First, I...',
      'expertFeedback': 'Strong answer with practical examples.',
      'suggestions': [
        'Consider mentioning stakeholder communication',
      ],
    },
  ];

  // ============= WRITING DATA =============
  static const Map<String, dynamic> mockWritingOutput = {
    'type': 'email',
    'generatedContent': '''Dear Hiring Manager,

Thank you for taking the time to speak with me on [Date of Interview] about the [Job Role] position at [Company Name]. I truly enjoyed our conversation and learning more about the innovative projects...

I am very enthusiastic about the opportunity to contribute my skills in [mention key skills] to your team.

Best regards,
Alex Johnson''',
    'tips': [
      'Try taking a short 2-second pause instead of using a filler word to gather your thoughts.',
      'Include specific examples from your experience to make your response more compelling.',
    ],
  };

  // ============= CAREER PLANNER DATA =============
  static const Map<String, dynamic> mockCareerPlanner = {
    'title': 'Map Your Future',
    'subtitle': '"The best way to predict the future is to create it."',
    'roles': [
      {
        'name': 'Software Dev',
        'tag': true,
      },
      {
        'name': 'Data Science',
        'tag': false,
      },
      {
        'name': 'UX Design',
        'tag': false,
      },
    ],
    'skills': [
      {
        'name': 'Python',
        'selected': true,
        'category': 'SKILLS',
      },
      {
        'name': 'JavaScript',
        'selected': false,
        'category': 'SKILLS',
      },
      {
        'name': 'React',
        'selected': false,
        'category': 'SKILLS',
      },
      {
        'name': 'SQL',
        'selected': true,
        'category': 'SKILLS',
      },
      {
        'name': 'APIs',
        'selected': false,
        'category': 'SKILLS',
      },
    ],
    'suggestedRoles': [
      {
        'name': 'Frontend Dev',
        'description': 'UI Logic',
        'path': 'Web Basics',
        'weeks': 6,
      },
      {
        'name': 'Backend Dev',
        'description': 'Server Logic',
        'path': 'Full Stack',
        'weeks': 8,
      },
      {
        'name': 'Backend Master',
        'description': 'Deep expertise',
        'path': 'Full Stack',
        'weeks': 12,
      },
    ],
  };

  // ============= CAREER SCORE DATA =============
  static const Map<String, dynamic> mockCareerScore = {
    'totalScore': 780,
    'status': 'Excellent!',
    'percentile': 'You\'re in the top 5% of students. Keep up the great work!',
    'scoreBreakdown': [
      {
        'category': 'TECHNICAL',
        'score': 85,
        'percentage': 85,
      },
      {
        'category': 'SOFT SKILLS',
        'score': 92,
        'percentage': 92,
      },
      {
        'category': 'INTERVIEW',
        'score': 74,
        'percentage': 74,
      },
    ],
    'recommendations': [
      {
        'icon': 'book',
        'title': 'Refine Resume',
        'description': 'Keywords missing: "Agile", "Leadership". Optimize for ATS.',
        'points': '+8 PTS',
      },
      {
        'icon': 'mic',
        'title': 'Mock Interview',
        'description': 'Practice the STAR method to ace behavioral questions.',
        'points': '+5 PTS',
      },
      {
        'icon': 'users',
        'title': 'Expand Network',
        'description': 'Connect with 5 alums in your target industry this week.',
        'points': '+7 PTS',
      },
    ],
  };

  // ============= LEADERBOARD DATA =============
  static const List<Map<String, dynamic>> mockLeaderboardStudents = [
    {
      'rank': 1,
      'name': 'Eleanor Vence',
      'university': 'Stanford • CS',
      'score': 1350,
      'avatar': 'https://i.pravatar.cc/150?img=2',
      'medal': '🥇',
    },
    {
      'rank': 2,
      'name': 'Marcus Holloway',
      'university': 'MIT • CS',
      'score': 1298,
      'avatar': 'https://i.pravatar.cc/150?img=3',
      'medal': '🥈',
    },
    {
      'rank': 3,
      'name': 'Chloe Price',
      'university': 'Berkeley • Data Sci',
      'score': 1250,
      'avatar': 'https://i.pravatar.cc/150?img=4',
      'medal': '🥉',
    },
    {
      'rank': 4,
      'name': 'Arthur Margan',
      'university': 'Harvard • Business',
      'score': 1223,
      'avatar': 'https://i.pravatar.cc/150?img=5',
      'medal': '4',
    },
    {
      'rank': 5,
      'name': 'Lara Croft',
      'university': 'Yale • Archaeology',
      'score': 1199,
      'avatar': 'https://i.pravatar.cc/150?img=6',
      'medal': '5',
    },
    {
      'rank': 6,
      'name': 'John Doe',
      'university': 'Cornell • Economics',
      'score': 1185,
      'avatar': 'https://i.pravatar.cc/150?img=7',
      'medal': '6',
    },
    {
      'rank': 7,
      'name': 'Sarah Miller',
      'university': 'Princeton • Physics',
      'score': 1172,
      'avatar': 'https://i.pravatar.cc/150?img=8',
      'medal': '7',
    },
  ];

  static const Map<String, dynamic> mockStudentDetail = {
    'rank': 12,
    'name': 'Jane Doe',
    'major': 'Computer Science Major',
    'university': 'State University',
    'joinDate': '12/28/08',
    'avatar': 'https://i.pravatar.cc/150?img=9',
    'status': 'Active',
    'email': 'jane.doe@example.com',
    'phone': '+1 (555) 123-4567',
    'modules': [
      {
        'name': 'Resume Building',
        'points': '92/100',
        'status': 'Completed',
        'completedDate': 'Updated 2 days ago',
      },
      {
        'name': 'Mock Interviews',
        'points': '88/100',
        'status': 'In Progress (75%)',
        'completedDate': 'Updated 1 hrs ago',
      },
      {
        'name': 'Problem Solving',
        'points': '--',
        'status': 'Ongoing (50%)',
        'completedDate': 'Started yesterday',
      },
    ],
    'overallCompletion': 82,
    'averageScore': 88,
    'currentFocus': 'High',
    'activityLevel': 'Yesterday',
    'contactAction': 'Message Student',
  };

  // ============= ONBOARDING DATA =============
  static const List<Map<String, dynamic>> mockOnboardingPages = [
    {
      'title': 'Craft a Winning Resume',
      'subtitle': 'MODULE 01',
      'description': 'Build a professional resume in minutes with guided templates and get instant feedback with our AI analyzer.',
      'icon': 'document',
      'color': 'green',
    },
    {
      'title': 'Ace Your Next Interview',
      'subtitle': 'MODULE 02',
      'description': 'Boost confidence with realistic interviews powered by AI and expert coaches. Practice the STAR method.',
      'icon': 'mic',
      'color': 'orange',
    },
    {
      'title': 'Craft Perfect Resumes & Cover Letters',
      'subtitle': 'MODULE 03',
      'description': 'Our AI-powered Writing Assistant helps you polish application materials, correct grammar, and use professional language.',
      'icon': 'pencil',
      'color': 'purple',
    },
    {
      'title': 'Map Your Future',
      'subtitle': 'MODULE 04',
      'description': 'Set goals, track progress, and build a roadmap to your dream job with interactive Career Planner.',
      'icon': 'target',
      'color': 'blue',
    },
  ];

  // ============= DASHBOARD DATA =============
  static const Map<String, dynamic> mockWeeklyProgress = {
    'weekNumber': 4,
    'totalInterviews': 4,
    'progressPercentage': 80,
    'interviews': [
      {'day': 'Mon', 'completed': true},
      {'day': 'Tue', 'completed': true},
      {'day': 'Wed', 'completed': false},
      {'day': 'Thu', 'completed': true},
      {'day': 'Fri', 'completed': false},
      {'day': 'Sat', 'completed': false},
      {'day': 'Sun', 'completed': false},
    ],
  };
}
