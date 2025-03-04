import '/model/ride/ride.dart';
import '/model/ride_pref/ride_pref.dart';
import '/model/ride/locations.dart';
import '/model/user/user.dart';
import '../rides_repository.dart';
import '/service/rides_service.dart';

class MockRidesRepository implements RidesRepository {
  final List<Ride> _rides = [
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 2)), // Today at 5:30 AM
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 4)), // 2 hours duration
      driver: User(firstName: 'Kannika',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: false,
      ),
      availableSeats: 2,
      pricePerSeat: 10.0,
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 15)), // Today at 8:00 PM
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 17)), // 2 hours duration
      driver: User(firstName: 'Chaylim',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: false,
        ),
      availableSeats: 0,
      pricePerSeat: 12.0,
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 1)), // Today at 5:00 AM
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 4)), // 3 hours duration
      driver: User(firstName: 'Mengtech',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: false,
        ),
      availableSeats: 1,
      pricePerSeat: 11.0,
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 15)), // Today at 8:00 PM
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 17)), // 2 hours duration
      driver: User(
        firstName: 'Limhao',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: false,
        ),
      availableSeats: 2,
      pricePerSeat: 14.0,
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 1)), // Today at 5:00 AM
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 4)), // 3 hours duration
      driver: User(
        firstName: 'Sovanda',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: false,
        ),
      availableSeats: 1,
      pricePerSeat: 13.0,
    ),
  ];

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    // Filtering the rides based on the preference and filter (currently considering pets)
    return _rides.where((ride) {
      bool matchesDeparture = ride.departureLocation == preference.departure;
      bool matchesArrival = ride.arrivalLocation == preference.arrival;
      bool matchesPets = filter?.acceptPets ?? true ? ride.driver.firstName == 'Limhao' : true;

      return matchesDeparture && matchesArrival && matchesPets;
    }).toList();
  }
}
