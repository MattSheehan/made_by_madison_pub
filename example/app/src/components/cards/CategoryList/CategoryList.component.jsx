import './CategoryList.styles.scss';
import Category from '../Category/Category.component';

const CategoryList = ({categories}) => {
  return(
    <div className='categories-list'>
      <div className='categories-container'>
        {categories.map((category) => (
          <Category key={category.id} category={category}/>
        ))}
      </div>
    </div>
  )
};

export default CategoryList