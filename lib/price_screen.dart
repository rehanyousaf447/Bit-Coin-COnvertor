import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency='USD';

  DropdownButton getDropDownbutton()
  {
    List<DropdownMenuItem> mylist=[];
    for(String currency in currenciesList){
      mylist.add(
          DropdownMenuItem(
            child: Text(currency),
            value: currency,
          )
      );
    }
    return DropdownButton(
      iconSize: 50.0,
      value: selectedCurrency,
      items: mylist,
      onChanged: (value){
        print(value);
        setState(() {
          selectedCurrency=value;
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker()
  {
    List<Text> myList=List();
    for(String item in currenciesList){

      myList.add(Text(item));
    }


    return CupertinoPicker(
      itemExtent: 32.0,
      children: myList,
      onSelectedItemChanged: (value){
        print(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:Platform.isIOS ? getCupertinoPicker():
            getDropDownbutton(),
          ),
        ],
      ),
    );
  }
}










// CupertinoPicker IOSPicker() {
//   //   List<Text> currencyList = [];
//   //   for (String labels in currenciesList) {
//   //     currencyList.add(Text(labels));
//   //   }
//   //   return CupertinoPicker(
//   //       itemExtent: 32.0,
//   //       backgroundColor: Colors.lightBlue,
//   //       onSelectedItemChanged: (selectedItem) {
//   //         setState(() {
//   //           getCoinData();
//   //           label = currenciesList[selectedItem];
//   //         });
//   //       },
//   //       children: currencyList);
//   // }
//   //
//   // String label = 'USD';
//   // CoinData coinData = CoinData();
//   // double value;
//   // bool iswaiting = false;
//   // Map<String,String> cryptoPrices={};
//   //
//   // Column makeCards() {
//   //   List<CryptoCard> cryptoCards = [];
//   //   for (String crypto in cryptoList) {
//   //     cryptoCards.add(
//   //       CryptoCard(
//   //         cryptoCurrency: crypto,
//   //         selectedCurrency: label,
//   //         value: iswaiting? '?':cryptoPrices[crypto],
//   //       ),
//   //     );
//   //   }
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.stretch,
//   //     children: cryptoCards,
//   //   );
//   // }
//   //
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getCoinData();
//   // }
//   //
//   // void getCoinData() async{
//   //   this.iswaiting=true;
//   //   var cryptop = await coinData.GetCoinData(label);
//   //   this.iswaiting = false;
//   //   setState(() {
//   //     cryptoPrices = cryptop;
//   //   });
//   // }
//   //
//   // DropdownButton AndriodPicker() {
//   //   List<DropdownMenuItem<String>> currencyList = [];
//   //
//   //   for (String Labels in currenciesList) {
//   //     currencyList.add(DropdownMenuItem(
//   //       value: Labels,
//   //       child: Text(Labels),
//   //     ));
//   //   }
//   //   return DropdownButton(
//   //     value: label,
//   //     items: currencyList,
//   //     onChanged: (value) {
//   //       setState(() {
//   //         getCoinData();
//   //         label = value;
//   //       });
//   //     },
//   //     iconEnabledColor: Colors.black,
//   //   );
//   // }



































// import 'dart:ffi';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'coin_data.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:io' show Platform;
//
// class PriceScreen extends StatefulWidget {
//   @override
//   _PriceScreenState createState() => _PriceScreenState();
// }
//
// class _PriceScreenState extends State<PriceScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       appBar: AppBar(
//         title: Text('🤑 Coin Ticker'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             child: Card(
//               color: Colors.lightBlueAccent,
//               elevation: 5.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
//                 child: makeCards(),
//               ),
//             ),
//           ),
//           Container(
//             height: 150.0,
//             alignment: Alignment.center,
//             padding: EdgeInsets.only(bottom: 30.0),
//             color: Colors.lightBlue,
//             child:Platform.isAndroid?AndriodPicker(): IOSPicker(),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CryptoCard extends StatelessWidget {
//
//   final String value;
//   final String selectedCurrency;
//   final String cryptoCurrency;
//
//   CryptoCard({this.value, this.selectedCurrency, this.cryptoCurrency});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.lightBlueAccent,
//       elevation: 20.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Text(
//           '1 $cryptoCurrency = $value $selectedCurrency',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 20.0,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }


//CupertinoPicker IOSPicker() {
  //   List<Text> currencyList = [];
  //   for (String labels in currenciesList) {
  //     currencyList.add(Text(labels));
  //   }
  //   return CupertinoPicker(
  //       itemExtent: 32.0,
  //       backgroundColor: Colors.lightBlue,
  //       onSelectedItemChanged: (selectedItem) {
  //         setState(() {
  //           getCoinData();
  //           label = currenciesList[selectedItem];
  //         });
  //       },
  //       children: currencyList);
  // }
  //
  // String label = 'USD';
  // CoinData coinData = CoinData();
  // double value;
  // bool iswaiting = false;
  // Map<String,String> cryptoPrices={};
  //
  // Column makeCards() {
  //   List<CryptoCard> cryptoCards = [];
  //   for (String crypto in cryptoList) {
  //     cryptoCards.add(
  //       CryptoCard(
  //         cryptoCurrency: crypto,
  //         selectedCurrency: label,
  //         value: iswaiting? '?':cryptoPrices[crypto],
  //       ),
  //     );
  //   }
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     children: cryptoCards,
  //   );
  // }
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getCoinData();
  // }
  //
  // void getCoinData() async{
  //   this.iswaiting=true;
  //   var cryptop = await coinData.GetCoinData(label);
  //   this.iswaiting = false;
  //   setState(() {
  //     cryptoPrices = cryptop;
  //   });
  // }
  //
  // DropdownButton AndriodPicker() {
  //   List<DropdownMenuItem<String>> currencyList = [];
  //
  //   for (String Labels in currenciesList) {
  //     currencyList.add(DropdownMenuItem(
  //       value: Labels,
  //       child: Text(Labels),
  //     ));
  //   }
  //   return DropdownButton(
  //     value: label,
  //     items: currencyList,
  //     onChanged: (value) {
  //       setState(() {
  //         getCoinData();
  //         label = value;
  //       });
  //     },
  //     iconEnabledColor: Colors.black,
  //   );
  // }
