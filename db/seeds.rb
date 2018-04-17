


bobsMayo = Producer.create(name: "Bob's Mayo", description: "The best damn may in town. Mmmm mmm, try our delicious Sriracha Mayo or even our Special Sauce Mayo. Put it on a big mac and explode your taste buds.")

carlsPickles = Producer.create(name: "Carl's Pickles", description: "You've never had a pickle like this. We take prid in pickling the best pickles that ever pickled. You gotta check out these pickles. They're the most delicious pickles. Period.")

jerrysCoconuts = Producer.create(name: "Jerry's Coconuts", description: "As Jennifer Lopez once said, 'I only eat Jerry's Coconuts. He's got the best coconuts in the world'. You gotta check out these coconuts. Our coconuts were once featured on an episode of Giligan's Island.")


chickenMayo = bobsMayo.products.create(name: "Chicken Flavored Mayo", description: "Chicken Flavored Mayo about sums it up. It's mayo and is flavored with Chicken", price: 8.75, size: "12oz", imagePath: "src/images/products/pickles.png")
srirachaMayo = bobsMayo.products.create(name: "Sriracha Mayo", description: "Sriracha is delicious. Mayo is delicious. So we put them together. You're welcome, America.", price: 6.25, size: "12oz", imagePath: "src/images/products/pickles.png")
sardineMayo = bobsMayo.products.create(name: "Sardine Flavored Mayo", description: "Chicken Flavored Mayo about sums it up. It's mayo and is flavored with Chicken", price: 4.25, size: "12oz", imagePath: "src/images/products/pickles.png")
veggieMayo = bobsMayo.products.create(name: "Veggie Mayo", description: "Healthy, nutritious, full of celery.", price: 9.50, size: "12oz", imagePath: "src/images/products/pickles.png")

spicyPickles = carlsPickles.products.create(name: "Spicy Pickles", description: "Pickles with a kick. They're spicy. But they're still pickles.", price: 4.15, size: "8oz", imagePath: "src/images/products/pickles.png")
sweetPickles = carlsPickles.products.create(name: "Sweet Pickles", description: "Hmm, tastes like pickle flavored ice cream. So sweet. Sweet sweet pickles.", price: 2.05, size: "10oz", imagePath: "src/images/products/pickles.png")
savoryPickles = carlsPickles.products.create(name: "Savory Pickles", description: "Not spicy, not sweet, but savory. Savory pickles amiright?", price: 6.15, size: "10oz", imagePath: "src/images/products/pickles.png")
classicPickles = carlsPickles.products.create(name: "Classic Pickles", description: "Just your standard, classic pickles. Nothing to write home about. Are they good? Of course they're good.", price: 5.75, size: "12oz", imagePath: "src/images/products/pickles.png")

singleCoconut = jerrysCoconuts.products.create(name: "Single Coconut", description: "Just a single coconut. You like coconuts but not that much? Then grab this guy.", price: 2.50, size: "1 coconut", imagePath: "src/images/products/pickles.png")
bundleCoconuts = jerrysCoconuts.products.create(name: "Bundle of Coconuts", description: "One coconut isn't gonna be enough but you're not an importer. Grab a bundle.", price: 10.00, size: "5 coconuts", imagePath: "src/images/products/pickles.png")
basketCoconuts = jerrysCoconuts.products.create(name: "Basket of Coconuts", description: "You host a lot and your guests like coconuts. Grab yourself a basket.", price: 18.00, size: "10 coconuts", imagePath: "src/images/products/pickles.png")
lifeSupplyCoconuts = jerrysCoconuts.products.create(name: "Life Supply of Coconuts", description: "You live for the coconut. You die for the coconut. LIFE SUPPLY MY MAN.", price: 100, size: "Infinite coconuts", imagePath: "src/images/products/pickles.png")







#
