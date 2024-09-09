import { GoogleAuthProvider, createUserWithEmailAndPassword, getAuth, signInWithEmailAndPassword, signInWithPopup } from 'firebase/auth';
import { getFirestore, doc, getDoc, setDoc } from 'firebase/firestore';
import { InitFBDB } from './InitFBDB.utils.js';
export const app = InitFBDB;
// Create Google Auth Store instance.
const provider = new GoogleAuthProvider();
// Select Google Auth Store 'prompt' (there's several)
provider.setCustomParameters({ prompt: 'select_account' });
// export instantiated Google Auth Store object(s).
export const auth = getAuth();
export const signInWithGooglePopup = () => {signInWithPopup(auth, provider)};
// export google firestore database instance as an object stored in a constant
export const db = getFirestore();
export const createUserAuthDoc = async (userAuth, additionalInformation={}) => {
  if (!userAuth) return;
  // doc() args = [database, collection, document.uid]
  const userDocRef = doc(db, 'users', userAuth.uid);
  const userSnapshot = await getDoc(userDocRef);
  // check if user exists in sys
  if (!userSnapshot.exists()) {
    // store fields from auth request >> store timestamp
    const { displayName, email } = userAuth;
    const createdAt = new Date();
    // write User's doc reference to their doc model
    try {
      await setDoc(userDocRef, { displayName, email, createdAt, ...additionalInformation })
    } catch (error) {
      console.log(`error creating the user, ${error.message}`)
    }
  };
  return( userDocRef )
};
export const createUserBasicAuth = async (email, password) => {
  if (!email || !password) { return };
  return await createUserWithEmailAndPassword(auth, email, password);
};
export const signInUserBasicAuth = async (email, password) => {
  if (!email || !password) { return };
  return await signInWithEmailAndPassword(auth, email, password);
};