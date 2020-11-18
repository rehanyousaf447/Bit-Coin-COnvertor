import 'Networking.dart';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
  'PKR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
//const bitcoinAverageURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '4906CA43-852C-4FA7-A35D-F1BA886BEE04';
class CoinData {


  Future GetCoinData(String selectedCurrency)async{
    Map<String,String> cryptoprices={};


    for(String crypto in cryptoList ) {

      try {
        String requestURL = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';

        NetworkingHelper networkingHelper = NetworkingHelper(requestURL);
        var coinData = await networkingHelper.getData();
        print(coinData);
        double lastprice = coinData['rate'];
        print('last price was:' + lastprice.toString());
        cryptoprices[crypto] = lastprice.toStringAsFixed(0);
        print(lastprice);
      }catch(e){
        print(e);
      }
    }


    return cryptoprices;
  }


}















