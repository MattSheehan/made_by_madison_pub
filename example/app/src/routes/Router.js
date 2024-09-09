import { Routes, Route } from 'react-router-dom';
import Navigation from './navigation/Navigation.component';
import Home from './home/Home.component';
import Shop from './shop/Shop.component';
import Designer from './designer/Designer.component';
import About from './about/About.component';
import Auth from './auth/Auth.component';
import './Router.scss';
const Router = () => {
  const routes = [
    {index:true,path:'',content:<Home/>},
    {index:false,path:'shop',content:<Shop/>},
    {index:false,path:'designer',content:<Designer/>},
    {index:false,path:'about',content:<About/>},
    {index:false,path:'auth',content:<Auth/>}
  ];
  return (
    <Routes>
      <Route path='/' element={<Navigation />}>{Object.keys(routes).map((key,i) => {return (
        <Route 
          key={routes[i].path}
          index={routes[i].index}
          path={routes[i].path}
          element={<div className='tab-div'>{routes[i].content}</div>}
        />
      )})}</Route>
    </Routes>
  )
};
export default Router;