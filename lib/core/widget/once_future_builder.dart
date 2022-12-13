
import 'package:flutter/material.dart';

typedef GetFuture<T> = Future<T> Function();

class OnceFutureBuilder<T> extends StatefulWidget {
  final GetFuture<T> future;
  final AsyncWidgetBuilder<T> builder;
  final T? initialData;

    const OnceFutureBuilder({Key? key,
    required this.future,
    required this.builder,
    this.initialData,
  }) : super(key: key);

  @override
  State<OnceFutureBuilder<T>> createState() => _OnceFutureBuilderState<T>();
}

class _OnceFutureBuilderState<T> extends State<OnceFutureBuilder<T>> {
  late Future<T> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.future();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      initialData: widget.initialData,
      builder: widget.builder,
      future: _future,
    );
  }
}
