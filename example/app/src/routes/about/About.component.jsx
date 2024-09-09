import './About.styles.scss';
import CategoryList from '../../components/cards/CategoryList/CategoryList.component';
import '../../components/cards/CategoryList/CategoryList.component';
import SearchBar from '../../components/search/SearchBar/SearchBar.component';

const About = () => {
  const app = {
    name: "About",
    data: [
      {
        id: 51177153,
        name: 'contact',
        title: 'Contact',
        subtitle: 'Reach out to a made_by_madison associate', 
        phone: '(###)###-####', 
        email: 'MSJewlerySupport@outlook.com',
        app: 'about', 
        category: 'contact', 
        products: [
          { id: 51177153-100001, name: null, title: null, subtitle: null, author: null, published: null, category: null }
        ]
      },
      {
        id: 61724819,
        name: 'designerNews',
        title: 'Designer News',
        subtitle: 'Read our top stories pulled by our top notch Designer API', 
        phone: '(###)###-####', 
        email: '',
        app: 'about', 
        category: 'news', 
        products: [
          { id: 61724819-1000001, name: null, title: null, subtitle: null, author: null, published: null, category: null },
          { id: 61724819-1000002, name: null, title: null, subtitle: null, author: null, published: null, category: null },
          { id: 61724819-1000003, name: null, title: null, subtitle: null, author: null, published: null, category: null }
        ]
      },
      {
        id: 75509308,
        name: 'madisonsBlog',
        title: 'MS Studio Blog',
        subtitle: 'Hi my name is Madison. I love beautiful things and sharing experiences', 
        phone: '(###)###-####', 
        email: 'doNotReply@gmail.com',
        app: 'about', 
        category: 'blog', 
        products: [
          { id: 75509308-1000001, name: null, title: null, subtitle: null, author: null, published: null, category: null },
          { id: 75509308-1000002, name: null, title: null, subtitle: null, author: null, published: null, category: null },
          { id: 75509308-1000003, name: null, title: null, subtitle: null, author: null, published: null, category: null }
        ]
      }
    ]
  };
  return (
    <div className='about-container'>
      <SearchBar appName={app.name} />
      <CategoryList categories={app.data} />
    </div>
  );
};

export default About;