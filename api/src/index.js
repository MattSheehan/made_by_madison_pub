import { ApolloServer } from '@apollo/server';
import { startStandaloneServer } from '@apollo/server/standalone';
import { Neo4jGraphQL } from "@neo4j/graphql";
import neo4j from "neo4j-driver";
// Pass environment configs as params, create new driver instance
export const getDriver = () => {
  return initDriver({
    NEO4J_URI: process.env.NEO4J_URI, 
    NEO4J_USER: process.env.NEO4J_USER, 
    NEO4J_PASSWORD: process.env.NEO4J_PASSWORD
  });
};
export async function initDriver({NEO4J_URI, NEO4J_USER, NEO4J_PASSWORD}) {
  let driver
  try {
    driver = neo4j.driver(NEO4J_URI, neo4j.auth.basic(NEO4J_USER, NEO4J_PASSWORD))
    const serverInfo = await driver.getServerInfo()
    console.log('Connection estabilished',serverInfo)
  } catch(err) {
    console.log(`Connection error\n${err}\nCause: ${err.cause}`)
    await driver.close()
    return
  }
  await driver.getServerInfo()
  return driver
};
const typeDefs = `#graphql
  type Profile {
    id: ID!
    firstName: String!
    lastName: String!
    email: String!
    username: String!
    userPassword: String!
    bio: String
    imageUrl: String
    backgroundImageUrl: String
    dateCreated: String!
    products: [Product] @relationship(type: "DESIGNS", direction: OUT, properties: "Designs")
  }
  type Designer {
    id: ID!
    name: String!
    socialUrl: String
    imageUrl: String
    backgroundImageUrl: String
    dateCreated: String!
    stores: [Shop] @relationship
    products: [Product] @relationship(type: "DESIGNS", direction: OUT, properties: "Designs")
  }
  type Shop {
    id: ID!
    name: String!
    title: String!
    subtitle: String
    imageUrl: String
    products: [Product] @relationship
    designers: [Designer] @relationship
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
    products: [Product] @relationship(type: "DESIGNS", direction: IN, properties: "Designs")
  }
  interface Designs {
    date: AWSDateTime!
    userId: ID!
    storeId: ID!
    productId: ID!
  }
`;
const neoSchema = new Neo4jGraphQL({ typeDefs, getDriver });
const server = new ApolloServer({ schema: await neoSchema.getSchema(), });
const { url } = await startStandaloneServer(server, {
  context: async ({ req, res })=>{
    let token,user;
    try {
      token = req.headers.authorization || '';
      user = await getUser(token);
      console.log(`request: ${req}\nresponse: ${res}`);
      return { req, user }
    } catch(err) {
      console.log(`ERROR\n${err}\nCause: ${err.cause}`);
      return
    }
  },
  listen: { port: 4000 },
});
console.log(`🚀 Server ready at ${url}`);