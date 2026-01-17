import 'package:flutter/material.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/features/resume/domain/entities/resume_entities.dart';

class CategoryBreakdownTile extends StatefulWidget {
  final CategoryScore category;
  final ResumeAnalysis analysis;

  const CategoryBreakdownTile({
    Key? key,
    required this.category, required this.analysis,
  }) : super(key: key);

  @override
  State<CategoryBreakdownTile> createState() => _CategoryBreakdownTileState();
}

class _CategoryBreakdownTileState extends State<CategoryBreakdownTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            title: Text(
              widget.category.category,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: LinearProgressIndicator(
              value: widget.category.score / 10,
              minHeight: 4,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.category.score}/10',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: widget.category.score >= 8
                        ? AppTheme.primaryGreen
                        : widget.category.score >= 6
                            ? AppTheme.warningOrange
                            : Colors.red,
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: AppTheme.neutralGray,
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                widget.category.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.neutralGray,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
