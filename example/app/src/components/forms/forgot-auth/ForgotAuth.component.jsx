import { useState } from 'react';
import FormInput from '../form-input/FormInput.component';
import AuthButton from '../../buttons/AuthButton.component';
import './ForgotAuth.styles.scss';
const defaultFormFields = { email:'' };
const ForgotAuth = () => {
  const [ formFields, setFormFields ] = useState(defaultFormFields);
  const { email } = formFields;

  const handleSubmit = async ( event ) => {
    event.preventDefault();
    try {
      console.log(`sending password reset link to: ${email}`);
      setFormFields(defaultFormFields)
    } catch (error) {
      switch (error.code) {
        case 'auth/user-not-found':
          alert('no user associated with this email');
          break;
        default:
          console.log(error);
      }
    }
  };

  const handleChange = ( event ) => {
    const { name, value } = event.target;
    setFormFields({ ...formFields, [ name ]: value });
  };

  return (
    <div className='forgot-auth-container'>
      <h3>Forgot Password?</h3>
      <span>We'll send a reset link to the email on file</span>
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
        <div className='buttons-container'>
          <AuthButton type='submit'>Send Password Reset</AuthButton>
        </div>
      </form>
    </div>
  )
};

export default ForgotAuth;