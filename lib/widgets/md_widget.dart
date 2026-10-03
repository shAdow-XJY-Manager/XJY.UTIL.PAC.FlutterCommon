import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:markdown/markdown.dart' as md;

/// Asset markdown reader. Respects the space supplied by its parent.
class MdWidget extends StatefulWidget {
  final String title;
  final String path;
  const MdWidget({super.key, required this.title, required this.path});
  @override
  State<MdWidget> createState() => _MdWidgetState();
}

class _MdWidgetState extends State<MdWidget> {
  late Future<String> _document;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _document = rootBundle.loadString(widget.path);
  }

  @override
  void didUpdateWidget(MdWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.path != widget.path) {
      _document = rootBundle.loadString(widget.path);
      if (_scrollController.hasClients) _scrollController.jumpTo(0);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _retry() =>
      setState(() => _document = rootBundle.loadString(widget.path));

  Future<void> _openLink(String? href) async {
    final uri = href == null ? null : Uri.tryParse(href);
    if (uri == null) return;
    try {
      if (await launchUrl(uri)) return;
    } catch (_) {
      // Surface a failed launch below, including unsupported schemes.
    }
    if (!mounted) return;
    ScaffoldMessenger.maybeOf(
      context,
    )?.showSnackBar(const SnackBar(content: Text('无法打开链接，请稍后重试')));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      color: theme.colorScheme.surface,
      child: FutureBuilder<String>(
        future: _document,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator(semanticsLabel: '加载文档'));
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline),
                  const SizedBox(height: 12),
                  const Text('文档暂时无法加载'),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: _retry,
                    icon: const Icon(Icons.refresh),
                    label: const Text('重试'),
                  ),
                ],
              ),
            );
          }
          if (!snapshot.hasData)
            return const Center(
              child: CircularProgressIndicator(semanticsLabel: '加载文档'),
            );
          return SingleChildScrollView(
            controller: _scrollController,
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(widget.title, style: theme.textTheme.headlineMedium),
                    const SizedBox(height: 24),
                    if (snapshot.data!.trim().isEmpty)
                      const Text('文档暂无内容')
                    else
                      MarkdownBody(
                        data: snapshot.data!,
                        selectable: true,
                        softLineBreak: true,
                        extensionSet: md.ExtensionSet.gitHubWeb,
                        onTapLink: (_, href, _) => _openLink(href),
                        styleSheet: MarkdownStyleSheet.fromTheme(theme)
                            .copyWith(
                              p: theme.textTheme.bodyLarge?.copyWith(
                                height: 1.7,
                              ),
                              blockquoteDecoration: BoxDecoration(
                                color:
                                    theme.colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
