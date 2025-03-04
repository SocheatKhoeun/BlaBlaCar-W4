import 'package:flutter/material.dart';
import '/widgets/actions/bla_icon_button.dart';
import '../../../service/locations_service.dart'; // Update the path as needed

import '../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';
import '../../ride_pref/widgets/ride_pref_form.dart';

class RidePrefModal extends StatefulWidget {
  final LocationsService locationsService;

  const RidePrefModal({ super.key, required this.locationsService,});  // TODO 7 : We should pass the current prefs to this moda; 
 
  @override
  State<RidePrefModal> createState() => _RidePrefModalState();
}

class _RidePrefModalState extends State<RidePrefModal> {
  late RidePreference currentPreference;

  void onBackSelected() {
    Navigator.of(context).pop();
  }

  void onSubmit(RidePreference newPreference) {
      // TODO 9 : We should pop this modal, with the new current preference
      Navigator.of(context).pop(newPreference);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
          left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back icon
          BlaIconButton(
            onPressed: onBackSelected,
            icon: Icons.close,
          ),
          SizedBox(height: BlaSpacings.m),

          // Title
          Text("Edit your search",
              style: BlaTextStyles.title.copyWith(color: BlaColors.textNormal)),

          // Form
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: RidePrefForm(
              initialPreference: currentPreference,        // TODO 7 : The form should be displayed with the modal current prefs
              locationsService:widget.locationsService, // Add the required argument
              onSubmit: onSubmit,
            ),
          )),
        ],
      ),
    ));
  }
}
