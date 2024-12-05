require 'faker'
require 'open-uri'
require 'json'

puts "Cleaning the DB..."
Invitation.destroy_all
Collection.destroy_all
Restaurant.destroy_all
SpecialOffer.destroy_all
User.destroy_all

puts "User creation starts..."

owner = User.create!(
  username: "Steven",
  email: "Steve@biteoff.com",
  password: "123123"
)

owner.photo.attach(io: File.open("app/assets/images/profilepic/steven.jpg"), filename: "steven.jpg", content_type: "image/jpg")

mark = User.create!(
  username: "MarkH",
  email: "Mark@biteoff.com",
  password: "123123"
)

mark.photo.attach(io: File.open("app/assets/images/profilepic/mark.jpg"), filename: "mark.jpg", content_type: "image/jpg")

shafiq = User.create!(
  username: "Shafiq",
  email: "Shafiq@biteoff.com",
  password: "123123"
)

shafiq.photo.attach(io: File.open("app/assets/images/profilepic/chafique.png"), filename: "chafique.png", content_type: "image/png")


christian = User.create!(
  username: "Christian",
  email: "Christian@biteoff.com",
  password: "123123"
)

christian.photo.attach(io: File.open("app/assets/images/profilepic/christian.jpg"), filename: "christian.jpg", content_type: "image/jpg")

User.create!(
  username: "TrisBeep",
  email: "tristan@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "AdBrunz",
  email: "adam@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "RoHadoo",
  email: "roman@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "Phlanic",
  email: "phyu@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "KamolMasher",
  email: "mason@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "WCLiao",
  email: "wei-cheng@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "DyMayo",
  email: "dylan@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "BartiMiko",
  email: "bartlomiej@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "JarMizzy",
  email: "jarod@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "LoriMo",
  email: "loris@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "ClauOrdz",
  email: "claudia@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "PalToby",
  email: "toby@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "HenSan",
  email: "henry@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "SegArisa",
  email: "arisa@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "Denigal",
  email: "denis@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "VanWillow",
  email: "will@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "Stuaga",
  email: "stuart@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")


puts "Seeded #{User.all.count} users!"

# shibuya_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Shibuya&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
# shinjuku_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Shinjuku&fields=name,formatted_address,rating,photos,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
# meguro_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Meguro&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
# ginza_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Ginza&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"

puts "Creating restaurants in Tokyo..."

# Restaurant seeds with names, categories, and coordinates (latitude and longitude)
restaurants = [
  {name: "Ninja Akasaka", category: "Themed Restaurant", latitude: 35.6762, longitude: 139.7404, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2c/d3/28/0d/caption.jpg"},
  {name: "Kanda Yabu-Soba", category: "Soba Noodles", latitude: 35.6958, longitude: 139.7704, url: "https://zendine.co/_next/image/?url=https%3A%2F%2Fd3nrav7vo3lya8.cloudfront.net%2Fprofile_photos%2Fsoba%2F140p.webp&w=640&q=75"},
  {name: "Sushi Kanesaka", category: "Sushi", latitude: 35.6764, longitude: 139.7632, url: "https://d2dzi65yjecjnt.cloudfront.net/1339874-1.jpg"},
  {name: "Motenashi-Kuroki", category: "Ramen", latitude: 35.7002, longitude: 139.7706, url: "https://lh3.googleusercontent.com/p/AF1QipPigC5p0YNgzzLxXtJHOIu9a_RURWqwgcAdklLZ=s680-w680-h510"},
  {name: "Nodaiwa", category: "Unagi", latitude: 35.675, longitude: 139.7447, url: "https://old-tokyo.info/wp-content/uploads/2018/07/2018-06-06-19.05.08-1200x771.jpg"},
  {name: "Osteria da-K-Hattori", category: "Italian", latitude: 35.6931, longitude: 139.7532, url: "https://savorjapan.com/gg/image/0006072344/0006072344F20_en_387x290d80.jpg"},
  {name: "Kanda Matsuya", category: "Soba Noodles", latitude: 35.6945, longitude: 139.7701, url: "https://cdn.tasteatlas.com/images/dishrestaurants/3b6f44bc717942fdadeca57ca81040a1.jpg?w=600"},
  {name: "Soranoiro", category: "Ramen", latitude: 35.6784, longitude: 139.7636, url: "https://prd-static.gltjp.com/glt/data/article/11000/10796/20200907_022908_a3bfef69_w1920.webp"},
  {name: "Pizzeria E Trattoria Da Isa", category: "Italian", latitude: 35.6983, longitude: 139.7702, url: "https://tblg.k-img.com/restaurant/images/Rvw/149523/640x640_rect_149523282.jpg"},
  {name: "Kakiden", category: "Kaiseki", latitude: 35.693, longitude: 139.7042, url: "https://tblg.k-img.com/restaurant/images/Rvw/202472/640x640_rect_2bdd4ef6271eead06e0054027c1791a5.jpg"},
  {name: "Sukiyabashi Jiro", category: "Sushi", latitude: 35.6734, longitude: 139.7623, url: "https://travel.rakuten.com/contents/sites/contents/files/styles/max_1300x1300/public/2023-11/everything-about-sukiyabashi-jiro-tokyo_1.jpg?itok=EVnGzmD7"},
  {name: "Ginza Kojyu", category: "Kaiseki", latitude: 35.6719, longitude: 139.7642, url: "https://images.squarespace-cdn.com/content/v1/5c311ba2697a98937f5a1a98/1554778944947-JAIA64APYBO9OT07JNF1/IMG_7739.JPG"},
  {name: "Tempura Kondo", category: "Tempura", latitude: 35.671, longitude: 139.7642, url: "https://myconciergejapan.com/wp-content/uploads/2018/11/tk3.jpg"},
  {name: "Sushi Yoshitake2", category: "Sushi", latitude: 35.6718, longitude: 139.764, url: "https://tinyurbankitchen.com/wp-content/uploads/2016/11/Sushi-Yoshitake-Collage-3.jpg"},
  {name: "Tapas Molecular Bar", category: "Themed Restaurant", latitude: 35.687, longitude: 139.7741, url: "https://d3ulc7s3nchmqx.cloudfront.net/GIlv9x9j5-j7f3Tgw639AR4oS9gNn7lnUNzGJ1_M1_A_720.jpg"},
  {name: "Ginza Ukai-Tei", category: "Teppanyaki", latitude: 35.671, longitude: 139.7642, url: "https://media-cdn.tripadvisor.com/media/photo-s/0e/b2/1c/34/photo1jpg.jpg"},
  {name: "Sushi Tokami", category: "Sushi", latitude: 35.6716, longitude: 139.7645, url: "https://www.goodiesfirst.com/wp-content/uploads/2017/01/tokami-grid.jpg"},
  {name: "L'Osier", category: "French", latitude: 35.673, longitude: 139.7621, url: "https://www.experiencesluxe.com/cdn-cgi/imagedelivery/kJlAAqUqnbueqjYHlmNNpA/experiencesluxe/resources/posts/article399/image/w=1200"},
  {name: "Sushi Saito", category: "Sushi", latitude: 35.6655, longitude: 139.7394, url: "https://dishes-japan.com/wp-content/uploads/2021/06/saito1.png"},
  {name: "Sazenka", category: "Chinese", latitude: 35.6581, longitude: 139.7394, url: "https://www.theworlds50best.com/discovery/filestore/jpg/Sazenka-Tokyo-Japan-01.jpg"},
  {name: "Narisawa", category: "French", latitude: 35.6645, longitude: 139.7264, url: "https://www.japantimes.co.jp/uploads/imported_images/uploads/2019/03/p14-swinnerton-narisawa15-c-20190317.jpg"},
  {name: "Sushi Masuda", category: "Sushi", latitude: 35.6653, longitude: 139.7302, url: "https://tblg.k-img.com/resize/640x360c/restaurant/images/Rvw/223431/6cf07488af294791ff48b8e06945f1dc.jpg?token=837eda9&api=v2"},
  {name: "Quintessence", category: "French", latitude: 35.6274, longitude: 139.7385, url: "https://savorjapan.com/special/en/life-in-the-kitchen/img/09/06.jpg"},
  {name: "L'Effervescence", category: "French", latitude: 35.664, longitude: 139.7294, url: "https://myconciergejapan.com/wp-content/uploads/2020/07/Photo-%E9%B3%A9.jpeg"},
  {name: "Florilège", category: "French", latitude: 35.6648, longitude: 139.7123, url: "https://media.cntraveler.com/photos/5a930fce20dfb6552425e8c0/16:9/w_2560%2Cc_limit/Florilege_2018_IMG_002.jpg"},
  {name: "Ishikawa", category: "Kaiseki", latitude: 35.693, longitude: 139.7042, url: "https://media.cntraveler.com/photos/58cae39ebe100863fba30248/16:9/w_2560,c_limit/Food4-Ishikawa-Tokyo-CRRestaurant.jpg"},
  {name: "Kagurazaka Ishikawa", category: "Kaiseki", latitude: 35.7023, longitude: 139.7401, url: "https://i0.wp.com/imstillhungry.net/wp-content/uploads/2017/12/Kagurazaka-Ishikawa-Tokyo-16.jpg?resize=1140%2C863&ssl=1"},
  {name: "Sushi Yoshitake", category: "Sushi", latitude: 35.6718, longitude: 139.764, url: "https://drtxflcglp5oe.cloudfront.net/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBaE1GIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--f9a4e6f79dd3c1200fe9c1353f537b99311da146/yoshitake_1.jpg"},
  {name: "Narisawa-", category: "French", latitude: 35.6645, longitude: 139.7264, url: "https://drtxflcglp5oe.cloudfront.net/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBajhNIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--ae69da9119f56c6385f43afdbc5c90c407c0efd7/%E7%B9%9D%E8%BC%94%EF%BD%9A%E7%B9%9D%EF%BD%AC%E7%B9%9D%E6%BA%98%E3%81%84%E7%B9%9D%EF%A3%B0%E7%B9%9D%E5%B8%99%EF%BD%99%E7%B9%9D%E3%83%BB%E3%81%91%E7%B9%A7%EF%BD%B9%E3%83%BB%E3%83%BBjpg"},
  {name: "Sushi-Masuda", category: "Sushi", latitude: 35.6653, longitude: 139.7302, url: "https://s3-media0.fl.yelpcdn.com/bphoto/t1O5nVZApm-1N06ztgd3UQ/l.jpg"},
  {name: "Sushi-Saito", category: "Sushi", latitude: 35.6655, longitude: 139.7394, url: "https://nisekotourism.com/wp-content/uploads/sushisaito01.jpg"},
  {name: "Kagurazaka-Ishikawa", category: "Kaiseki", latitude: 35.7023, longitude: 139.7401, url: "https://production-data.worldofmouth.app/images/aaddc68f-cecc-46c9-a499-892e8fa365c2"},
  {name: "Sushi-Yoshitake", category: "Sushi", latitude: 35.6718, longitude: 139.764, url: "https://media-cdn.tripadvisor.com/media/photo-s/0d/b6/8f/35/photo9jpg.jpg"},
  {name: "Mensho Tokyo", category: "Ramen", latitude: 35.7074, longitude: 139.7606, url: "https://tblg.k-img.com/resize/640x360c/restaurant/images/Rvw/32888/32888839.jpg?token=038c4f3&api=v2"},
  {name: "Kanda Yabu Soba", category: "Soba Noodles", latitude: 35.6958, longitude: 139.7704, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/7d/4a/b4/kanda-yabu-soba.jpg?w=900&h=500&s=1"},
  {name: "Sushi-Kanesaka", category: "Sushi", latitude: 35.6764, longitude: 139.7632, url: "https://en.palacehoteltokyo.com/wp-content/uploads/Palace-Hotel-Tokyo-Sushi-Kanesaka-H2-640x470.jpg"},
  {name: "Motenashi Kuroki", category: "Ramen", latitude: 35.7002, longitude: 139.7706, url: "https://lh5.googleusercontent.com/proxy/t_X0k6gtrZE88RG-hPZHjROH2nICnV_ufJYG9wc0CDuczM_dkEYNVBwgTZAiNyk-8_UjT-hm0xk2s79u89PXTax8K9daKFfD_zrxfK33Vf9Z2922weSNpZjyIzQ"},
  {name: "Osteria da K.Hattori", category: "Italian", latitude: 35.6931, longitude: 139.7532, url: "https://tblg.k-img.com/resize/640x360c/restaurant/images/Rvw/58973/58973573.jpg?token=b818b91&api=v2"},
  {name: "Kanda-Matsuya", category: "Soba Noodles", latitude: 35.6945, longitude: 139.7701, url: "https://foodsaketokyo.com/wp-content/uploads/2010/08/matsuya-tempura-soba.jpg"},
  {name: "Pizzeria E Trattoria Da-Isa", category: "Italian", latitude: 35.6983, longitude: 139.7702, url: "https://tb-static.uber.com/prod/image-proc/processed_images/db7978f7df22f6dada5b72592b7b2fbb/fb86662148be855d931b37d6c1e5fcbe.jpeg"},
  {name: "Sukiyabashi-Jiro", category: "Sushi", latitude: 35.6734, longitude: 139.7623, url: "https://akm-img-a-in.tosshub.com/businesstoday/images/story/202312/146-147-1-1-sixteen_nine.jpg?size=1000:563"},
  {name: "Den", category: "Kaiseki", latitude: 35.6938, longitude: 139.753, url: "https://i0.wp.com/imstillhungry.net/wp-content/uploads/2018/05/Den-Tokyo-e1527153708780.jpg?fit=864%2C1080&ssl=1"},
  {name: "RyuGin", category: "Kaiseki", latitude: 35.6705, longitude: 139.765, url: "https://myconciergejapan.com/wp-content/uploads/2019/07/ryugin_slider_3.jpg"},
  {name: "Sazenka4", category: "Chinese", latitude: 35.6581, longitude: 139.7394, url: "https://takefumihamada.com/wp-content/uploads/2020/09/99118570_10102810253870514_1851501633268088832_n.jpg"},
  {name: "Ginza-Kojyu", category: "Kaiseki", latitude: 35.6719, longitude: 139.7642, url: "https://drtxflcglp5oe.cloudfront.net/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBc3NUIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--49a147443b94d9cf69c036ae696f0c25e61f71f5/koju10,20-7824.jpg"},
  {name: "Asakusa Imahan", category: "Japanese", latitude: 35.7113, longitude: 139.7966, url: "https://e-asakusa.jp/wp-en/wp-content/uploads/9fff04eb477ba92936d4949e50befb21.jpg"},
  {name: "Namiki Yabusoba", category: "Soba Noodles", latitude: 35.7115, longitude: 139.7952, url: "https://d3nrav7vo3lya8.cloudfront.net/profile_photos/soba/28p.webp"},
  {name: "Sometaro", category: "Okonomiyaki", latitude: 35.7102, longitude: 139.7934, url: "https://japanjourneys.jp/wp-content/uploads/2016/07/5-1.jpg"},
  {name: "Daikokuya Tempura", category: "Tempura", latitude: 35.7114, longitude: 139.7955, url: "https://tblg.k-img.com/restaurant/images/Rvw/24046/640x640_rect_24046203.jpg"},
  {name: "Umezono", category: "Japanese Sweets", latitude: 35.7112, longitude: 139.7953, url: "https://svcstrg.cld.navitime.jp/imgfile/02301_1703115_04.jpg"},
  {name: "Kamiya Bar", category: "Japanese Fusion", latitude: 35.7106, longitude: 139.7958, url: "https://images.squarespace-cdn.com/content/v1/55e33189e4b0ade6e0829dee/1458918639674-21CV22QPHH501RE8WMJU/IMG_0956.JPG?format=1000w"},
  {name: "Iriya Plus Café", category: "Café", latitude: 35.7201, longitude: 139.7902, url: "https://tblg.k-img.com/restaurant/images/Rvw/31457/31457714.jpg"},
  {name: "Pelican Café", category: "Café", latitude: 35.7078, longitude: 139.7923, url: "https://tblg.k-img.com/restaurant/images/Rvw/270061/640x640_rect_58d0f4e3d7a7bddc33f13fa675cac144.jpg"},
  {name: "Yoroiya Ramen", category: "Ramen", latitude: 35.7113, longitude: 139.7957, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/93/fb/1c/1100.jpg?w=900&h=500&s=1"},
  {name: "Asakusa Kagetsudo", category: "Café", latitude: 35.7116, longitude: 139.795, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/02/a6/97/caption.jpg?w=1200&h=-1&s=1"},
  {name: "Yakiniku Jumbo", category: "Yakiniku", latitude: 35.7081, longitude: 139.8016, url: "https://tblg.k-img.com/resize/640x360c/restaurant/images/Rvw/220404/dbec815b26bc477e6f323fb6cc7e6caf.jpg?token=01a5cb5&api=v2"},
  {name: "Oshiage Yoshikatsu", category: "Tonkatsu", latitude: 35.7075, longitude: 139.8107, url: "https://media-cdn.tripadvisor.com/media/photo-s/0e/56/6b/e8/photo0jpg.jpg"},
  {name: "Tonkatsu Ichikatsu", category: "Tonkatsu", latitude: 35.7072, longitude: 139.8105, url: "https://japangourmetpass.s3.us-east-2.amazonaws.com/images-restaurants/March2020/ichikatsu-tonkatsu-in-ryogoku-deep-fried-pork-cutlet-crispy-and-juicy.jpg"},
  {name: "Kushikatsu Tanaka", category: "Kushikatsu", latitude: 35.7079, longitude: 139.8108, url: "https://dishes-japan.com/wp-content/uploads/2023/02/Kushikatsu-Tanaka-1.jpg"},
  {name: "Sushi-Tokami", category: "Sushi", latitude: 35.7076, longitude: 139.8106, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/78/06/f0/20180624-203146-largejpg.jpg?w=1000&h=-1&s=1"},
  {name: "Ramen Keisuke", category: "Ramen", latitude: 35.7073, longitude: 139.8104, url: "https://img1.wsimg.com/isteam/ip/e55da7b3-68ca-47b4-8ca2-64957f6cc1d2/Tori%20King.jpg/:/cr=t:0%25,l:0%25,w:100%25,h:100%25"},
  {name: "Tempura Hasegawa", category: "Tempura", latitude: 35.707, longitude: 139.8103, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/cf/c8/0c/caption.jpg?w=1000&h=-1&s=1"},
  {name: "Yakitori Omino", category: "Yakitori", latitude: 35.7067, longitude: 139.8102, url: "https://d3h1lg3ksw6i6b.cloudfront.net/media/image/2024/07/25/f94db323765141908ffb1b0a738e547d_Sanka.jpg"},
  {name: "Unagi Komagata Maekawa", category: "Unagi", latitude: 35.7064, longitude: 139.8101, url: "https://www.komagata-maekawa.com/wp/wp-content/themes/komagatamaekawa/images/second/detail_komagatamaekawa_slide05.jpg"},
  {name: "Monja Kura", category: "Okonomiyaki", latitude: 35.7061, longitude: 139.81, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/3c/07/71/caption.jpg?w=1200&h=-1&s=1"},
  {name: "Fukagawa Tsuribune", category: "Japanese", latitude: 35.6735, longitude: 139.8174, url: "https://tblg.k-img.com/restaurant/images/Rvw/262916/640x640_rect_dd285c4288bc396ca3a00473c22713cd.jpg"},
  {name: "Monja Fukutake", category: "Okonomiyaki", latitude: 35.6732, longitude: 139.8172, url: "https://cdn.cheapoguides.com/wp-content/uploads/sites/2/2017/02/Cooking-1024x600.jpg"},
  {name: "Kameido Gyoza", category: "Japanese", latitude: 35.673, longitude: 139.817, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/99/3a/7e/gyoza.jpg?w=1200&h=-1&s=1"},
  {name: "Sushi Dai", category: "Sushi", latitude: 35.6728, longitude: 139.8168, url: "https://byjinalee.com/wp-content/uploads/2023/10/Omakase-at-Sushi-Dai_byjinalee-1024x768.jpg"},
  {name: "Tomioka Hachimangu", category: "Japanese", latitude: 35.6726, longitude: 139.8166, url: "https://prd-static.gltjp.com/glt/data/directory/12000/11519/20210310_204111_2bc0b03c_w1920.webp"},
  {name: "Fukagawa Juku", category: "Japanese", latitude: 35.6724, longitude: 139.8164, url: "https://smartcdn.gprod.postmedia.digital/vancouversun/wp-content/uploads/2024/10/a-fukagawa-meshi-lunch-at-fukugawajuku-restaurant.jpg"},
  {name: "Kiyosumi Shirakawa", category: "Café", latitude: 35.6722, longitude: 139.8162, url: "https://resources.matcha-jp.com/resize/720x2000/2021/08/18-115992.webp"},
  {name: "Fukagawa Edo Museum Café", category: "Café", latitude: 35.672, longitude: 139.816, url: "https://tblg.k-img.com/restaurant/images/Rvw/261598/640x640_rect_6b06bd2852aee39f7ec5941b31d3bc0b.jpg"},
  {name: "Monja Street", category: "Okonomiyaki", latitude: 35.6718, longitude: 139.8158, url: "https://jw-webmagazine.com/wp-content/uploads/2019/06/jw-5d149cf4c54948.59619839.jpeg"},
  {name: "Fukagawa Meshi", category: "Japanese", latitude: 35.6716, longitude: 139.8156, url: "https://kotomise.jp/wp/wp-content/uploads/2021/03/76dcc6065bc1207429ce34bd3828375d.jpg"},
  {name: "Tofuya Ukai", category: "Tofu Kaiseki", latitude: 35.6574, longitude: 139.7454, url: "https://tblg.k-img.com/restaurant/images/Rvw/189365/077e727fb6324c75f3895cc46191fa6b.jpg"},
  {name: "Ramen Jiro Meguro", category: "Ramen", latitude: 35.6342, longitude: 139.7072, url: "https://hayato240.com/wp-content/uploads/2021/05/IMG_5183.jpeg"},
  {name: "Gotetsu", category: "Okonomiyaki", latitude: 35.6091, longitude: 139.7304, url: "https://tblg.k-img.com/resize/640x360c/restaurant/images/Rvw/213847/b1ddb52a38e461bab3d91ea0f4dfbf23.jpg?token=006055c&api=v2"},
  {name: "Shinagawa Okina", category: "Sushi", latitude: 35.6285, longitude: 139.7389, url: "https://tblg.k-img.com/restaurant/images/Rvw/264525/640x640_rect_16006fc57ebc1a8753ebad7bdd85c1fb.jpg"},
  {name: "Tonkatsu Tonki", category: "Tonkatsu", latitude: 35.6312, longitude: 139.716, url: "https://japangourmetpass.s3.us-east-2.amazonaws.com/images-restaurants/March2020/tonkatsu-tonki-restaurant-in-meguro-tonkatsu-pork-culet-soft.jpg"},
  {name: "Kura Sushi", category: "Sushi", latitude: 35.6339, longitude: 139.7151, url: "https://www.planmyjapan.com/wp-content/uploads/2023/08/kura-3-2.jpg"},
  {name: "Yakiniku Champion", category: "Yakiniku", latitude: 35.6093, longitude: 139.7302, url: "https://tb-static.uber.com/prod/image-proc/processed_images/4cd628e1684868ec70ab48eed52aee88/fb86662148be855d931b37d6c1e5fcbe.jpeg"},
  {name: "Tempura Yamanoue", category: "Tempura", latitude: 35.609, longitude: 139.73, url: "https://rimage.hitosara.com/gg/image/0006133725/0006133725J1.jpg"},
  {name: "Sushi Taichi", category: "Sushi", latitude: 35.6087, longitude: 139.7298, url: "https://tblg.k-img.com/restaurant/images/Rvw/212117/640x640_rect_bfd5c243922747d6108c35bb322a30c3.jpg"},
  {name: "Tonki", category: "Tonkatsu", latitude: 35.6331, longitude: 139.715, url: "https://cdn.prod.website-files.com/668dca37083eedddc794a525/66d4e1dfeee23a4d08e9415a_la-belle-tonki-hero-img.jpg"},
  {name: "Kura-Sushi", category: "Sushi", latitude: 35.6333, longitude: 139.7152, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMGRKAduZ4Rlnq_pLmsD_LWa_pOJRyBcJNbQ&s"},
  {name: "Yakiniku-Champion", category: "Yakiniku", latitude: 35.6339, longitude: 139.7158, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/db/b7/a4/caption.jpg?w=1200&h=-1&s=1"},
  {name: "Tempura-Yamanoue", category: "Tempura", latitude: 35.6341, longitude: 139.716, url: "https://www.peninsula.com/-/media/images/tokyo/new/our-city/concierge-recommendation/tempura-1074-x-604pix.png?mw=987&hash=20444F20866899DEC1914184B2415526"},
  {name: "Sushi-Taichi", category: "Sushi", latitude: 35.6343, longitude: 139.7162, url: "https://restaurant.img-ikyu.com/rsDatas/rsData125000/r124968/orig/124968ga10000006.jpg?auto=compress%2Cformat&lossless=0&fit=crop&w=1400&h=700"},
  {name: "T.Y. Harbor", category: "Brewery/International", latitude: 35.6228, longitude: 139.7461, url: "https://tblg.k-img.com/resize/640x360c/restaurant/images/Rvw/127599/127599028.jpg?token=5b8eac3&api=v2"},
  {name: "Anagoya", category: "Unagi", latitude: 35.5615, longitude: 139.715, url: "https://www.pelago.com/img/products/JP-Japan/japan-osaka-eel-dish-kitahama-anagoya-michelin-recommended/2518ddf9-883d-4eb2-bd60-bfec0677d372_japan-osaka-eel-dish-kitahama-anagoya-michelin-recommended.jpg"},
  {name: "Kamata Horumon", category: "Horumon", latitude: 35.5617, longitude: 139.7152, url: "https://tblg.k-img.com/resize/640x360c/restaurant/images/Rvw/231388/cbf0e697227a15debb60d843e9e755d3.jpg?token=e3fe686&api=v2"},
  {name: "Ramen Dai Kamata", category: "Ramen", latitude: 35.5619, longitude: 139.7154, url: "https://tblg.k-img.com/restaurant/images/Rvw/129013/320x320_square_129013804.jpg"},
  {name: "Tonkatsu Marugo", category: "Tonkatsu", latitude: 35.5621, longitude: 139.7156, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/24/c6/37/absolutely-delicious.jpg?w=900&h=500&s=1"},
  {name: "Sushi Zanmai Kamata", category: "Sushi", latitude: 35.5623, longitude: 139.7158, url: "https://tblg.k-img.com/resize/640x360c/restaurant/images/Rvw/235089/05d688c421055257800b0de3eb0fd26c.jpg?token=ffb3eb7&api=v2"},
  {name: "Yakitori Taisho", category: "Yakitori", latitude: 35.5625, longitude: 139.716, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/7c/77/30/yakitori-taisho.jpg?w=900&h=500&s=1"},
  {name: "Seirinkan", category: "Pizza", latitude: 35.6475, longitude: 139.6697, url: "https://thecitylane.com/wp-content/uploads/2018/12/DSCF0607.jpg"},
  {name: "Pizza Giardino Savoy", category: "Pizza", latitude: 35.6320, longitude: 139.7109, url: "https://lh3.googleusercontent.com/p/AF1QipMq_m1iBJtFRbrykmh1BGuyAb9uzhMULMxY3ATt=s1360-w1360-h1020"},
  {name: "Il Lupone", category: "Pizza", latitude: 35.6410, longitude: 139.7026, url: "https://lh3.googleusercontent.com/p/AF1QipOArejPTV_39WZDSc6tGQHHWf7Tzp17wXtSP86V=s1360-w1360-h1020"},
  {name: "Yakitori Imai", category: "Yakitori", latitude: 35.6468, longitude: 139.6689, url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/91/69/9e/caption.jpg?w=900&h=500&s=1"},
  {name: "Shimauma", category: "Japanese Fusion", latitude: 35.648, longitude: 139.67, url: "https://tblg.k-img.com/resize/640x360c/restaurant/images/Rvw/234061/c3232dc87b42661d31893b18f0000712.jpg?token=82a2695&api=v2"},
  {name: "Ramen Jiro Sangenjaya", category: "Ramen", latitude: 35.646, longitude: 139.6675, url: "https://tblg.k-img.com/restaurant/images/Rvw/267443/640x640_rect_a0135b18c31ad6ce1428c0f8c2b88d0a.jpg"},
  {name: "Pizzeria da Peppe-Napolistaca", category: "Italian", latitude: 35.647, longitude: 139.669, url: "https://tblg.k-img.com/restaurant/images/Rvw/62235/640x640_rect_62235570.jpg"},
  {name: "Tempura Motoyoshi", category: "Tempura", latitude: 35.6485, longitude: 139.6705, url: "https://res.cloudinary.com/dwhtazpfq/image/upload/7hsan9877szvak859u0nk4xkpytp.jpg"}
]

restaurants.each do |restaurant|
  Restaurant.create!(name: restaurant[:name],
    category: restaurant[:category],
    latitude: restaurant[:latitude],
    longitude: restaurant[:longitude],
    url: restaurant[:url],
    user: owner)
end
puts "Created #{restaurants.count} restaurants in Tokyo"

# Predefined special offers for different categories
special_offers = {
  "Sushi" => {
    category: "Half-Price Sushi Platter Night",
    description: "Enjoy a deluxe sushi platter with 12 expertly crafted pieces for half the price (¥2,500) every Thursday evening, 5 PM to 9 PM."
  },
  "Japanese" => {
    category: "%20off Sushi Set with Sea Urchin, Salmon Roe & Champagne",
    description: "The ultimate luxury dining experience that you can only enjoy here in Ginza, all at 20% off - regularly price ¥14,000"
  },
  "Yakitori" => {
    category: "¥1,000 Yakitori Lunch Set",
    description: "Morning set with coffee, bagel, sausage for ¥1,000."
  },
  "Café" => {
    category: "¥1,000 Morning Set",
    description: "Lunch Set with a bowl of rice, a small cup of chicken broth soup, and a small salad, plus five kinds of yakitori for ¥1,000."
  },
  "Yakiniku" => {
    category: "All-You-Can-Eat Menu from ¥2,980",
    description: "All-you-can-eat menu including A5 Wagyu beef and Sendai Cow tongue starts from 2,980 yen!"
  },
  "Tonkatsu" => {
    category: "Kurobuta Gozen ¥500 Discount Friday",
    description: "You will receive a 500 yen discount on your bill when you order a Kurobuta type product set meal."
  },
  "Japanese Fusion" => {
    category: "¥2,900 All-You-Can-Eat Sushi Rolls",
    description: "Indulge in unlimited sushi rolls for dinner every Friday night. Reservation required."
  },
  "Japanese Sweets" => {
    category: "Dessert Lovers Matcha Pairing for ¥900",
    description: "Pair our house-made matcha parfait with traditional Japanese sweets after your dinner entrée for only ¥900."
  },
  "Horumon" => {
    category: "¥2,500 All-You-Can-Eat Dinner from 5pm",
    description: "All-you-can-eat plan from Shimachan that offers great value for money and great customer savings!"
  },
  "Tempura" => {
    category: "¥1,800 Tempura Set Meal",
    description: "Dive into a crispy tempura set meal featuring prawns, seasonal vegetables, and dipping sauces. Includes tea. Available daily for lunch."
  },
  "Kaiseki" => {
    category: "¥3,000Weekend Kaiseki Lunch Special",
    description: "Experience an seasonal delicacies in Japanese traditional kaiseki meal, exclusively on Saturdays and Sundays from 12 PM to 2 PM."
  },
  "Ramen" => {
    category: "¥1,200 Ramen Bowl + Gyoza Combo",
    description: "Slurp up a hearty ramen bowl with a side of crispy gyoza. Available Monday to Friday from 6 PM until close."
  },
  "Italian" => {
    category: "¥1,800 Tuesday Pasta & Dessert",
    description: "Choose any pasta entrée and a decadent dessert, plus a free glass of house wine, for only ¥1,800."
  },
  "Pizza" => {
    category: "2-for-1 Pizza Night on Saturday",
    description: "Order any large pizza and get a second one free every Wednesday evening."
  },
  "Teppanyaki" => {
    category: "¥5,800 Steak Dinner for Two with Wine",
    description: "Treat yourself and a loved one to two sirloin steak meals, accompanied by a bottle of house wine, every Friday."
  },
  "Tofu Kaiseki" => {
    category: "¥2,000 Dinner Set Special",
    description: "Authentic Japanese multi-course kaiseki lunch showcasing seasonal delicacies."
  },
  "Soba Noodles" => {
    category: "¥1,200 Soba & Sake Set",
    description: "Get a bowl of soba noodles (hot or cold) and a glass of premium sake for ¥1,200. Offer valid on Thursdays only."
  },
  "Unagi" => {
    category: "¥1,500 Grilled Eel Bowl",
    description: "Savor our signature unagi bowl with rice, pickles, and miso soup, discounted during weekday lunch hours."
  },
  "Okonomiyaki" => {
    category: "¥900 DIY Okonomiyaki Night",
    description: "Build your perfect savory pancake and enjoy a complimentary dessert. Available Sundays from 5 PM to 9 PM."
  },
  "Chinese" => {
    category: "8% Off All-You-Can-Eat Dim Sum",
    description: "Plus a welcome drink (Weekdays Only) - Value of ¥7,700 → ¥7,040 (8% off)"
  },
  "Themed Restaurant" => {
    category: "2-for-1 Appetizer Tuesdays",
    description: "Buy one appetizer and get a second one free. Available every Tuesday for lunch and dinner."
  },
  "Brewery/International" => {
    category: "¥1,200 All-American Brunch",
    description: "Indulge in a brunch platter with pancakes, scrambled eggs, crispy bacon, and coffee. Available Saturday mornings."
  },
  "Kushikatsu" => {
    category: "16th Anniversary All Menu Discount!",
    description: "33 types of Kushi Katsu, normally priced between 130 to 260 yen, for just 110 yen!"
  },
  "French" => {
    category: "¥2,800 Wine & Cheese Pairing for Two",
    description: "Savor a curated selection of cheeses paired with two glasses of house wine. Perfect for wine lovers."
  }
}

# Iterate through all restaurants and assign matching special offers
restaurants = Restaurant.all
start_date = Date.today
end_date = start_date + 30.days


restaurants.each do |restaurant|
  offer = special_offers[restaurant.category]
  random = Random.new.rand(5..30)
  if offer
    SpecialOffer.create!(
      category: offer[:category],
      description: offer[:description],
      start_date: start_date,
      end_date: end_date,
      restaurant: restaurant,
      user: owner,
      confirmation_count: random
    )
  else
    puts "No special offer found for category: #{restaurant.category}"
  end
end


puts "...created #{SpecialOffer.count} offers"

special_offers = SpecialOffer.all

puts "Creating #{special_offers.count * 3} reviews"

special_offers.each do |offer|
  review = Review.new(
    {
      description: "Amazing deal, saved a lot on my purchase!",
      rating: 5
    }
  )
  review.user = User.all.sample
  review.special_offer = offer
  review.save

  review = Review.new(
    {
      description: "The deal was great and everyone was very helpful. Highly recommend it!",
      rating: 4
    }
  )
  review.user = User.all.sample
  review.special_offer = offer
  review.save

  review = Review.new(
   {
     description: "The food was fantastic and paired with such a nice deal!",
     rating: 5
   }
  )
  review.user = User.all.sample
  review.special_offer = offer
  review.save
end
puts "...created #{special_offers.count * 3} reviews"
