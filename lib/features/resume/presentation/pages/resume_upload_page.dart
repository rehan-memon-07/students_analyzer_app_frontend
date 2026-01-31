import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/resume_repository.dart';
import '../../../session/session_provider.dart';
import '../../domain/entities/resume_entities.dart';
import 'resume_analysis_page.dart';

class ResumeUploadPage extends ConsumerStatefulWidget {
  const ResumeUploadPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ResumeUploadPage> createState() => _ResumeUploadPageState();
}

class _ResumeUploadPageState extends ConsumerState<ResumeUploadPage> {
  bool _isUploading = false;
  double _progress = 0.0;
  String? _fileName;

  Future<void> _handleUpload() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result == null || result.files.single.path == null) return;

    setState(() {
      _isUploading = true;
      _progress = 0.1;
      _fileName = result.files.single.name;
    });

    try {
      final repo = ref.read(resumeRepositoryProvider);

      // 1️⃣ Session (single source)
      final sessionToken = await ref.read(ensureSessionProvider.future);
      setState(() => _progress = 0.25);

      // 2️⃣ Upload
      final resumeId = await repo.uploadResume(
        sessionToken: sessionToken,
        file: File(result.files.single.path!),
      );
      setState(() => _progress = 0.45);

      // 3️⃣ Extract text (REQUIRED)
      await repo.extractText(
        sessionToken: sessionToken,
        resumeId: resumeId,
      );
      setState(() => _progress = 0.65);

      // ⏳ Stabilization (AI-safe)
      await Future.delayed(const Duration(milliseconds: 700));

      // 4️⃣ Analyze
      final ResumeAnalysis analysis = await repo.analyzeResume(
        sessionToken: sessionToken,
        resumeId: resumeId,
      );
      setState(() => _progress = 1.0);

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResumeAnalysisPage(analysis: analysis),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Resume')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _isUploading ? null : _handleUpload,
              child: const Text('Upload PDF'),
            ),
            const SizedBox(height: 16),
            if (_fileName != null) Text(_fileName!),
            if (_isUploading) ...[
              const SizedBox(height: 16),
              LinearProgressIndicator(value: _progress),
              const SizedBox(height: 8),
              Text('${(_progress * 100).toStringAsFixed(0)}%'),
            ],
          ],
        ),
      ),
    );
  }
}
