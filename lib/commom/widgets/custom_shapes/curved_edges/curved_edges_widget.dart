
import 'package:flutter/cupertino.dart';

import 'curved_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key, required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: widget,
    );
  }
}
