import 'package:flutter/material.dart';

void main() {
  runApp(CarbonFootprintCalculator());
}

class CarbonFootprintCalculator extends StatefulWidget {
  @override
  _CarbonFootprintCalculatorState createState() =>
      _CarbonFootprintCalculatorState();
}

class _CarbonFootprintCalculatorState extends State<CarbonFootprintCalculator> {
  double electricityConsumption = 0.0;
  double vehicleFuelConsumption = 0.0;
  double airTravelDistance = 0.0;
  double meatConsumption = 0.0;
  double dairyConsumption = 0.0;
  double fruitVegConsumption = 0.0;
  double paperWaste = 0.0;
  double plasticWaste = 0.0;
  double foodWaste = 0.0;
  double heatingConsumption = 0.0;
  double coolingConsumption = 0.0;
  double waterConsumption = 0.0;

  double carbonFootprint = 0.0;

  void calculateCarbonFootprint() {
    setState(() {
      carbonFootprint =
          carbonFootprintFromElectricity(electricityConsumption) +
              carbonFootprintFromVehicle(vehicleFuelConsumption) +
              carbonFootprintFromAirTravel(airTravelDistance) +
              carbonFootprintFromMeat(meatConsumption) +
              carbonFootprintFromDairy(dairyConsumption) +
              carbonFootprintFromFruitVeg(fruitVegConsumption) +
              carbonFootprintFromPaperWaste(paperWaste) +
              carbonFootprintFromPlasticWaste(plasticWaste) +
              carbonFootprintFromFoodWaste(foodWaste) +
              carbonFootprintFromHeating(heatingConsumption) +
              carbonFootprintFromCooling(coolingConsumption) +
              carbonFootprintFromWater(waterConsumption);
    });
  }

  double carbonFootprintFromElectricity(double electricityConsumption) {
    double carbonFactor = 0.5; // A carbon factor based on electricity consumption
    return electricityConsumption * carbonFactor;
  }

  double carbonFootprintFromVehicle(double fuelConsumption) {
    double carbonFactor = 2.3; // A carbon factor based on fuel consumption
    return fuelConsumption * carbonFactor;
  }

  double carbonFootprintFromAirTravel(double distance) {
    double carbonFactor = 0.15; // A carbon factor depending on flight distance
    return distance * carbonFactor;
  }

  double carbonFootprintFromMeat(double consumption) {
    double carbonFactor = 6.5; // A carbon factor linked to meat consumption
    return consumption * carbonFactor;
  }

  double carbonFootprintFromDairy(double consumption) {
    double carbonFactor = 4.2;
    return consumption * carbonFactor;
  }

  double carbonFootprintFromFruitVeg(double consumption) {
    double carbonFactor = 1.1;
    return consumption * carbonFactor;
  }

  double carbonFootprintFromPaperWaste(double waste) {
    double carbonFactor = 1.2;
    return waste * carbonFactor;
  }

  double carbonFootprintFromPlasticWaste(double waste) {
    double carbonFactor = 3.0;
    return waste * carbonFactor;
  }

  double carbonFootprintFromFoodWaste(double waste) {
    double carbonFactor = 0.5;
    return waste * carbonFactor;
  }

  double carbonFootprintFromHeating(double consumption) {
    double carbonFactor = 0.9;
    return consumption * carbonFactor;
  }

  double carbonFootprintFromCooling(double consumption) {
    double carbonFactor = 0.6;
    return consumption * carbonFactor;
  }

  double carbonFootprintFromWater(double consumption) {
    double carbonFactor = 0.3;
    return consumption * carbonFactor;
  }

  Widget buildFeedbackSection() {
    List<String> energySavingTips = [
      'Turn off the light when not in use.',
      'Use energy efficient bulbs.',
      'Unplug electronic devices you are not using.',
    ];

    List<String> transportationTips = [
      'Use public transport or car sharing.',
      'Walk or cycle short distances.',
      'Choose fuel efficient vehicles.',
    ];

    List<String> foodConsumptionTips = [
      'Eat foods produced locally and in season.',
      'Reduce the consumption of meat and dairy products.',
      'Reduce food waste to a minimum.',
    ];

    List<String> wasteGenerationTips = [
      'Recycle paper, plastic and glass waste.',
      'Compost organic waste.',
      'Avoid single-use products.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Recommendations for Reducing the Carbon Footprint:',
          style: TextStyle(
            color: Colors.green,
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          'ENERGY SAVING:',
          style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        for (String tip in energySavingTips)
          Text('- $tip'),
        SizedBox(height: 15.0),
        Text(
          'TRANSPORTATION:',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        for (String tip in transportationTips)
          Text('- $tip'),
        SizedBox(height: 15.0),
        Text(
          'FOOD CONSUMPTION:',
          style: TextStyle(
            color: Colors.purpleAccent,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        for (String tip in foodConsumptionTips)
          Text('- $tip'),
        SizedBox(height: 15.0),
        Text(
          'CREATING WASTE:',
          style: TextStyle(
            color: Colors.lightGreen,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        for (String tip in wasteGenerationTips)
          Text('- $tip'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CARBON FOOTPRINT CALCULATOR'
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Enter the Values:',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Electricity Consumption (kWh)',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      electricityConsumption = double.parse(value);
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Vehicle Fuel Consumption (Liters)',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      vehicleFuelConsumption = double.parse(value);
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Air Travel (km)',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      airTravelDistance = double.parse(value);
                    });
                  },
                ),


                SizedBox(height: 18.0),
                ElevatedButton(
                  onPressed: calculateCarbonFootprint,
                  child: Text('CALCULATE'),
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.lightBlue,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Carbon Footprint: $carbonFootprint',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                buildFeedbackSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
