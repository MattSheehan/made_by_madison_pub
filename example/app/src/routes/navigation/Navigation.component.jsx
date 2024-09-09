import { Fragment } from 'react';
import { Outlet, Link } from 'react-router-dom';
import './Navigation.styles.scss';
import { MdInfo, MdMuseum, MdPalette, MdStore, MdSettings } from "react-icons/md";
const Navigation = () => {
  const dirs = [
    {path:('/'), content:(<MdMuseum/>)},
    {path:('/shop'), content:(<MdStore/>)},
    {path:('/designer'), content:(<MdPalette/>)},
    {path:('/about'), content:(<MdInfo/>)},
    {path:('/settings'), content:(<MdSettings/>)},
  ];
  return (
    <div className='nav-div'>
      <Fragment>
        <div className='navigation'>{
          Object.keys(dirs).map((key,i) => {return(dirs[i].path === '/settings')?(
            <Link key={dirs[i].path} className='logo' to={dirs[i].path}>
              <br/><br/><br/><br/><br/><br/><br/><br/><br/>
              <div className='logo-container'><h2>{dirs[i].content}</h2></div>
            </Link>
          ):(
            <Link key={dirs[i].path} className='logo' to={dirs[i].path}>
              <div className='logo-container'><h2>{dirs[i].content}</h2></div>
            </Link>
          )})
        }</div>
        <Outlet />
      </Fragment>
    </div>
  )
};export default Navigation;