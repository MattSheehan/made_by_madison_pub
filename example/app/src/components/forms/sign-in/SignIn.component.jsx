import { useState } from 'react';
import FormInput from '../form-input/FormInput.component';
import AuthButton from '../../buttons/AuthButton.component';
import { createUserAuthDoc, signInUserBasicAuth, signInWithGooglePopup } from '../../../utils/firebase/firebase.utils';
import './SignIn.styles.scss';
const SignIn = () => {
  const [ formFields, setFormFields ] = useState({ email: '', password: '' });
  const { email, password } = formFields;
  const signInWithGoogle = async () => { await createUserAuthDoc(signInWithGooglePopup()) };
  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const response = await signInUserBasicAuth( email, password );
      console.log(response);
      setFormFields({ email: '', password: '' });
    } catch (error) { switch (error.code) {
      case 'auth/operation-not-allowed': {<div>{alert('firebase error')}</div>; break;}
      case 'auth/wrong-password': {<div>{alert('incorrect password for email')}</div>; break;}
      case 'auth/user-not-found': {<div>{alert('no user associated with this email')}</div>; break;}
      default: {console.log(error);}
    }}
  };
  const handleChange = (event) => {
    const { name, value } = event.target;
    setFormFields({ ...formFields, [ name ]: value });
  };
  return (
    <div className='sign-in-container'>
      <h2>Already have an account?</h2>
      <span>Sign in with your email and password</span>
      <form onSubmit={handleSubmit}>
        <FormInput
          label='Email'
          type='email'
          required={true}
          autoComplete='on'
          onChange={handleChange}
          name='email'
          value={email}
        />
        <FormInput
          label='Password'
          type='password'
          required={true}
          autoComplete='on'
          onChange={handleChange}
          name='password'
          value={password}
        />
        <div className='buttons-container'>
          <AuthButton type='submit'>Sign In</AuthButton>
          <div className='button-spacer' />
          <AuthButton type='button' buttonType='google' onClick={signInWithGoogle}>Google</AuthButton>
        </div>
      </form>
    </div>
  );
};

export default SignIn;