import { Outlet, Link } from 'react-router-dom';
import './Category.styles.scss';
import ReactLogo from '../../../utils/svgs/logo.svg';

const Category = ({category}) => {
  const {app, name, title, subtitle, imageUrl, phone, email} = category;
  let theCategory;
  let imageStyle = {backgroundImage: `url(${imageUrl})`};
  const GetCategoryLink = ({body}) => {
    return name ? (
      <div className={ 'category-body-container' }>
        <div><Link to={`/${name}`}>{body}</Link></div>
        <Outlet/>
      </div>
    ) : (
      <div className={ 'category-body-container' }>
        <div>{body}</div>
      </div>
    )
  };
  switch (app) {
    case "shop": return (
      <div className={ 'category-container' }>
        <div className={ 'background-image'} style={ imageStyle } />
        <GetCategoryLink body={<div><h2>{ title }</h2><div><p>{ subtitle }</p></div></div>} />
      </div>
    );
    case "designer": return (
      <div className={ 'category-container' }>
        <div className={ 'background-image' }><img src={ReactLogo} alt={ "user-img" } /></div>
        <GetCategoryLink body={ <div><h2>{ title }</h2><div><p>{ subtitle }</p></div></div> } />
      </div>
    );
    case "about": return (
      <div className={ 'category-container' }>
        <div className={ 'background-image' }><img src={ReactLogo} alt={ "user-img" }/></div>
        <GetCategoryLink body={
          <div>
            <h2>{ title }</h2>
            { title==="Contact" ? <div><p>{phone}</p><p><u>{email}</u></p></div> : <div><p>{ subtitle }</p></div> }
          </div>
        } />
      </div>
    );
    case "home": return (
      <div className={ 'category-container' }>
        <div className={ 'background-image' } style={ imageStyle } />
        <GetCategoryLink body={ <div><h2>{ title }</h2><div><p>{ subtitle }</p></div></div> } />
      </div>
    );
    default: console.log( `category.app passed to prop is unrecognized or null: ${ app }` ); break;
  };
  return(theCategory);
};

export default Category;