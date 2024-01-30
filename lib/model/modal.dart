class imgs {
  final String title;
  final List img;
  final int id;

  imgs({
    required this.title,
    required this.img,
    required this.id,
  });

  factory imgs.fromMap({required Map datas}) {
    return imgs(
      title: datas['title'],
      img: datas['img'],
      id: datas['id'],
    );
  }
}

List<imgs> datas = [
  imgs(
    id: 1,
    img:[
      'https://i.pinimg.com/736x/c3/a1/05/c3a105435a7f016b34ec83820ffea930.jpg',
      'https://www.shutterstock.com/image-illustration/indian-god-dhan-laxmi-hindu-260nw-2320574547.jpg',
      'https://w0.peakpx.com/wallpaper/892/471/HD-wallpaper-ganesh-ji-ganesh-god-ganesh-lord-ganesha-god-god-ganesh-god-ganesha-god-hindu-god-lord-ganesh-lord-thumbnail.jpg',
      'https://m.media-amazon.com/images/I/A1zMRVMHHLL._AC_UF894,1000_QL80_.jpg',
      'https://www.shutterstock.com/image-illustration/indian-god-shiv-ji-hindu-260nw-2321640037.jpg',
      'https://wallpapers.com/images/featured/god-mobile-8zkcu9np2hlivyi6.jpg',
      'https://i.pinimg.com/236x/61/2c/dd/612cdd6470e3e8a455057b2f3e5e8f22.jpg',
      'https://c8.alamy.com/comp/CPYNGP/picture-of-hindu-gods-laksman-rama-sita-and-hanuman-india-asia-CPYNGP.jpg',
      'https://static.vecteezy.com/system/resources/thumbnails/022/779/997/small_2x/generative-ai-illustration-of-ganesha-hindu-god-with-flowers-oil-painting-taken-up-into-heaven-sitting-in-front-of-bokeh-mandala-background-photo.jpg'
      // Add more wallpaper URLs as needed
    ],
    title: 'ganesha',
  ),
];

String dummyD =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
String dummyD3 =
    "Dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
String dummyD4 = "SAID and scrambled it to make a type specimen book.";
String add =
    "અમદાવાદમાં આજે કોરોનાના વધુ 8 કેસ: નવરંગપુરા\nજોધપુર, થલતેજ, ગોતા સહિતના વિસ્તારમાંથી\n કેસ નોંધાયા; ત્રણ દર્દીઓની અમેરિકા\n દુબઈ, મથુરાની ટ્રાવેલ હિસ્ટ્રી મળી";
String dummyD2 =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry..";
