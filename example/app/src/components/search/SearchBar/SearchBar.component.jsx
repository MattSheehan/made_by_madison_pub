import { Fragment } from 'react';
import { Outlet, Link } from 'react-router-dom';
import { MdAccountCircle } from "react-icons/md";
import { useState } from 'react';
import SearchInput from '../../forms/search-input/SearchInput.component'
import './SearchBar.styles.scss';
const SearchBar = ({appName}) => {
  const [ formFields, setFormFields ] = useState({ searchValue:'' });
  const { searchValue } = formFields;
  const handleSubmit = async (event) => {
    event.preventDefault();
    try {setFormFields({ searchValue: '' })} catch (error) { 
      console.log(error);
    }
  };
  const handleChange = (event) => {
    setFormFields({ ...formFields, [event.target.name]: event.target.value })
  };
  return (
    <div className='header-container'>
      <div className='title-container'><h1>{appName}</h1></div>
      <div className='search-container'>
        <form className='search-form' onSubmit={handleSubmit}>
          <SearchInput
            label='Search'
            type='text'
            required={false}
            autoComplete='on'
            onChange={handleChange}
            name='searchValue'
            value={searchValue}
          />
        </form>
      </div>
      <div className='user-container'>
        <Fragment>
          <Link className='logo' to='/auth'>
            <div className='logo-container'><h2><MdAccountCircle/></h2></div>
          </Link>
          <Outlet />
        </Fragment>
      </div>
    </div>
  );
};export default SearchBar;