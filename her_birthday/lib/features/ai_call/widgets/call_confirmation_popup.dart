// import 'package:flutter/material.dart';
// import 'package:vapinew/vapinew.dart';

// class ConfirmationCallPopup extends StatefulWidget {
//   final String title;
//   final VoidCallback onYes;
//   final VoidCallback onNo;

//   const ConfirmationCallPopup({
//     Key? key,
//     required this.title,
//     required this.onYes,
//     required this.onNo,
//   }) : super(key: key);

//   @override
//   State<ConfirmationCallPopup> createState() => _ConfirmationCallPopupState();
// }

// class _ConfirmationCallPopupState extends State<ConfirmationCallPopup> {
//   String buttonText = 'Start Call';
//   bool isLoading = false;
//   bool isCallStarted = false;
//   late Vapi vapi;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: IconButton(
//               icon: const Icon(Icons.close),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 widget.title,
//                 style: const TextStyle(
//                     fontSize: 24, fontFamily: 'Urbanist-extrabold'),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             decoration: BoxDecoration(
//                 color: Colors.black, borderRadius: BorderRadius.circular(30)),
//             child: TextButton(
//               onPressed: () {
//                 widget.onYes();
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 'Yes',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'Urbanist-extrabold',
//                     fontSize: 18),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           TextButton(
//             onPressed: () {
//               widget.onNo();
//               Navigator.of(context).pop();
//             },
//             child: const Text(
//               'No',
//               style: TextStyle(
//                   fontFamily: 'Urbanist-extrabold',
//                   fontSize: 18,
//                   color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
