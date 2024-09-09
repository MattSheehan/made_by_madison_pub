import './Shop.styles.scss';
import CategoryList from '../../components/cards/CategoryList/CategoryList.component';
import '../../components/cards/CategoryList/CategoryList.component';
import SearchBar from '../../components/search/SearchBar/SearchBar.component';

const Shop = () => {
  const app = {
    name: "Shop",
    data: [
      {
        id: 11676329,
        name: 'minimalist',
        title: 'The Minimalist',
        subtitle: 'Shop Now',
        imageUrl: "https://i.ibb.co/cvpntL1/hats.png",
        app: 'shop',
        category: 'jewlery',
        products: [
          { id: 11676329-1000001, name: null, title: null, imageUrl: "https://i.ibb.co/cvpntL1/hats.png", subtitle: null, price: null },
          { id: null, name: null, title: null, imageUrl: "https://i.ibb.co/cvpntL1/hats.png", subtitle: null, price: null }
        ]
      },
      {
        id: 24207084,
        name: 'beautiful', 
        title: 'Brilliant & Beautiful',
        subtitle: 'Shop Now',
        imageUrl: "https://i.ibb.co/px2tCc3/jackets.png",
        app: 'shop',
        category: 'jewlery', 
        products: [
          { id: 24207084-1000001, name: null, title: null, imageUrl: "https://i.ibb.co/px2tCc3/jackets.png", subtitle: null, price: null },
          { id: 24207084-1000002, name: null, title: null, imageUrl: "https://i.ibb.co/px2tCc3/jackets.png", subtitle: null, price: null }
        ]
      },
      {
        id: 45211497,
        name: 'versatile',
        title: 'Every Day Versatility',
        subtitle: 'Shop Now',
        imageUrl: "https://i.ibb.co/0jqHpnp/sneakers.png",
        app: 'shop',
        category: 'sneakers',
        products: [
          { id: 45211497-1000001, name: null, title: null, imageUrl: "https://i.ibb.co/0jqHpnp/sneakers.png", subtitle: null, price: null },
          { id: 45211497-1000002, name: null, title: null, imageUrl: "https://i.ibb.co/0jqHpnp/sneakers.png", subtitle: null, price: null }
        ]
      },
      {
        id: 37467699,
        name: 'lightweight', 
        title: 'Light Weight', 
        subtitle: 'Shop Now',
        imageUrl: "https://i.ibb.co/GCCdy8t/womens.png",
        app: 'shop', 
        category: 'womens', 
        products: [
          { id: 37467699-1000001, name: null, title: null, imageUrl: "https://i.ibb.co/GCCdy8t/womens.png", subtitle: null, price: null },
          { id: 37467699-1000002, name: null, title: null, imageUrl: "https://i.ibb.co/GCCdy8t/womens.png", subtitle: null, price: null }
        ]
      },
      {
        id: 51327012,
        name: 'stone', 
        title: 'Stone Collection',
        subtitle: 'Shop Now',
        imageUrl: "https://i.ibb.co/R70vBrQ/men.png",
        app: 'shop',
        category: 'jewlery',
        products: [
          { id: 51327012-1000001, name: null, title: null, imageUrl: "https://i.ibb.co/R70vBrQ/men.png", subtitle: null, price: null },
          { id: 51327012-1000002, name: null, title: null, imageUrl: "https://i.ibb.co/R70vBrQ/men.png", subtitle: null, price: null }
        ]
      }
    ]
  }
  return (
    <div className='shop-container'>
      <SearchBar appName={app.name} />
      <CategoryList categories={app.data} />
    </div>
  );
};
export default Shop;