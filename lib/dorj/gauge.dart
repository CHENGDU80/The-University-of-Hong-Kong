import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class MyGauge extends StatefulWidget {
  final double value;
  const MyGauge({super.key, required this.value});

  @override
  State<MyGauge> createState() => _MyGaugeState();
}

class _MyGaugeState extends State<MyGauge> {
  @override
  Widget build(BuildContext context) {
    return AnimatedRadialGauge(
      /// The animation duration.
      duration: const Duration(seconds: 1),
      curve: Curves.elasticOut,

      /// Define the radius.
      /// If you omit this value, the parent size will be used, if possible.
      radius: 100,

      /// Gauge value.
      value: widget.value,

      /// Optionally, you can configure your gauge, providing additional
      /// styles and transformers.
      axis: const GaugeAxis(
        /// Provide the [min] and [max] value for the [value] argument.
        min: 0,
        max: 100,

        /// Render the gauge as a 180-degree arc.
        degrees: 180,

        /// Set the background color and axis thickness.
        style: GaugeAxisStyle(
          thickness: 20,
          background: Color(0xFFDFE2EC),
          segmentSpacing: 4,
        ),

        /// Define the pointer that will indicate the progress (optional).
        // pointer: GaugePointer.needle(
        //     height: 16, width: 100, borderRadius: 16, color: MyColors.primary),

        /// Define the progress bar (optional).
        progressBar: GaugeProgressBar.rounded(
          color: Colors.green,
        ),

        /// Define axis segments (optional).
        segments: [
          GaugeSegment(
            from: 0,
            to: 33.3,
            color: Color(0xFFD9DEEB),
            cornerRadius: Radius.zero,
          ),
          GaugeSegment(
            from: 33.3,
            to: 66.6,
            color: Color(0xFFD9DEEB),
            cornerRadius: Radius.zero,
          ),
          GaugeSegment(
            from: 66.6,
            to: 100,
            color: Color(0xFFD9DEEB),
            cornerRadius: Radius.zero,
          ),
        ],
      ),
    );
  }
}
