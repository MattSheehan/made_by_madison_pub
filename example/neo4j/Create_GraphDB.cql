CREATE (n01:User { id: "n01", caption: "MadisonStone", label: "User", type: "Seller", dateCreated: "11-01-2024T00:00:00Z", firstName: "Madison", id: 69100101, lastName: "Stone", email: "beany@river.com", username: "beany", userPassword: "***************", rbacId: "admin" }),
(n00:User { id: "n00", caption: "MattSheehan", label: "User", type: "Buyer", dateCreated: "11-01-2024T00:00:00Z", firstName: "Matt", id: 28282828, lastName: "Sheehan", email: "noneYa@business.com", username: "noneYa", userPassword: "****************", rbacId: "admin", address: "420 A 69th St.", city: "Denver", state: "CO", zip: 80000, `postal-box`: 69 }),
// Create Store Node
(n20:Shop { id:"n20", caption:"made_by_madison", label:"Shop", type:"main", storeId:"store0001", productTypes:"Jewlery", tags:"Jewlery", date_created: "11-01-2024T00:00:00Z" }),
// Create Inventory Node
(n21:Inventory { id:"n21", caption:"", label:"Shop", type:"shop", tenantId:"${n20.storeId}", sellerId:"", productIds: "", tags: "", date_created: "11-01-2024T00:00:00Z" }),
// Create Product Nodes
(n12:Product {id: "n12", caption: "Jewlery", label: "Product", type: "earing", itemId: 00112233, imageUrl: "https: //photos.onedrive.com/photo/{{ID}}!{{INDEX}}", ammount: 1, sizes: "medium", material: "silver, pearls", name: "Pearl Earings", price: "$420.69", description: "Ahh fuck, you're going to get so much pussy now", creator: "beany@river.com"}),
(n13:Product {id: "n13", caption: "Jewlery", label: "Product", type: "earing", itemId: 11010010, imageUrl: "https: //photos.onedrive.com/photo/{{ID}}!{{INDEX}}", ammount: 4, sizes: "medium", material: "silver, gold", name: "Infinity Hoops", price: "$69.69", description: "Sophistication in the Simplification... said nobody dripping ever.", creator: "beany@river.com"}),
(n14:Product {id: "n14", caption: "Jewlery", label: "Product", type: "necklace", itemId: 12345678, imageUrl: "https: //photos.onedrive.com/photo/{{ID}}!{{INDEX}}", ammount: 4, sizes: "medium", material: "silver, gold", name: "Chain Necklace", price: "$500", description: "Makes you look like a fuckin G.", creator: "beany@river.com"}),
// Create Design Relationships for user.type = seller
(n01)-[:DESIGNS { id: "n0112", fromId: "", toId: "", label: "DESIGNS", date: "11-01-2024T00:00:00Z" }]->(n12),
(n01)-[:DESIGNS { id: "n0113", fromId: "", toId: "", label: "DESIGNS", date: "11-01-2024T00:00:00Z" }]->(n13),
(n01)-[:DESIGNS { id: "n0114", fromId: "", toId: "", label: "DESIGNS", date: "11-01-2024T00:00:00Z" }]->(n14),
// Create Checkout Relationship for user.type = buyer
(n00)-[:CHECKOUTS { id: "n0012", fromId: "", toId: "", label: "CHECKOUTS", amount: 1, date: "11-02-2024T10:30:00Z", itemId: 00112233 }]->(n12),
// Create Cart Node
(n40:Cart { id: "n40", caption: "MattSheehanCart", label: "Cart", type: "personal", amount: 1, date: "11-02-2024T10:30:00Z", itemId: 00112233, itemName: "Pearl Earings", price: "$420.69" }),
// Create Buyer-Store Payment Relationship
(n40)-[:PAYS { id: "n4020", fromId: "", toId: "", label: "PAYS", date: "11-02-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022023" }]->(n20),
// Create Shipment Node
(n80:Shipment { id: "n80", caption: "Delivery", label: "Shipment", type: "queue", date: "11-02-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022023", cost: "$40.00", upsAddress: "", uspsAddress: "" }),
// Create Store & Seller Delivery Relationships
(n20)-[:DELIVERS { id: "n20", fromId: "", toId: "", label: "DELIVERS", amount: 1, date: "11-09-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022023", stage: "store", status: "SUCCESS" }]->(n80),
(n01)-[:DELIVERS { id: "n20", fromId: "", toId: "", label: "DELIVERS", amount: 1, date: "11-09-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022023", stage: "seller", status: "SUCCESS" }]->(n80),
// Create Store-Seller Payment Relationship
(n20)-[:PAYS { id: "n2001", fromId: "", toId: "", label: "PAYS", date: "11-02-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022023", totalPaid: "405.17" }]->(n01),
// Create Buyer Delivery Relationship
(n20)-[:DELIVERS { id: "n20", fromId: "", toId: "", label: "DELIVERS", amount: 1, date: "11-09-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022023", stage: "buyer", status: "SUCCESS" }]->(n40),
// Create Inventory Relationship
(n20)-[:UPDATES { id: "n32", fromId: "", toId: "", label: "UPDATES", targetAttr: "", date: "" }]->(n21),
// Social Interaction / Review Node
(n80:Review { id: "n80", caption: "MattsReview", label: "Review", type: "public", body: "Awesome!", date: "11-01-2024T17:00:00Z", subject: "Best Necklace", itemId: 12345678, rating: 5, userId: "n00" }),
// Social Interaction Relationships
(n00)-[:FOLLOWS { id: "n0001f", fromId: "n00", toId: "n01", label: "FOLLOWS", date: "11-12-2024T10:30:00Z", automatic: true , requireUserPermission: 0 }]->(n01),
(n00)-[:POSTS { id: "n0080pr", fromId: "n00", toId: "n80", label: "POSTS", type: "Review", storeId: "store0001", itemId: "00112233", date: "11-01-2024T17:00:00Z" }]->(n80),
(n00)-[:POSTS { id: "n0080pl", fromId: "n00", toId: "n80", label: "POSTS", type: "Like", storeId: "store0001", itemId: "00112233", date: "11-01-2024T17:00:00Z" }]->(n80),
// Create API Connector Nodes (we can have server log updates to these nodes for our backend consumption and custom metrics... fucking suck it Shopify you hot dev yuppy son bitches)
(n60:APIConnector { id: "n60", caption: "Azure", label: "APIConnector", type: "Automation", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: false }),
(n61:APIConnector { id: "n63", caption: "GoogleFirebaseDB", label: "APIConnector", type: "DBMS", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: false }),
(n62:APIConnector { id: "n61", caption: "GoogleAuth", label: "APIConnector", type: "Auth", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: true }),
(n63:APIConnector { id: "n62", caption: "GitHubAuth", label: "APIConnector", type: "Auth", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: true }),
(n64:APIConnector { id: "n64", caption: "Shopify", label: "APIConnector", type: "Shop", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: true }),
(n65:APIConnector { id: "n65", caption: "Etsy", label: "APIConnector", type: "Shop", dateCreated: "11-01-2024T00:00:00Z", payToUse: true , global: true }),
(n66:APIConnector { id: "n66", caption: "Ebay", label: "APIConnector", type: "Shop", dateCreated: "11-01-2024T00:00:00Z", payToUse: true , global: true }),
(n67:APIConnector { id: "n67", caption: "FBMarketPlace", label: "APIConnector", type: "Shop", dateCreated: "11-01-2024T00:00:00Z", payToUse: true , global: true }),
(n68:APIConnector { id: "n68", caption: "AWS", label: "APIConnector", type: "Shop", dateCreated: "11-01-2024T00:00:00Z", payToUse: true , global: true }),
// TODO: Finish --> AUTH + RBAC node attributes
(n50:Auth { id: "n50", caption: "", label: "", type: "" }),
(n51:RBAC { id: "n51", caption: "", label: "", type: "" }),
// TODO: Finish --> SignsIn + SignsOut + SignUp + Forget node attributes
(n70:SignIn { id: "n70", caption: "", label: "", type: "" }),
(n71:SignOut { id: "n71", caption: "", label: "", type: "" }),
(n72:SignUp { id: "n72", caption: "", label: "", type: "" }),
(n73:Forgets { id: "n73", caption: "", label: "", type: "" }),
// TODO: Create & Pipe --> AUTH + RBAC relationships
()-[:AUTH { }]->(),
()-[:RBAC { }]->(),
// TODO: Create & Pipe --> SignsIn + SignsOut + SignUp + Forget relationships
()-[:SignsIn { }]->(),
()-[:SignsOut { }]->(),
()-[:SignsUp { }]->(),
()-[:Forgets { }]->()
