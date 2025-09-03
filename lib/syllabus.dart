import 'dart:html' as html;
import 'package:flutter/material.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({super.key});

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  @override
  void initState() {
    super.initState();
    _openPdfSameTab();
  }

  void _openPdfSameTab() {
    const String pdfUrl = 'assets/images/syllabus.pdf';
    final resolvedUrl = Uri.base.resolve(pdfUrl).toString();
    html.window.open(resolvedUrl, '_blank');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SizedBox.shrink());
  }
}
