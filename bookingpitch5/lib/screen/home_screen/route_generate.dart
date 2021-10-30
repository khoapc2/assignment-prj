
import 'package:bookingpitch5/home_screen/addDetailPitch/son_pitch.dart';
import 'package:bookingpitch5/home_screen/add_mother_pitch/mother_pitch.dart';
import 'package:bookingpitch5/home_screen/calendar/main_screen.dart';
import 'package:bookingpitch5/home_screen/detail_pitch/main_screen.dart';
import 'package:bookingpitch5/home_screen/feedback/feedback.dart';
import 'package:bookingpitch5/home_screen/main_screen.dart';
import 'package:bookingpitch5/home_screen/notification/main_screen.dart';
import 'package:bookingpitch5/home_screen/profile/profile_host.dart';
import 'package:bookingpitch5/home_screen/updateMotherPitch/mother_pitch.dart';
import 'package:bookingpitch5/home_screen/update_son_pitch/update_son_pitch.dart';
import 'package:bookingpitch5/models/tranfer_params/pitchId_and_BookingId.dart';
import 'package:bookingpitch5/models/tranfer_params/pitchId_and_rate.dart';
import 'package:bookingpitch5/screen/home_screen/bill-pitch/main_screen.dart';
import 'package:bookingpitch5/screen/home_screen/booking_date/button_pay.dart';
import 'package:bookingpitch5/screen/home_screen/booking_date/main_screen.dart';
import 'package:bookingpitch5/screen/home_screen/detail_pitch/detail_pitch.dart';
import 'package:bookingpitch5/screen/home_screen/location/Location.dart';
import 'package:bookingpitch5/screen/home_screen/login/screens/login.dart';
import 'package:bookingpitch5/screen/home_screen/notification/notification.dart';
import 'package:bookingpitch5/screen/home_screen/profile/profile.dart';
import 'package:bookingpitch5/screen/home_screen/voucher/applyPitches.dart';
import 'package:bookingpitch5/screen/home_screen/voucher/voucherTab.dart';
import 'package:bookingpitch5/screen/home_screen/wallet/Wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'booking_slot/main_screen.dart';
import 'calendar_today/my_activity.dart';
import 'detail_pitch/main_screen.dart';


import 'list_pitch/my_activity.dart';

import 'main_screen/Homescreen.dart';
import 'rate_and_feedback_pitch/ratingactivity.dart';
import 'view_feedback/view_feedback.dart';


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/login':
        return MaterialPageRoute(builder: (_) => LogInScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => Homescreen());

      case '/second':
          return MaterialPageRoute(
              builder: (_) =>
                  MainScreenDetailPitch(
                      settings.arguments.toString()
                  ));
      case '/dateBooking':
        return MaterialPageRoute(
            builder: (_) =>
                MainScreenBookingDate(
                    settings.arguments as ParamenterToDateBookingScreen
                ));
      case '/slotBooking':
          return MaterialPageRoute(
              builder: (_) => MainScreenBookingSlot(
                settings.arguments as ParameterToSlotPitch));
      case '/profile':
      return MaterialPageRoute(
          builder: (_) => ProfilePage());
      case '/screen.home_screen.calendar_today':
        return MaterialPageRoute(
            builder: (_) => CalendarToday());
      case '/vourcher':
        return MaterialPageRoute(
            builder: (_) => VoucherTab());
      case '/billPitch':
        return MaterialPageRoute(
            builder: (_) => BillPitch(settings.arguments as ParameterToBillPitch));
      case '/ratePitch':
        return MaterialPageRoute(
            builder: (_) => RatingScreen(settings.arguments as PitchID_BookingID));
      case '/checkLocation':
        return MaterialPageRoute(
            builder: (_) => Location(settings.arguments as int));
      case '/wallet':
        return MaterialPageRoute(
            builder: (_) => Wallet());

      case '/listPitch':
        return MaterialPageRoute(
            builder: (_) => ApplyVoucherPitch());
      case '/view_feedback':
        return MaterialPageRoute(builder: (_) => ViewFeedback(settings.arguments as PitchID_Rate));
      case '/listPitch5':
        return MaterialPageRoute(
            builder: (_) => ListPitch());
      case '/notification':
        return MaterialPageRoute(
            builder: (_) => NotificationScreen());
///
      case '/mainScreenHost':
        return MaterialPageRoute(builder: (_) => CalendarTodayHost());//sai

      case '/detailPitchHost':
        return MaterialPageRoute(builder: (_) => MainScreenDetailPitchHost(settings.arguments as int));//sai

      case '/addMotherPitch':
        return MaterialPageRoute(builder: (_) => MotherPage());

      case '/addSonPitch':
        return MaterialPageRoute(builder: (_) => SonPage(settings.arguments as int));

      case '/notificationPitch':
        return MaterialPageRoute(builder: (_) => NotificationPitch());

      case '/calendar':
        return MaterialPageRoute(builder: (_) => CalendarOfCustomer());

      case '/updateMotherPitch':
        return MaterialPageRoute(builder: (_) => UpdateMotherPage(settings.arguments as int));

      case '/updateSonPitch':
        return MaterialPageRoute(builder: (_) => UpdateSonPage(settings.arguments as int));

      case '/feedbackHost':
        return MaterialPageRoute(builder: (_) => ViewFeedbackHost());

      case '/profileHost':
      return MaterialPageRoute(
          builder: (_) => ProfileHostPage());

      default:
        return MaterialPageRoute(builder: (_) => Homescreen());//sai
    }
  }
}