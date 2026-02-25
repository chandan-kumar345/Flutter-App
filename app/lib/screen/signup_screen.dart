// import 'package:app/screen/signin_screen.dart';
// import 'package:flutter/material.dart';
//
// class DatingSignUpScreen extends StatefulWidget {
//   const DatingSignUpScreen({super.key});
//
//   @override
//   State<DatingSignUpScreen> createState() => _DatingSignUpScreenState();
// }
//
// class _DatingSignUpScreenState extends State<DatingSignUpScreen> {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//
//   DateTime? selectedDob;
//   String? selectedGender;
//
//   bool hidePassword = true;
//   bool hideConfirmPassword = true;
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   Future<void> pickDob() async {
//     final now = DateTime.now();
//
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime(now.year - 18),
//       firstDate: DateTime(1950),
//       lastDate: DateTime(now.year - 18),
//     );
//
//     if (picked != null) {
//       setState(() {
//         selectedDob = picked;
//       });
//     }
//   }
//
//   String formatDob(DateTime? dob) {
//     if (dob == null) return "Date of Birth";
//     return "${dob.day.toString().padLeft(2, "0")}-"
//         "${dob.month.toString().padLeft(2, "0")}-"
//         "${dob.year}";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF7F7FB),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               /// --- Header ---
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color(0xffF0435A),
//                       Color(0xffFF5E73),
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(28),
//                     bottomRight: Radius.circular(28),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                           onPressed: () => Navigator.pop(context),
//                           icon: const Icon(Icons.arrow_back_ios_new),
//                           color: Colors.white,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 2),
//                     const Text(
//                       "Create Account",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 26,
//                         fontWeight: FontWeight.w800,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     const Text(
//                       "Start meeting new people today ✨",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: Colors.white70,
//                         height: 1.4,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 22),
//
//               /// --- Form Card ---
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 18),
//                 child: Container(
//                   padding: const EdgeInsets.all(18),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(18),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.06),
//                         blurRadius: 20,
//                         offset: const Offset(0, 10),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       _inputField(
//                         controller: nameController,
//                         hint: "Full Name",
//                         icon: Icons.person_outline,
//                       ),
//                       const SizedBox(height: 14),
//
//                       _inputField(
//                         controller: emailController,
//                         hint: "Email",
//                         icon: Icons.email_outlined,
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                       const SizedBox(height: 14),
//
//                       /// DOB Picker
//                       InkWell(
//                         onTap: pickDob,
//                         borderRadius: BorderRadius.circular(14),
//                         child: Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 14,
//                             vertical: 16,
//                           ),
//                           decoration: BoxDecoration(
//                             color: const Color(0xffF7F7FB),
//                             borderRadius: BorderRadius.circular(14),
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(Icons.cake_outlined,
//                                   color: Colors.grey.shade600),
//                               const SizedBox(width: 12),
//                               Text(
//                                 formatDob(selectedDob),
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: selectedDob == null
//                                       ? Colors.grey.shade600
//                                       : Colors.black87,
//                                 ),
//                               ),
//                               const Spacer(),
//                               Icon(Icons.keyboard_arrow_down,
//                                   color: Colors.grey.shade600),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 14),
//
//                       /// Gender Dropdown
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 14),
//                         decoration: BoxDecoration(
//                           color: const Color(0xffF7F7FB),
//                           borderRadius: BorderRadius.circular(14),
//                         ),
//                         child: DropdownButtonHideUnderline(
//                           child: DropdownButton<String>(
//                             value: selectedGender,
//                             hint: Row(
//                               children: [
//                                 Icon(Icons.wc_outlined,
//                                     color: Colors.grey.shade600),
//                                 const SizedBox(width: 12),
//                                 Text(
//                                   "Gender",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey.shade600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             isExpanded: true,
//                             items: const [
//                               DropdownMenuItem(
//                                   value: "Male", child: Text("Male")),
//                               DropdownMenuItem(
//                                   value: "Female", child: Text("Female")),
//                               DropdownMenuItem(
//                                   value: "Other", child: Text("Other")),
//                             ],
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedGender = value;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 14),
//
//                       _passwordField(
//                         controller: passwordController,
//                         hint: "Password",
//                         icon: Icons.lock_outline,
//                         isHidden: hidePassword,
//                         onToggle: () {
//                           setState(() {
//                             hidePassword = !hidePassword;
//                           });
//                         },
//                       ),
//
//                       const SizedBox(height: 14),
//
//                       _passwordField(
//                         controller: confirmPasswordController,
//                         hint: "Confirm Password",
//                         icon: Icons.lock_outline,
//                         isHidden: hideConfirmPassword,
//                         onToggle: () {
//                           setState(() {
//                             hideConfirmPassword = !hideConfirmPassword;
//                           });
//                         },
//                       ),
//
//                       const SizedBox(height: 22),
//
//                       /// Sign Up Button
//                       SizedBox(
//                         width: double.infinity,
//                         height: 54,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xffF0435A),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(14),
//                             ),
//                             elevation: 0,
//                           ),
//                           onPressed: () {
//                             // TODO: signup logic
//                           },
//                           child: const Text(
//                             "Sign Up",
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 16),
//
//                       /// Already have account
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             "Already have an account? ",
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.black54,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => const SignInScreen()),
//                               );
//                             },
//                             child: const Text(
//                               "Sign in",
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w800,
//                                 color: Color(0xffF0435A),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 28),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Input Field
//   Widget _inputField({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         hintText: hint,
//         prefixIcon: Icon(icon, color: Colors.grey.shade600),
//         filled: true,
//         fillColor: const Color(0xffF7F7FB),
//         contentPadding: const EdgeInsets.symmetric(vertical: 18),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
//
//   /// Password Field
//   Widget _passwordField({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     required bool isHidden,
//     required VoidCallback onToggle,
//   }) {
//     return TextField(
//       controller: controller,
//       obscureText: isHidden,
//       decoration: InputDecoration(
//         hintText: hint,
//         prefixIcon: Icon(icon, color: Colors.grey.shade600),
//         filled: true,
//         fillColor: const Color(0xffF7F7FB),
//         contentPadding: const EdgeInsets.symmetric(vertical: 18),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: BorderSide.none,
//         ),
//         suffixIcon: IconButton(
//           icon: Icon(
//             isHidden ? Icons.visibility_off : Icons.visibility,
//             color: Colors.grey.shade600,
//           ),
//           onPressed: onToggle,
//         ),
//       ),
//     );
//   }
// }
