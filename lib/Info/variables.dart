import 'package:flutter/cupertino.dart';

final TextEditingController otpEntered = new TextEditingController();
final TextEditingController mobileNumber = new TextEditingController();
// bool isLogged=false;
var token = null;
//user data
var userName = "Name";
var emailId = "Email";
var referralCode = "1121";
var coins = "0";
var phone = "phone";
var City;
var UserCity;
bool login = false;
var selectedCity = "Mumbai";
var oname = "0";
var cityname = "0";
var gymAddress = "0";
var currate="123";
var newrate="234";
// var index;
var trainers;
var AccountDetails,upcomingsessions,pastsessions,spackages,gpackages;
var unpaidPackages,paidPackages,rates;
var unpaidPackagesId;
var address;

var g1=400;
var g5=600;
var g10=800;
var s1=200;
var s5=400;
var s10=700;

var slots;
//slot data
List<String> sTodayData = new List<String>();
List<String> sTomorrowData = new List<String>();
List<String> sDayAfterTomData = new List<String>();
List<String> gTodayData = new List<String>();
List<String> gTomorrowData = new List<String>();
List<String> gDayAfterTomData = new List<String>();
List<String> gpTodayData = new List<String>();
List<String> gpTomorrowData = new List<String>();
List<String> gpDayAfterTomData = new List<String>();

var now = DateTime.now();
var dayAfter;
var selectedId = "5dcaebb32fadc609ce3254cb";
var centers = null;
var selectedCenter;
var selectedIdAddress;
var activePackages, upcomingSlots, completedSlots, inactivePackages;
var selectedIdName;
var silverPackages, goldPackages, dodoSPackages, dodoGPackages;
int temp;

TextEditingController userNameController = new TextEditingController();
TextEditingController emailIdController = new TextEditingController();
TextEditingController referralCodeController = new TextEditingController();
TextEditingController ownerNAmeController = new TextEditingController();
TextEditingController gymAddressController = new TextEditingController();
TextEditingController cityNameController = new TextEditingController();
TextEditingController addressController = new TextEditingController();
const url = "http://34.93.104.9:3000/api";
