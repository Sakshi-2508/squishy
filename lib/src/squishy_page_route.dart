import 'package:flutter/material.dart';
import 'squishy_effect.dart';

class SquishyPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final SquishyEffect effect;

  SquishyPageRoute({
    required this.page,
    this.effect = SquishyEffect.blob,
    Duration duration = const Duration(milliseconds: 850),
  }) : super(
         transitionDuration: duration,
         reverseTransitionDuration: const Duration(milliseconds: 600),
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           switch (effect) {
             case SquishyEffect.blob:
               return _BlobSquishyTransition(
                 animation: animation,
                 child: child,
               );

             case SquishyEffect.elastic:
               return _ElasticSquishyTransition(
                 animation: animation,
                 child: child,
               );

             case SquishyEffect.stretch:
               return _StretchSquishyTransition(
                 animation: animation,
                 child: child,
               );

             case SquishyEffect.gooey:
               return _GooeySquishyTransition(
                 animation: animation,
                 child: child,
               );
           }
         },
       );
}

class _BlobSquishyTransition extends StatelessWidget {
  // Transition for blob effect
  final Animation<double> animation;
  final Widget child;

  const _BlobSquishyTransition({required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    final curved = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
    );

    return AnimatedBuilder(
      animation: curved,
      child: child,
      builder: (context, child) {
        return ClipPath(
          clipper: _BlobClipper(progress: curved.value),
          child: child,
        );
      },
    );
  }
}

class _ElasticSquishyTransition extends StatelessWidget {
  // Transition for elastic effect
  final Animation<double> animation;
  final Widget child;

  const _ElasticSquishyTransition({
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.elasticOut,
    );

    return AnimatedBuilder(
      animation: curvedAnimation,
      builder: (context, child) {
        final value = curvedAnimation.value;

        return Transform.translate(
          offset: Offset((1 - value) * MediaQuery.of(context).size.width, 0),
          child: Transform.scale(
            scaleX: 0.92 + (value * 0.08),
            scaleY: 1.0,
            alignment: Alignment.centerRight,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class _BlobClipper extends CustomClipper<Path> {
  // Clipper for blob effect
  final double progress;

  _BlobClipper({required this.progress});

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    final reveal = width * progress;
    final wave = 120 * (1 - progress);

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(reveal, 0);

    path.cubicTo(
      reveal + wave,
      height * 0.15,
      reveal + wave,
      height * 0.35,
      reveal,
      height * 0.5,
    );

    path.cubicTo(
      reveal - wave,
      height * 0.65,
      reveal - wave,
      height * 0.85,
      reveal,
      height,
    );

    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_BlobClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}

class _StretchSquishyTransition extends StatelessWidget {
  // Transition for stretch effect
  final Animation<double> animation;
  final Widget child;

  const _StretchSquishyTransition({
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );

    return AnimatedBuilder(
      animation: curvedAnimation,
      builder: (context, child) {
        final value = curvedAnimation.value;

        return Transform.translate(
          offset: Offset((1 - value) * MediaQuery.of(context).size.width, 0),
          child: Transform.scale(
            scaleX: 0.8 + (value * 0.2),
            scaleY: 0.8 + (value * 0.2),
            alignment: Alignment.centerRight,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class _GooeySquishyTransition extends StatelessWidget {
  // Transition for gooey effect
  final Animation<double> animation;
  final Widget child;

  const _GooeySquishyTransition({required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
    );

    return AnimatedBuilder(
      animation: curvedAnimation,
      child: child,
      builder: (context, child) {
        return ClipPath(
          clipper: _GooeyClipper(progress: curvedAnimation.value),
          child: child,
        );
      },
    );
  }
}

class _GooeyClipper extends CustomClipper<Path> {
  final double progress;

  _GooeyClipper({required this.progress});

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    final reveal = width * progress;
    final goo = 160 * (1 - progress);

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(reveal, 0);

    path.cubicTo(
      reveal + goo,
      height * 0.20,
      reveal - goo,
      height * 0.35,
      reveal,
      height * 0.50,
    );

    path.cubicTo(
      reveal + goo,
      height * 0.65,
      reveal - goo,
      height * 0.80,
      reveal,
      height,
    );

    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_GooeyClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}

