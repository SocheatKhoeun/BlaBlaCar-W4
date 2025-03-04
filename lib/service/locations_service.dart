import '/model/ride/locations.dart';

import '../dummy_data/dummy_data.dart';
import '../repository/locations_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  final LocationsRepository repository;

  LocationsService(this.repository);

  List<Location> get availableLocations => repository.getLocations();  
}