import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// Responsive scaffold with adaptive navigation.
///
/// Provides:
/// - Sidebar navigation on desktop
/// - Bottom navigation on mobile
/// - Drawer on tablet
class ResponsiveScaffold extends StatefulWidget {
  final String title;
  final List<NavigationItem> items;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final Widget body;
  final Widget? floatingActionButton;
  final List<Widget>? actions;
  final bool showTitle;
  
  const ResponsiveScaffold({
    super.key,
    required this.title,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.body,
    this.floatingActionButton,
    this.actions,
    this.showTitle = true,
  });
  
  @override
  State<ResponsiveScaffold> createState() => _ResponsiveScaffoldState();
}

class _ResponsiveScaffoldState extends State<ResponsiveScaffold> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          // Desktop layout with sidebar
          return _buildDesktopLayout();
        } else if (constraints.maxWidth >= 600) {
          // Tablet layout with drawer
          return _buildTabletLayout();
        } else {
          // Mobile layout with bottom navigation
          return _buildMobileLayout();
        }
      },
    );
  }
  
  Widget _buildDesktopLayout() {
    return Scaffold(
      backgroundColor: siteBackground,
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            child: Column(
              children: [
                if (widget.showTitle) _buildAppBar(),
                Expanded(child: widget.body),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }
  
  Widget _buildTabletLayout() {
    return Scaffold(
      backgroundColor: siteBackground,
      appBar: AppBar(
        title: Text(widget.title),
        actions: widget.actions,
      ),
      drawer: _buildDrawer(),
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
    );
  }
  
  Widget _buildMobileLayout() {
    return Scaffold(
      backgroundColor: siteBackground,
      appBar: AppBar(
        title: Text(widget.title),
        actions: widget.actions,
      ),
      body: widget.body,
      bottomNavigationBar: _buildBottomNavigation(),
      floatingActionButton: widget.floatingActionButton,
    );
  }
  
  Widget _buildSidebar() {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: siteSurface,
        border: Border(
          right: BorderSide(color: borderColor, width: 1),
        ),
      ),
      child: Column(
        children: [
          if (widget.showTitle)
            Container(
              height: 64,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: borderColor, width: 1),
                ),
              ),
              child: Text(
                widget.title,
                style: AppTextStyles.titleLarge,
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = index == widget.selectedIndex;
                
                return _buildNavigationTile(
                  item: item,
                  isSelected: isSelected,
                  onTap: () => widget.onItemSelected(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: siteSurface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: siteBackground,
                border: Border(
                  bottom: BorderSide(color: borderColor, width: 1),
                ),
              ),
              child: Text(
                widget.title,
                style: AppTextStyles.headlineSmall,
              ),
            ),
            ...widget.items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == widget.selectedIndex;
              
              return _buildNavigationTile(
                item: item,
                isSelected: isSelected,
                onTap: () {
                  widget.onItemSelected(index);
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
  
  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemSelected,
      items: widget.items.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item.icon),
          label: item.label,
        );
      }).toList(),
    );
  }
  
  Widget _buildNavigationTile({
    required NavigationItem item,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? siteSelected : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border(
                left: BorderSide(color: siteAccent, width: 3),
              )
            : null,
      ),
      child: ListTile(
        leading: Icon(
          item.icon,
          color: isSelected ? siteAccent : textSecondary,
          size: 24,
        ),
        title: Text(
          item.label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isSelected ? textPrimary : textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        onTap: onTap,
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hoverColor: surfaceHover,
      ),
    );
  }
  
  Widget _buildAppBar() {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: siteSurface,
        border: Border(
          bottom: BorderSide(color: borderColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          Text(
            widget.title,
            style: AppTextStyles.titleLarge,
          ),
          const Spacer(),
          if (widget.actions != null) ...widget.actions!,
        ],
      ),
    );
  }
}

/// Navigation item data class.
class NavigationItem {
  final IconData icon;
  final String label;
  final String? route;
  
  const NavigationItem({
    required this.icon,
    required this.label,
    this.route,
  });
}
