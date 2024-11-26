CREATE (n001:User { id: "n001", caption: "MadisonStone", label: "User", type: "Seller", dateCreated: "11-01-2024T00:00:00Z", firstName: "Madison", id: 69100101, lastName: "Stone", email: "beany@river.com", username: "beany", userPassword: "***************", rbacId: "admin" }),
(n000:User { id: "n000", caption: "MattSheehan", label: "User", type: "Buyer", dateCreated: "11-01-2024T00:00:00Z", firstName: "Matt", id: 28282828, lastName: "Sheehan", email: "noneYa@business.com", username: "noneYa", userPassword: "****************", rbacId: "admin", address: "420 A 69th St.", city: "Denver", state: "CO", zip: 80000, `postal-box`: 69 }),
(n42069:User { id: "n42069", caption: "made_by_madison", label: "User", type: "Orchestrator", dateCreated: "11-01-2024T00:00:00Z", firstName: "madeByMadison", id: 28282828, lastName: "", email: "madeByMadison.and.mattsFUCKINGTITS@business.com", username: "madeByMadison", userPassword: "****************", rbacId: "system", address: "420 B 69th St.", city: "Denver", state: "CO", zip: 80000, `postal-box`: 420 }),
(n800:User { id: "n800", caption: "UPS", label: "User", type: "Shipper", dateCreated: "11-01-2024T00:00:00Z", firstName: "Matt", id: 28282828, lastName: "Sheehan", email: "ups@business.com", username: "UPS", userPassword: "****************", rbacId: "system", address: "420 C 69th St.", city: "Denver", state: "CO", zip: 80000, `postal-box`: 42069 }),
(n801:User { id: "n800", caption: "USPS", label: "User", type: "Shipper", dateCreated: "11-01-2024T00:00:00Z", firstName: "Matt", id: 28282828, lastName: "Sheehan", email: "usps@business.gov", username: "USPS", userPassword: "****************", rbacId: "system", address: "420 D 69th St.", city: "Denver", state: "CO", zip: 80000, `postal-box`: 69420 }),
// Create Store Node
(n20:Shop { id:"n20", caption:"made_by_madison", label:"Shop", type:"main", storeId:"store0001", productTypes:"Jewlery", tags:"Jewlery", date_created: "11-01-2024T00:00:00Z" }),
// Create Inventory Node
(n21:Inventory { id:"n21", caption:"", label:"Shop", type:"shop", tenantId:"${n20.storeId}", sellerId:"", productIds: "", tags: "", date_created: "11-01-2024T00:00:00Z" }),
// Create Product Nodes
(n12:Product {id: "n12", caption: "Jewlery", label: "Product", type: "earing", itemId: 00112233, imageUrl: "https: //photos.onedrive.com/photo/{{ID}}!{{INDEX}}", ammount: 1, sizes: "medium", material: "silver, pearls", name: "Pearl Earings", price: "$420.69", description: "Ahh fuck, you're going to get so much pussy now", creator: "beany@river.com"}),
(n13:Product {id: "n13", caption: "Jewlery", label: "Product", type: "earing", itemId: 11010010, imageUrl: "https: //photos.onedrive.com/photo/{{ID}}!{{INDEX}}", ammount: 4, sizes: "medium", material: "silver, gold", name: "Infinity Hoops", price: "$69.69", description: "Sophistication in the Simplification... said nobody dripping ever.", creator: "beany@river.com"}),
(n14:Product {id: "n14", caption: "Jewlery", label: "Product", type: "necklace", itemId: 12345678, imageUrl: "https: //photos.onedrive.com/photo/{{ID}}!{{INDEX}}", ammount: 4, sizes: "medium", material: "silver, gold", name: "Chain Necklace", price: "$500", description: "Makes you look like a fuckin G.", creator: "beany@river.com"}),
// Create Design Relationships for user.type = seller
(n001)-[:DESIGNS { id: "n00112", fromId: "", toId: "", label: "DESIGNS", date: "11-01-2024T00:00:00Z" }]->(n12),
(n001)-[:DESIGNS { id: "n00113", fromId: "", toId: "", label: "DESIGNS", date: "11-01-2024T00:00:00Z" }]->(n13),
(n001)-[:DESIGNS { id: "n00114", fromId: "", toId: "", label: "DESIGNS", date: "11-01-2024T00:00:00Z" }]->(n14),
// Create Checkout Relationship for user.type = buyer
(n000)-[:CHECKOUTS { id: "n0012", fromId: "", toId: "", label: "CHECKOUTS", amount: 1, date: "11-02-2024T10:30:00Z", itemId: 00112233 }]->(n12),
// Create Cart Node
(n40:Cart { id: "n40", caption: "MattSheehanCart", label: "Cart", type: "personal", amount: 1, date: "11-02-2024T10:30:00Z", itemId: 00112233, itemName: "Pearl Earings", price: "$420.69" }),
// Create Buyer-Store Payment Relationship
(n40)-[:PAYS { id: "n4020", fromId: "", toId: "", label: "PAYS", date: "11-02-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022021" }]->(n42069),
// Create Shippers & Shipment Nodes
(n80:Shipment { id: "n80", caption: "Delivery", label: "Shipment", type: "queue", date: "11-02-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022022", cost: "$40.00", upsAddress: "", uspsAddress: "" }),
// Create Store & Seller PAY Relationships
(n42069)-[:PAYS { id: "n4206920", fromId: "", toId: "", label: "PAYS", amount: 1, date: "11-09-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022024", stage: "store", status: "SUCCESS" }]->(n800),
// Create Store & Seller DELIVERY Relationships
(n001)-[:DELIVERS { id: "n001800", fromId: "", toId: "", label: "DELIVERS", amount: 1, date: "11-09-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022025", stage: "seller", status: "SUCCESS" }]->(n800),
// Create Store & Seller PAY Relationships
(n42069)-[:PAYS { id: "n4206920", fromId: "", toId: "", label: "PAYS", amount: 1, date: "11-09-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022023", stage: "store", status: "SUCCESS" }]->(n20),
// Create Store-Seller Payment Relationship
(n42069)-[:PAYS { id: "n42069001", fromId: "", toId: "", label: "PAYS", date: "11-02-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022026", totalPaid: "405.17" }]->(n001),
// Create Buyer Delivery Relationship
(n800)-[:DELIVERS { id: "n800000", fromId: "", toId: "", label: "DELIVERS", amount: 1, date: "11-09-2024T10:30:00Z", itemId: 00112233, storeId: "store0001", transactionId: "tr123456789d09022027", stage: "buyer", status: "SUCCESS" }]->(n000),
// Create Inventory Relationship
(n20)-[:UPDATES { id: "n2021", fromId: "", toId: "", label: "UPDATES", targetAttr: "", date: "" }]->(n21),
// Social Interaction / Review Node
(n80:Review { id: "n80", caption: "MattsReview", label: "Review", type: "public", body: "Awesome!", date: "11-01-2024T17:00:00Z", subject: "Best Necklace", itemId: 12345678, rating: 5, userId: "n000" }),
// Social Interaction Relationships
(n000)-[:FOLLOWS { id: "n000001f", fromId: "n000", toId: "n001", label: "FOLLOWS", date: "11-12-2024T10:30:00Z", automatic: true , requireUserPermission: 0 }]->(n001),
(n000)-[:POSTS { id: "n00080pr", fromId: "n000", toId: "n80", label: "POSTS", type: "Review", storeId: "store0001", itemId: "00112233", date: "11-01-2024T17:00:00Z" }]->(n80),
(n000)-[:POSTS { id: "n00080pl", fromId: "n000", toId: "n80", label: "POSTS", type: "Like", storeId: "store0001", itemId: "00112233", date: "11-01-2024T17:00:00Z" }]->(n80),
// Create API Connector Nodes (we can have server log updates to these nodes for our backend consumption and custom metrics... fucking suck it Shopify you hot dev yuppy son bitches)
(n600:APIConnector { id: "n600", caption: "Azure", label: "APIConnector", type: "Automation", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: false , properties: { }}),
(n610:APIConnector { id: "n610", caption: "GoogleFirebaseDB", label: "APIConnector", type: "DBMS", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: false , properties: { }}),
(n620:APIConnector { id: "n620", caption: "GoogleAuth", label: "APIConnector", type: "Auth", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: true , properties: { }}),
(n621:APIConnector { id: "n621", caption: "GitHubAuth", label: "APIConnector", type: "Auth", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: true , properties: { }}),
(n630:APIConnector { id: "n630", caption: "Shopify", label: "APIConnector", type: "Shop", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: true , properties: { }}),
(n631:APIConnector { id: "n631", caption: "Etsy", label: "APIConnector", type: "Shop", dateCreated: "11-01-2024T00:00:00Z", payToUse: true , global: true , properties: { }}),
(n632:APIConnector { id: "n632", caption: "Ebay", label: "APIConnector", type: "Shop", dateCreated: "11-01-2024T00:00:00Z", payToUse: true , global: true , properties: { }}),
(n633:APIConnector { id: "n633", caption: "FBMarketPlace", label: "APIConnector", type: "Shop", dateCreated: "11-01-2024T00:00:00Z", payToUse: true , global: true , properties: { }}),
(n634:APIConnector { id: "n634", caption: "AWS", label: "APIConnector", type: "Shop", dateCreated: "11-01-2024T00:00:00Z", payToUse: true , global: true , properties: { }}),
(n640:APIConnector { id: "n640", caption: "Stripes", label: "APIConnector", type: "Payment", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: true , properties: { }}),
(n680:APIConnector { id: "n680", caption: "UPS", label: "APIConnector", type: "Shipment", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: true , properties: { }}),
(n681:APIConnector { id: "n681", caption: "USPS", label: "APIConnector", type: "Shipment", dateCreated: "11-01-2024T00:00:00Z", payToUse: false , global: true , properties: { }}),
// TODO: Finish --> AUTH + RBAC node attributes
(n50:Auth { id: "n50", caption: "", label: "", type: "", date: "" }),
(n51:Auth { id: "n51", caption: "", label: "", type: "", date: "" }),
(n52:RBAC { id: "n52", caption: "", label: "", type: "", date: "" }),
(n53:RBAC { id: "n53", caption: "", label: "", type: "", date: "" }),
(n54:RBAC { id: "n54", caption: "", label: "", type: "", date: "" }),
(n55:RBAC { id: "n55", caption: "", label: "", type: "", date: "" }),
(n56:RBAC { id: "n56", caption: "", label: "", type: "", date: "" }),
(n57:RBAC { id: "n57", caption: "", label: "", type: "", date: "" }),
(n58:RBAC { id: "n58", caption: "", label: "", type: "", date: "" }),
(n59:RBAC { id: "n59", caption: "", label: "", type: "", date: "" }),
// TODO: Create & Pipe --> SignsIn + SignsOut + SignUp + Forget relationships
()-[:SIGNSIN { id: "n{fromId}{toId}", fromId: "n##", toId: "n##", label: "SIGNSIN" }]->(),
()-[:SIGNSOUT { id: "n{fromId}{toId}", fromId: "n##", toId: "n##", label: "SIGNSOUT" }]->(),
()-[:SIGNSUP { id: "n{fromId}{toId}", fromId: "n##", toId: "n##", label: "SIGNSUP" }]->(),
()-[:FORGETS { id: "n{fromId}{toId}", fromId: "n##", toId: "n##", label: "FORGETS" }]->(),
// TODO: Finish --> About Nodes
(n90:About { id: "n90", caption: "", label: "About", type: "", date: "" }),
(n91:About { id: "n91", caption: "", label: "About", type: "", date: "" }),
(n92:About { id: "n92", caption: "", label: "About", type: "", date: "" }),
(n93:About { id: "n93", caption: "", label: "About", type: "", date: "" }),
(n94:About { id: "n94", caption: "", label: "About", type: "", date: "" }),
(n95:About { id: "n95", caption: "", label: "About", type: "", date: "" }),
(n96:About { id: "n96", caption: "", label: "About", type: "", date: "" }),
(n97:About { id: "n97", caption: "", label: "About", type: "", date: "" }),
(n98:About { id: "n98", caption: "", label: "About", type: "", date: "" }),
(n99:About { id: "n99", caption: "", label: "About", type: "", date: "" }),
// TODO: Finish --> About relationships
(n42069)-[:POSTS { id: "", fromId: "n42069", toId: "", label: "POSTS", type: "System", storeId: "store42069", itemId: "DOCUMENT_ID", date: "11-01-2024T17:00:00Z" }]->(n90),
(n42069)-[:POSTS { id: "", fromId: "n42069", toId: "", label: "POSTS", type: "System", storeId: "store42069", itemId: "DOCUMENT_ID", date: "11-01-2024T17:00:00Z" }]->(n91),
(n42069)-[:POSTS { id: "", fromId: "n42069", toId: "", label: "POSTS", type: "System", storeId: "store42069", itemId: "DOCUMENT_ID", date: "11-01-2024T17:00:00Z" }]->(n92),
(n42069)-[:POSTS { id: "", fromId: "n42069", toId: "", label: "POSTS", type: "System", storeId: "store42069", itemId: "DOCUMENT_ID", date: "11-01-2024T17:00:00Z" }]->(n93),
(n42069)-[:POSTS { id: "", fromId: "n42069", toId: "", label: "POSTS", type: "System", storeId: "store42069", itemId: "DOCUMENT_ID", date: "11-01-2024T17:00:00Z" }]->(n94),
(n42069)-[:POSTS { id: "", fromId: "n42069", toId: "", label: "POSTS", type: "System", storeId: "store42069", itemId: "DOCUMENT_ID", date: "11-01-2024T17:00:00Z" }]->(n95),
(n42069)-[:POSTS { id: "", fromId: "n42069", toId: "", label: "POSTS", type: "System", storeId: "store42069", itemId: "DOCUMENT_ID", date: "11-01-2024T17:00:00Z" }]->(n96),
(n42069)-[:POSTS { id: "", fromId: "n42069", toId: "", label: "POSTS", type: "System", storeId: "store42069", itemId: "DOCUMENT_ID", date: "11-01-2024T17:00:00Z" }]->(n97),
(n42069)-[:POSTS { id: "", fromId: "n42069", toId: "", label: "POSTS", type: "System", storeId: "store42069", itemId: "DOCUMENT_ID", date: "11-01-2024T17:00:00Z" }]->(n98),
(n42069)-[:POSTS { id: "", fromId: "n42069", toId: "", label: "POSTS", type: "System", storeId: "store42069", itemId: "DOCUMENT_ID", date: "11-01-2024T17:00:00Z" }]->(n99)
