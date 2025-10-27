import 'package:flutter/material.dart';
import 'policy_service.dart';
import 'policy_screen.dart';

class StartService extends StatefulWidget {
  final Widget child;

  const StartService({required this.child, super.key});

  @override
  State<StartService> createState() => _StartServiceState();
}

class _StartServiceState extends State<StartService> {
  bool _isCheckingPolicy = true;
  bool _hasPolicyUrl = false;
  String? _policyUrl;

  @override
  void initState() {
    super.initState();
    _checkPolicy();
  }

  void _checkPolicy() async {
    try {
      final policy = await PolicyService.fetchPolicyUrlFromServer();

      if (policy == null) {
        // No policy
      }

      if (mounted) {
        setState(() {
          if (policy != null && policy.isNotEmpty) {
            _hasPolicyUrl = true;
            _policyUrl = policy;
          } else {
            _hasPolicyUrl = false;
          }
          _isCheckingPolicy = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasPolicyUrl = false;
          _isCheckingPolicy = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingPolicy) {
      return MaterialApp(
        home: const Scaffold(
          body: SizedBox.shrink(),
          backgroundColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
      );
    }

    if (_hasPolicyUrl && _policyUrl != null) {
      return MaterialApp(
        home: PolicyScreen(url: _policyUrl!),
        debugShowCheckedModeBanner: false,
      );
    }

    // No policy, return the child app
    return MaterialApp(
      home: widget.child,
      debugShowCheckedModeBanner: false,
    );
  }
}
