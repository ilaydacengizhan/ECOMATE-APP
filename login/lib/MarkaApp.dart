import 'package:flutter/material.dart';

void main() {
  runApp(MarkaApp());
}

class MarkaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sustainable Brand Recommendations',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sustainable Brand Recommendations'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.eco),
            title: Text(recipes[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RecipeDetailScreen(recipe: recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error);
              },
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              'Products:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(recipe.ingredients),
            SizedBox(height: 16.0),
            Text(
              'Features:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(recipe.instructions),
          ],
        ),
      ),
    );
  }
}

class Recipe {
  final String title;
  final String ingredients;
  final String instructions;
  final String imageUrl;

  Recipe({
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.imageUrl,
  });
}

List<Recipe> recipes = [
  Recipe(
    title: 'Biolage',
    ingredients:
    'Color protection cream, Purifying shampoo, Moisturizing shampoo, Renewing shampoo, Care creams ',
    instructions:
    'Biolage is one of the model eco-friendly companies with the steps it has taken towards sustainability. The company has been neutral in CO2 emissions at its factories since 2015 and at its corporate headquarters since 2017. Thanks to innovative recycling processes with nanofiltration and reverse osmosis, all wastes are reused.One of the biggest problems facing our world today is plastic pollution. For this reason, it uses a process called “light weighting”, which helps to minimize the amount of plastic needed in its packaging.But not only does it reduce the consumption of unprocessed plastic, but it also uses 100% recycled and recyclable plastic in product packaging to help reduce the existing plastic on our planet, thereby helping to combat the global plastic crisis we are facing.',
    imageUrl:
    'https://www.dermomarket.com/Data/EditorFiles/V4MarkaUst/biolage/biolage-mobil.jpg',
  ),
  Recipe(
    title: 'Davines',
    ingredients:
    'Shampoo, Hair Serum, Hair Mask, Conditioner, Hair Dye, Hair Styling Cream and Wax, Hair Care Kit, Hair Spray, Body Creams & Exfoliating, Sun Products, Dye Lightener, Hair Foam, Care Oils, Hair Whitening and Moisturizing Cream',
    instructions:
    'Italian brand Davines has a number of sustainable initiatives.100% of the electricity used in production is used from renewable sources. It does not use single-use plastic in packaging. However, the company announced that it has achieved carbon neutral status in packaging production.',
    imageUrl:
    'https://behindthechair.com/wp-content/uploads/2021/05/davines-logo.jpg',
  ),
  Recipe(
    title: 'Weleda Calendula',
    ingredients:
    'Roll-on & Stick Massage Oil, Facial Cleansers,Deodorant,Lip Care, Baby Toothbrush, Eye Serum, Eye Cream, Lip Balm and Peeling',
    instructions:
    'More than 75% of the plant content of the environmentally friendly Weleda Calendula products of German origin comes from biodynamic or organic farming or controlled wild harvesting. Its commitment to biodiversity and the ethical treatment of employees has been recognized by the Ethical BioTrade Association – it is one of only two cosmetic brands bearing the UEBT logo and the first brand to earn the Look For The Zero badge due to the fact that it does not contain any types of plastic.Quality Standards: It is produced using organic and natural plant extracts. it is 100% nature certified. (www.Natrue.Org ) Have not been tested on animals. It does not contain parabens and phthalates. It does not contain synthetic perfumes and dyes. It does not contain silicone. It does not contain sls.',
    imageUrl:
    'https://www.etos.nl/dw/image/v2/BCTN_PRD/on/demandware.static/-/Sites-etos-master-catalog/default/dwfe21dd42/images/110339101/110339101_MCM_PACK_1220181.jpg?sw=650&sfrm=png&q=75',
  ),
  Recipe(
    title: 'Kiehls',
    ingredients:
    'Lip Balm and Exfoliation, Conditioner, Hand Cream, Shaving Foam & Gel Care Oils, Deodorant, Roll-on & Stick Hair Mask, Body Exfoliation',
    instructions:
    'On a global scale, Kiehls supports renewable energy to protect the environment, tries to protect the ocean, parks and open spaces through sponsorships, and works diligently to use the unique mineral and organic ingredients offered by nature in its products. At the same time, in this process extending from the contents of the products to the packaging, we can understand that the brand shows the same sensitivity from the herbal extract inks used on product labels and recyclable materials used on packaging..',
    imageUrl:
    'https://play-lh.googleusercontent.com/RPRSCbCkOS3NJdlQ3iOcGBh-uTrzH6GbKDy_fjpK8vGbKR1746Y1ZUXzzlrzfRMBqvc',
  ),
  Recipe(
    title: 'Tommy Jeans  ',
    ingredients: ' jeans, polo, T-shirt',
    instructions:
    'In her 100% recycled denim designs, she uses cotton fabric scraps collected from the floors of garment manufacturing plants. Another source that gives life to the same design group is the fabrics of bed linen obtained from the hospitality sector and reworked with an innovative technique. Jul. While the industry average for the use of recycled cotton is 30 percent, Tommy Jeans uses 100 percent recycled cotton denim.',
    imageUrl:
    'https://i.pinimg.com/564x/01/ba/34/01ba34441621dff2fd98af399ff4c6ff.jpg',
  ),
  Recipe(
    title: 'Veja ',
    ingredients: 'Shoe ',
    instructions:
    'The brand, which also complies with fair working conditions, is seen as the first sustainable initiative in the field of footwear.Veja shoes are made from organic cotton and rubber grown on organic farms in South America, usually in Brazil. The Veja brand also uses a waterproof plastic mesh made by recycling plastic bottles collected from the streets of Rio de Janeiro and São Paulo in some of its models. ',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Veja_%28brand%29.svg/1200px-Veja_%28brand%29.svg.png',
  ),
  Recipe(
    title: 'Matt & Nat',
    ingredients: 'bags, outerwear, accessories and shoes',
    instructions:
    'Vegan brand Matt & Nat was founded in 1995 by its founders, who were impressed by the beauty of nature around them. So much so that the name Matt & Nat is an abbreviation of the words “material” and “natural”. The brand produces minimalist and timeless bags, outerwear, accessories and shoes with sustainable materials such as cork, rubber, nylon, cardboard and even bicycle tires. She uses only vegan leather and makes stylish and well-made fashion pieces with it that can last for decades.',
    imageUrl:
    'https://my-greenstyle.com/wp-content/uploads/sliderImages/Matt-Nat-Logo-31w0i9ie04047fqbwyzw8w.jpg',
  ),
  Recipe(
    title: 'gülsha',
    ingredients:
    'Face Cream, Makeup Remover, Body Creams, Hand Cream ,Facial Cleansers, Facial Massage ,Tool Lipstick...',
    instructions:
    'It formulates practical and minimalist skin care products in a way that does not harm the environment and human health with the use of ECOCERT and naturally sourced ingredients. It aims to protect nature and animals by using raw materials, most of which are vegan. The gulsha brand, which respects the environment and has a high sense of responsibility, fulfills the legal obligations related to the recycling of packaging waste and makes a financial contribution to the recycling system by using the Green Dot brand. It strives for near-zero waste by using the waste generated after the production of rose water and rose oil for soil fertilizer. Pet sleeve, which is used by products to protect the integrity of packaging, has reduced the material usage by 68%. Reduced the use of PP bottle label by 84%. We continue our efforts to minimize the use of cardboard in our products. It makes the delivery of our orders on online platforms with recyclable cargo boxes.',
    imageUrl:
    'https://www.dermomarket.com/Data/EditorFiles/V4MarkaUst/gulsha/gulsha-mobil.jpg',
  ),
  Recipe(
    title: 'Sinek Sekiz',
    ingredients: 'Book,notebook',
    instructions:
    'Founded 9 years ago in order to translate the basic works in environmental literature into Turkish, Sinc Sekiz Sekiz designs notebooks by converting waste paper in addition to its inspiring books. The roots of the Sinik Sekiz Sekiz brand created by Irem Çağıl are connected to the rhythm of nature.',
    imageUrl:
    'https://i.pinimg.com/280x280_RS/36/ba/6d/36ba6ddcaccb20a94c02f63eaf215c5f.jpg',
  ),
  Recipe(
    title: 'UNIQKA',
    ingredients: 'Design Products',
    instructions:
    'The UNIQKA brand, which keeps leather material and handwork at the focus of the design, offers timeless objects that reflect the versatility and elegance of leather for living spaces. They contribute to the circular economy with their sustainable designs.',
    imageUrl:
    'https://cdn3.hipicon.com/images/Designers/2015/06/29/1435591006_1.jpeg',
  ),
  Recipe(
    title: 'prAna',
    ingredients:
    'We offer a wide range of products for swimming, hiking, climbing sports, especially yoga, as well as travel-appropriate clothing for both men and women',
    instructions:
    'prAna is a sustainable outdoor and active lifestyle brand founded in 1992. Only materials such as organic cotton and recycled wool are used. prAna also takes Fair Trade certified steps and works in conjunction with Bluesign technology to ensure that the ocean and air remain free of dangerous chemicals. ',
    imageUrl:
    'https://images.squarespace-cdn.com/content/v1/57758a321b631b4bf5591587/1474930116308-GN9W85SSRHDAA56XXY4Y/Logo-Concept-1.png',
  ),
  Recipe(
    title: 'SuCo',
    ingredients:
    'eco-friendly water flask',
    instructions:
    'SuCo, which defines itself as a sustainable solution partner and an environmentally friendly water bottle brand, was founded in 2015 with the mission of improving water drinking habits and reducing single-use pet bottles in Turkey. The mission of SUCO, which reaches consumers who adopt a sustainable and healthy lifestyle with the motto Live flexibly, drink water, is to tell a story that we take good care of both ourselves and our planet. SuCo, which produces light, foldable and easily portable canteens in a bag instead of heavy and space-occupying canteens, brings the shopping experience to a completely environmentally friendly position with compostable and soil-degradable cargo bags produced using environmentally friendly technologies.',
    imageUrl:
    'https://www.mataramasu.co/cdn/shop/files/uu_4e65d09f-56af-4eae-9beb-1ac7dac88e91.jpg?v=1696597867&width=1000',
  ),
];
