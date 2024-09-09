import neo4j from 'neo4j-driver';
import { users } from './src/data/users';

const DATABASE = process.env.NEO4J_DBMS;

export async function initDriver({NEO4J_URI, NEO4J_USER, NEO4J_PASSWORD}) {
  // Create Driver
  let driver
  try {
    driver = neo4j.driver(NEO4J_URI, neo4j.auth.basic(NEO4J_USER, NEO4J_PASSWORD))
    const serverInfo = await driver.getServerInfo()
    console.log('Connection estabilished')
    console.log(serverInfo)
  } catch(err) {
    console.log(`Connection error\n${err}\nCause: ${err.cause}`)
    await driver.close()
    return
  }
  await driver.verifyConnectivity()
  return driver
};

export const getDriver = () => {
  // Pass environment configs as params
  return initDriver({
    NEO4J_URI: process.env.NEO4J_URI, 
    NEO4J_USER: process.env.NEO4J_USER, 
    NEO4J_PASSWORD: process.env.NEO4J_PASSWORD
  });
};

export async function closeDriver() {
  let driver
  try { 
    driver = getDriver()
    console.log('Closing Connection...')
  } catch(err) {
    console.log(`ERROR\n${err}\nCause: ${err.cause}`)
    await driver.close()
    return
  }
  await driver.close()
  console.log("Connection Closed")
};

export async function seedDB() {
  let driver
  try { 
    driver = getDriver()
  } catch(err) {
    console.log(`ERROR\n${err}\nCause: ${err.cause}`)
    closeDriver()
  }
  // CREATE nodes
  for(let user of users) {
    await driver.executeQuery(
      'MERGE (u:User {name: $user.username, joined: $user.joinDate})',
      { user: user },
      { database: DATABASE }
    )
  }
  // VERIFY nodes
  for(let user of users) {
    await driver.executeQuery(
      'MATCH (u:User {username: $user.username}) RETURN u.username, u.joinDate, u.friends',
      { user: user },
      { database: DATABASE }
    )
  }
  // CREATE relationships
  for(let user of users) {
    if(user.friends !== undefined) {
      await driver.executeQuery(`
        MATCH (u:User {name: $user.username})
        UNWIND $user.friends AS friendName
        MATCH (friend:User {name: friendName})
        MERGE (u)-[:KNOWS]->(friend)
        `, 
        { user: user },
        { database: DATABASE }
      )
    }
  }
};