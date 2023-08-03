// // ignore_for_file: unnecessary_null_comparison
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:math_expressions/math_expressions.dart';
// import 'package:my_calculator/Model/button_list.dart';
// class ModelBtn extends GetxController {
//   RxString input = '0'.obs;
//   RxString output = '0'.obs;
//   // Parser p = Parser();
//   final number = num;
//   final myList = btnList;
//   final myOperators = operatorList;
//    String oprate = '';
  
//   void theOperations(int index, List<String> btnList) {
//     if (index == 0) {
//       input.value = '0';
//       output.value = '0';
//     } else if (index == 1) {
//       if (input.value.isEmpty) {
//         return null;
//       }  
//       input.value = input.substring(0, input.value.length - 1);
//     }
//     else if(index == 19){
//     }
//     else { checkForOperator(btnList[index]);
//       if(isOperator(btnList[index])) {

//       updateOprator(btnList[index]);
//       }
//       else {  //isOperatorExist(btnList[index]);
//       input.value += btnList[index];

//       calculation(btnList[index]);
//       // addInInput(btnList[index]);
//       // performCalculation(btnList[index]);
//       }
//     }
//   }
//   bool isOperator(String x) {
//     if (x == '%' ||
//         x == '/' ||
//         x == 'X' ||
//         x == '-' ||
//         x == '+' ||
//         x == '=' ||
//         x == '√') {
//       return true;
//     }
//     return false;
//   }
//   void addInInput(String value) {
//     if (input.value == '' && myOperators.contains(value)) {
//       input.value = '0 $value';
//     }
//   }
// void performCalculation(String inputString) {
//   const operators = "+,- ,* ,/ ,%";
//   List<String> parts = inputString.split(operators);
//   // parts.removeWhere((element) => element.trim().isEmpty);
//   double result = double.tryParse(parts[0]) ?? 0.0;
//   for (int i = 1; i < parts.length; i += 2) {
//     String operator = parts[i];
//     double operand = double.tryParse(parts[i + 1]) ?? 0.0;
//     if (operand != null) {
//       switch (operator) {
//         case "+":
//           result += operand;
//           break;
//         case "-":
//           result -= operand;
//           break;
//         case "*":
//           result *= operand;
//           break;
//         case "/":
//           if (operand != 0) {
//             result /= operand;
//           } else {
//             output.value = "Error: Division by zero";
//             return;
//           }
//           break;
//         default:
//           output.value = "Error: Invalid operator: $operator";
//           return;
//       }
//     } else {
//       output.value = "Error: Invalid operand: ${parts[i + 1]}";
//       return;
//     }
//   print("Result: $result");
//   output.value = result.toString();
// }
// }
// void updateOprator(String value) {
//    String lastCharacter = input.isNotEmpty ? input.substring(input.value.length - 1) : '';
//   if(isOperator(lastCharacter)){
//     input.value = input.value.replaceRange(input.value.length-1, input.value.length, value);
//   }
//  else {
//     input.value += value;
//   }
// }
// bool checkForOperator(String input) {
//   List<String> operators = ['+', '-', '*', '/'];
//   for (int i = 0; i < input.length; i++) {
//     if (operators.contains(input[i])) {
//       return true;
//     }
//   }
//   return false;
// }
// // bool isOperatorExist( String value){
// //   List <String> list = input.split('');
// //   print(list);
// //   if(list.contains(myOperators)){
// //    return true;
// //   } else{

// //   return false;
// //   }
// // }
// // void calculation(String value){
// //   if(oprate == ''){
// //     oprate = value;
// //     }
// //     print(checkForOperator(value));
// //   if(checkForOperator(value)){
// //     print(checkForOperator(value));
// //   if(oprate != ''  ){
// //     List <String> list = input.split(oprate);
// //     double num = double.parse(list[0]);
// //     double num2 = double.parse(list[1]);
// //     print(num+num2);
// //     }else {
// //       input.value += value;
// //     }
// //   }
// //   else{
// //     // input.value += value;
// //     print('a');

// //   }
// // }

// }


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/Model/button_list.dart';
class ModelBtn extends GetxController {
  RxString input = ''.obs;
  RxString output = ''.obs;
  RxList<String> splittedList = [''].obs;
  String operator = '';
  final myList = btnList;
  final myOperators = operatorList;
 dynamic colorCondition(
    int index,
  ) { 
    if (index == 0 || index == 1 || index == 3 || index == 2 || index == 7 || index == 17 || index == 15 || index ==16
     || index == 19 || index == 18 || index == 11)  {
      return Colors.black87;
    }
     else {
      return Colors.grey;
    }
  }
  void operations(int index, List<String> btnList) {
    if (index == 0) {
      input.value = '';
      output.value = '';
    } else if (index == 1) {
      if (input.value.isEmpty) {
        return null;
      }
      input.value = input.substring(0, input.value.length - 1);
    } else if (index == myList.length - 1) {
      isOperatorExist(input.value, splittedList);
      output.value = output.value;
    } else { isDotAllowed(myList[index]);
      updateOperatorInInput( myList[index]);
    }
  }
  void updateOperatorInInput(String value) {
    String lastCharacter = input.isNotEmpty ? input.substring(input.value.length - 1) : '';
    if (myOperators.contains(lastCharacter) && myOperators.contains(value)) {
      input.value = input.value.replaceRange(input.value.length - 1, input.value.length, '');
    }
    input.value += value;
  }
  bool isOperatorExist(String value, List<String> newList) {
    for (String currentOperator in myOperators) {
      if (value.contains(currentOperator)) {
        newList = value.split(currentOperator);

        String part1 = newList[0];
        String part2 = newList[1];

        double num1 = double.parse(part1);
        double num2 = double.parse(part2);

        switch (currentOperator) {
          case "+":
            output.value = (num1 + num2).toString();
            break;
          case "-":
            output.value = (num1 - num2).toString();
            break;
          case "X":
            output.value = (num1 * num2).toString();
            break;
          case "/":
            output.value = (num1 / num2).toString();
            break;
          case "%":
            output.value = {double.parse(newList[0]) / 100}.toString();
            break;
            case '√`':
          output.value = sqrt(num1).toString();
      break;
        }
      }
    }
    return false;
  }

  bool isDotAllowed(String value) {
  try {
    // Check if there is a dot before an operator
    if (value.contains(RegExp(r'\.\+|\.\-|\.\*|\.\/'))) {
      return false;
    }
    // Check if there is more than one dot after an operator
    List<String> operators = ['+', '-', '*', '/'];
    for (String operator in operators) {
      if (input.contains(operator)) {
        List<String> parts = input.split(operator);
        if (parts.length > 1 && parts[1].contains('.')) {
          List<String> subParts = parts[1].split('.');
          if (subParts.length > 2) {
            return false;
          }
        }
      }
    }
    
    return true;
  } catch (e) {
    // Log the error
    print('Error: $e');
    return false;
  }
}
}