import 'package:flutter/material.dart';
import 'constants.dart';
import 'coin_data.dart';
import 'data.dart';

const apiKey = "3933E60D-EF0C-4654-B169-4A86576CE522";

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'INR';
  int? btcPrice;
  int? ethPrice;
  int? ltcPrice;
  @override
  void initState() {
    updateUI(selectedCurrency);
    super.initState();
  }

  void updateUI(String currency) async {
    NetworkHelper btcURL = NetworkHelper(
        "https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=$apiKey");
    dynamic btcData = await btcURL.getData();
    double btc = btcData['rate'];
    NetworkHelper ethURL = NetworkHelper(
        "https://rest.coinapi.io/v1/exchangerate/ETH/$currency?apikey=$apiKey");
    dynamic ethData = await ethURL.getData();
    double eth = ethData['rate'];
    NetworkHelper ltcURL = NetworkHelper(
        "https://rest.coinapi.io/v1/exchangerate/LTC/$currency?apikey=$apiKey");
    dynamic ltcData = await ltcURL.getData();
    double ltc = ltcData['rate'];
    setState(() {
      if (btcData == null || ethData == null || ltcData == null) {
        btcPrice = 0;
        ethPrice = 0;
        ltcPrice = 0;
      }
      btcPrice = btc.toInt();
      ethPrice = eth.toInt();
      ltcPrice = ltc.toInt();
    });
  }

  List<DropdownMenuItem<String>> dropDownItemList() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(
          currency,
        ),
      );
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'COIN TICKER',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: ksecondaryColour,
                      child: Center(
                        child: Text(
                          '1 BTC = $btcPrice $selectedCurrency',
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Card(
                      color: ksecondaryColour,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          '1 ETH = $ethPrice $selectedCurrency',
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: ksecondaryColour,
                      child: Center(
                        child: Text(
                          '1 LTC = $ltcPrice $selectedCurrency',
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 300.0,
          ),
          Container(
            height: 150.0,
            color: ksecondaryColour,
            child: Center(
              child: DropdownButton<String>(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                menuMaxHeight: 375.0,
                dropdownColor: Colors.white,
                value: selectedCurrency,
                items: dropDownItemList(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value.toString();
                    updateUI(selectedCurrency);
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
