import 'package:get/get.dart';
import '../../view/pet_sitter/bookings/models/model.dart';


class SitterBookingServiceController extends GetxController {
  final RxList<BookingData> bookings = initialBookings.obs;

  void updateBookingStatus(BookingData booking, String newStatus) {
    int index = bookings.indexWhere((b) => b == booking);
    if (index != -1) {
      BookingData updatedBooking = booking.copyWith(status: newStatus);
      bookings[index] = updatedBooking;
    }
  }
}
