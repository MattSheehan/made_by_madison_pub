import './SearchInput.styles.scss';

const SearchInput = ({ label, ...otherProps }) => {
  return (
    <div className='group'>
      <input className='search-input' {...otherProps} />
      {label && (
        <label className={`${otherProps.value.length ? 'shrink' : ''} search-input-label`}>
          {label}
        </label>
      )}
    </div>
  );
};

export default SearchInput;