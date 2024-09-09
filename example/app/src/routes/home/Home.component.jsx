import './Home.styles.scss';
import CategoryList from '../../components/cards/CategoryList/CategoryList.component';
import '../../components/cards/CategoryList/CategoryList.component';
import SearchBar from '../../components/search/SearchBar/SearchBar.component';

const Home = () => {
  const app = {
    name: "Home",
    data: [
      {
        id: (1000001),
        name: ('shop'),
        title: ('Shop'),
        subtitle: ('Start shopping!'),
        imageUrl: ("https://i.ibb.co/cvpntL1/hats.png"),
        app: ('home')
      },
      {
        id: (1000002),
        name: ('designer'),
        title: ('Designer'),
        subtitle: ('Virtually Design your next room!'),
        imageUrl: ("https://i.ibb.co/px2tCc3/jackets.png"),
        app: ('home')
      },
      {
        id: (1000003),
        name: ('about'),
        title: ('About'),
        subtitle: <span>
          - Contact Info<br/>
          - Documentation<br/>
          - FAQs & Blogs<br/>
        </span>,
        imageUrl: ("https://i.ibb.co/GCCdy8t/womens.png"),
        app: ('home')
      }
    ]
  };
  return (
    <div className='home-container'>
      <SearchBar appName={app.name} />
      <CategoryList categories={app.data} />
    </div>
  );
};
export default Home;