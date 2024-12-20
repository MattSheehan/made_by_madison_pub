export const getSchema = () => { return `#graphql
  schema {
    query: Query
    mutation: Mutation
  }
  type Query {
    getMyProfile: MyProfile!
    getOtherProfile(username: String): OtherProfile!
    getMyProducts: MyProducts!
    getOtherProducts(username: String!): OtherProducts!
    getProducts: [Product!]
  }
  type Mutation {
    createProfile: CreateProfile!
    updateProfile: UpdateProfile!
    createProduct: CreateProduct!
    removeProduct: RemoveProduct!
    addCartItem: AddCartItem!
    removeCartItem: RemoveCartItem!
    purchaseCartItem: PurchaseCartItem!
  }
`};
export const getTypeDefs = () => { return `#graphql
  # node interfaces
  interface Profile {
    id: ID!
    firstName: String!
    lastName: String!
    email: String!
    username: String!
    userPassword: String!
    bio: String
    imageUrl: String
    backgroundImageUrl: String
    dateCreated: AWSDateTime!
    products: [Product] @relationship(type: "DESIGNS", direction: OUT, properties: "Designs")
  }
  type MyProfile implements Profile {
    id: ID!
    firstName: String!
    lastName: String!
    email: String!
    username: String!
    userPassword: String!
    bio: String
    imageUrl: String
    backgroundImageUrl: String
    dateCreated: AWSDateTime!
    products: [Product] @relationship(type: "DESIGNS", direction: OUT, properties: "Designs")
  }
  type OtherProfile implements Profile {
    id: ID!
    firstName: String!
    lastName: String!
    username: String!
    bio: String
    imageUrl: String
    backgroundImageUrl: String
    dateCreated: AWSDateTime!
    products: [Product] @relationship(type: "DESIGNS", direction: OUT, properties: "Designs")
  }
  type Shop {
    id: ID!
    name: String!
    title: String!
    subtitle: String
    imageUrl: String
    products: [Product] @relationship
    designers: [Profile] @relationship
  }
  type Product {
    id: ID!
    shopId: ID!
    sellerId: ID!
    type: String!
    name: String!
    title: String!
    subtitle: String
    imageUrl: String!
    price: Int!
    currency: String!
    color: String
    care: String
    quantity: String
    sizes: [String]
    products: [Product] @relationship(type: "DESIGNS", direction: OUT, properties: "Designs")
  }
  type Cart {

  }
  # relationship interfaces
  interface Designs {
    date: AWSDateTime!
    userId: ID!
    storeId: ID!
    productId: ID!
  }
  interface ChecksOut {
    date: AWSDateTime!
    userId: ID!
    storeId: ID!
    productId: ID!
  }
  interface Pays {
    date: AWSDateTime!
    buyerId: ID!
    sellerId: ID!
    storeId: ID!
    productId: ID!
    transactionId: ID!
  }
  # GQL types
  type ProductPage {
    products: [Product!]
  }
`}