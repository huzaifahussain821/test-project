import 'package:flutter/material.dart';

import '../Auth/DoctorAuthFlow/AcademicInformation/View/doctor_academic_information.dart';
import '../Auth/DoctorAuthFlow/DoctorProfessionalExperience/View/doctor_professional_experience.dart';
import '../Auth/DoctorAuthFlow/SignUpScreen/View/personal_information_screen.dart';
import '../Auth/InstituteAuth/SignUp/View/institute_sign_up.dart';
import '../Auth/LoginScreen/LoginRoutingArguments/login_routing_arguments.dart';
import '../Auth/LoginScreen/View/login_screen_view.dart';
import '../Auth/PatientAuthFLow/SignUp/View/sign_up_screen.dart';
import '../Auth/TeacherAuthFlow/SignUp/View/teacher_sign_up_screen.dart';
import '../Common Screens/Chat/View/Chat_Detail.dart';
import '../Common Screens/Chat/View/Chat_List.dart';
import '../Common Screens/SelectUser/View/select_user_screen.dart';
import '../Common Screens/SplashScreen/splash_screen.dart';
import '../Main Screens/Doctor_FLow/DoctorZoomDrawer/View/drawer_screen.dart';
import '../Main Screens/Doctor_FLow/Doctor_Create_Prescription/View/doctor_create_prescription.dart';
import '../Main Screens/Doctor_FLow/Doctor_Dashboard/View/doctor_dashboard.dart';
import '../Main Screens/Doctor_FLow/Doctor_Patient_Detail/View/doctor_patient_details.dart';
import '../Main Screens/Doctor_FLow/Doctor_Patients_History/View/doctor_patients_history.dart';
import '../Main Screens/Doctor_FLow/Doctor_Upcoming_Appointment_Detail/View/doctor_upcoming_appointment_detail.dart';
import '../Main Screens/Doctor_FLow/Doctor_Upcoming_Appointment_List/View/doctor_upcoming_appointment_list.dart';
import '../Main Screens/Institute_Concerned/DoctorZoomDrawer/View/drawer_screen.dart';
import '../Main Screens/Institute_Concerned/InstituteDashboard/View/institute_concerned_dashboard.dart';
import '../Main Screens/Institute_Concerned/StudentProfile/View/student_profile_screen.dart';
import '../Main Screens/Institute_Concerned/StudentRegistration/View/student_registration_screen.dart';
import '../Main Screens/Institute_Concerned/TeacherProfile/View/teacher_profile_screen.dart';
import '../Main Screens/Institute_Concerned/TeacherRegistration/View/teacher_registration_screen.dart';
import '../Main Screens/Patient_Flow/Patient_Bottom_Bar/bottombar_screen.dart';
import '../Main Screens/Patient_Flow/Patient_Clinical_FeedBack/RoutingArgument/patient_clinical_feedback_routing_arguments.dart';
import '../Main Screens/Patient_Flow/Patient_Clinical_FeedBack/View/patient_clinical_feedback.dart';
import '../Main Screens/Patient_Flow/Patient_Dashboard_Screen/View/patient_dashboard_screen.dart';
import '../Main Screens/Patient_Flow/Patient_Doctor_Detail/View/patient_doctor_details.dart';
import '../Main Screens/Patient_Flow/Patient_Edit_Profile/View/patient_edit_profile.dart';
import '../Main Screens/Patient_Flow/Patient_On_Boarding/View/patient_on_boarding.dart';
import '../Main Screens/Patient_Flow/Patient_PSC_test/View/patient_psc_test.dart';
import '../Main Screens/Patient_Flow/Patient_Pay_Now/View/patient_pay_now.dart';
import '../Main Screens/Patient_Flow/Patient_Payment_Method/View/patient_payment_method.dart';
import '../Main Screens/Patient_Flow/Patient_Profile/View/patient_profile.dart';
import '../Main Screens/Patient_Flow/Patient_Schedule_Appointment/View/patient_schedule_appointment.dart';
import '../Main Screens/Patient_Flow/Patient_Select_Doctor_List/View/patient_select_doctor_list.dart';
import '../Main Screens/Patient_Flow/Patient_Terms_Condition/View/patient_terms_condition.dart';
import '../Main Screens/Patient_Flow/Petient_My_Visits/View/patient_my_visit.dart';
import '../Main Screens/Teacher_FLow/TeacherOnBoardingScreen/View/teacher_on_boarding_screen.dart';
import '../Main Screens/Teacher_FLow/TeacherPSCTest/View/teacher_psc_test.dart';
import '../Main Screens/Teacher_FLow/TeacherStudentProfile/View/teacher_student_profile.dart';
import '../Main Screens/Teacher_FLow/TeacherStudentRegister/View/teacher_student_register_screen.dart';
import '../Main Screens/Teacher_FLow/TeacherZoomDrawer/View/drawer_screen.dart';
import 'app_route_name.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) {
          switch (routeSettings.name) {
            case AppRouteName.SPLASH_ROUTE:
              return SplashScreen();
            case AppRouteName.SELECT_USER_SCREEN_ROUTE:
              return const SelectUser();
            case AppRouteName.LOGIN_SCREEN:
              LoginRoutingArguments? _loginRoutingArguments =
                  routeSettings.arguments as LoginRoutingArguments?;
              return LoginScreen(
                userType: _loginRoutingArguments?.userType,
              );
            case AppRouteName.SIGNUP_SCREEN:
              return const SignUpScreen();
            case AppRouteName.PATIENT_DASHBOARD_SCREEN_ROUTE:
              return const PatientDashboardScreen();
            case AppRouteName.PATIENT_BOTTOM_BAR_DASHBOARD_SCREEN_ROUTE:
              return PatientBottomBarScreen();
            case AppRouteName.PATIENT_MY_VISIT_SCREEN_ROUTE:
              return const PatientMyVisit();
            case AppRouteName.PATIENT_CLINICAL_FEEDBACK_SCREEN_ROUTE:
              PatientClinicalFeedbackRoutingArguments?
                  _patientClinicalFeedbackRoutingArguments = routeSettings
                      .arguments as PatientClinicalFeedbackRoutingArguments?;
              return PatientClinicalFeedback(
                showEditButton: _patientClinicalFeedbackRoutingArguments
                    ?.showEditFeedbackButton,
              );
            case AppRouteName.PATIENT_DOCTOR_DETAILS_SCREEN_ROUTE:
              return const PatientDoctorDetails();
            case AppRouteName.PATIENT_TERMS_CONDITION_SCREEN_ROUTE:
              return const PatientTermsCondition();
            case AppRouteName.PATIENT_PROFILE_SCREEN_ROUTE:
              return const PatientProfile();
            case AppRouteName.PATIENT_EDIT_PROFILE_SCREEN_ROUTE:
              return const PatientEditProfile();
            case AppRouteName.ON_BOARDING_SCREEN:
              return const PatientOnBoarding();
            case AppRouteName.DOCTOR_SIGNUP_SCREEN:
              return const DoctorSignUpPersonalInformation();
            case AppRouteName.DOCTOR_ACADEMIC_INFORMATION_SCREEN:
              return const DoctorAcademicInformation();
            case AppRouteName.DOCTOR_PERSONAL_EXPERIENCE_SCREEN:
              return const DoctorProfessionalExperience();
            case AppRouteName.DOCTOR_DASHBAORD_SCREEN_ROUTE:
              return const DoctorDashBoard();
            case AppRouteName.DOCTOR_DRAWER_SCREEN_ROUTE:
              return DoctorDrawer();
            case AppRouteName.DOCTOR_PATIENTS_HISTORY_SCREEN_ROUTE:
              return const DoctorPatientsHistory();
            case AppRouteName.DOCTOR_PATIENTS_HISTORY_DETAIL_SCREEN_ROUTE:
              return const DoctorPatientDetails();
            case AppRouteName.DOCTOR_CREATE_PRESCRIPTION_SCREEN_ROUTE:
              return const DoctorCreatePrescription();
            case AppRouteName.DOCTOR_UPCOMING_APPOINTMENT_DETAIL_SCREEN_ROUTE:
              return const DoctorUpcomingAppointmentDetail();
            case AppRouteName.DOCTOR_UPCOMING_APPOINTMENT_LIST_SCREEN_ROUTE:
              return const DoctorUpcomingAppointmentList();
            case AppRouteName.PATIENT_PSC_TEST_SCREEN_ROUTE:
              return const PatientPSCTest();
            case AppRouteName.PATIENT_SCHEDULE_APPOINTMENT_SCREEN_ROUTE:
              return const PatientScheduleAppointmwnt();
            case AppRouteName.PATIENT_DOCTOR_SELECT_LIST_SCREEN_ROUTE:
              return const PatientSelectDoctorList();
            case AppRouteName.PATIENT_PAYMENT_METHOD_SCREEN_ROUTE:
              return const PatientPaymentMethod();
            case AppRouteName.PATIENT_PAY_NOW_SCREEN_ROUTE:
              return const PatientPaNow();
            case AppRouteName.CHAT_LIST_SCREEN_ROUTE:
              return const ChatList();
            case AppRouteName.CHAT_DETAIL_SCREEN_ROUTE:
              return const ChatDetail();
            case AppRouteName.INSTITITE_SIGN_UP_SCREEN_ROUTE:
              return const InstituteSignUp();
            case AppRouteName.INSTITITE_DASHBOARD_SCREEN_ROUTE:
              return const InstituteConcernedDashboard();
            case AppRouteName.INSTITITE_DRAWER_SCREEN_ROUTE:
              return InstituteDrawer();
            case AppRouteName.STUDENT_REGISTRATION_SCREEN_ROUTE:
              return const StudentRegistration();
            case AppRouteName.TEACHER_REGISTRATION_SCREEN_ROUTE:
              return const TeacherRegistration();
            case AppRouteName.TEACHER_PROFILE_SCREEN_ROUTE:
              return const TeacherProfile();
            case AppRouteName.STUDENT_PROFILE_SCREEN_ROUTE:
              return const StudentProfile();
            case AppRouteName.TEACHER_SIGN_UP_SCREEN_ROUTE:
              return const TeacherSignUpScreen();
            case AppRouteName.TEACHER_DRAWER_SCREEN_ROUTE:
              return TeacherDrawer();
            case AppRouteName.TEACHER_STUDENT_REGISTER_SCREEN_ROUTE:
              return const TeacherStudentRegistration();
            case AppRouteName.TEACHER_STUDENT_PROFILE_SCREEN_ROUTE:
              return const TeacherStudentProfile();
            case AppRouteName.TEACHER_PSC_TEST_SCREEN_ROUTE:
              return const TeacherPSCTest();
            case AppRouteName.TEACHER_ON_BOARDING_SCREEN_ROUTE:
              return const TeacherOnBoarding();
            default:
              return Container();
          }
        });
  }
}
