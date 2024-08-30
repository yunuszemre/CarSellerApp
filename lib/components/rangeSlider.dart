import 'package:flutter/material.dart';
import 'package:flutter_car_selling_app/core/project_colors.dart';

class RangeSliderCustom extends StatefulWidget {
  const RangeSliderCustom({super.key});

  @override
  State<RangeSliderCustom> createState() => _RangeSliderCustomState();
}

class _RangeSliderCustomState extends State<RangeSliderCustom> {
    RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RangeSlider(        
        activeColor: ProjectColors.MaximumOrange,
        inactiveColor: ProjectColors.WhiteWhale,      
        values: _currentRangeValues,
        max: 1000,
        divisions: 100,      
        labels: RangeLabels(           
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
          });
        },
      ),
    );
  }
}